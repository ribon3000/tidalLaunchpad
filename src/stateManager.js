const fs = require('fs');
const EventEmitter = require('events');
const parseTidalFile = require('./tidalFileParser');
const { parseStreams } = require('./utils');
const { start } = require('repl');

class StateManager extends EventEmitter {
  constructor(tidalManager, filePath) {
    super();
    this.tidalManager = tidalManager;
    this.filePath = filePath;
    this.sections = {};
    this.modifiedStreams = {}; // Track modified streams by row
    this.isFirstLoad = true;

    this.reloadFile();
    fs.watch(this.filePath, () => {
      console.log('File changed, reloading...');
      this.reloadFile();
      this.emit('fileChanged', this.sections);
    });
  }

  reloadFile() {
    const oldSections = this.sections;
    this.sections = parseTidalFile(this.filePath);
  
    if (this.isFirstLoad) {
      this.modifiedStreams = {}; // Clear modifications on first load
      this.isFirstLoad = false;
      return;
    }
  
    if (JSON.stringify(this.sections) === JSON.stringify(oldSections)) {
      return; // No changes detected
    }
  
    // Iterate over all sections to update modifiedStreams
    Object.keys(this.sections).forEach((key) => {
      const oldCode = oldSections[key] || '';
      const newCode = this.sections[key] || '';
  
      if (oldCode !== newCode) {
        const row = parseInt(key, 10) - 1;
        const modifiedInCurrentSection = this.parseModifiedStreams(oldCode, newCode);
  
        if (!this.modifiedStreams[row]) {
          this.modifiedStreams[row] = new Set(); // Use Set to avoid duplicates
        }
  
        modifiedInCurrentSection.forEach((streamIndex) => {
          this.modifiedStreams[row].add(streamIndex);
        });
      }
    });
  }

  parseStreams(code) {
    return parseStreams(code);
  }

  parseModifiedStreams(oldCode, newCode) {
    // Function to remove comments and blank lines
    const removeCommentsAndBlanks = (lines) => {
      return lines.filter(line => !/^\s*--/.test(line) && line.trim() !== '');
    };
  
    // Split code into lines and remove comments/blanks
    const oldLines = removeCommentsAndBlanks(oldCode.split('\n'));
    const newLines = removeCommentsAndBlanks(newCode.split('\n'));
  
    const oldStreams = this.parseStreams(oldCode);
    const newStreams = this.parseStreams(newCode);
  
    const modified = [];
    let nonStreamChange = false;
  
    // Compare the lines to determine modifications
    for (let i = 0; i < Math.max(oldLines.length, newLines.length); i++) {
      const oldLine = oldLines[i] || '';
      const newLine = newLines[i] || '';
  
      if (oldLine !== newLine) {
        // Check if the line belongs to a stream
        const streamMatch = newLine.match(/^\s*(d[1-8])\s*\$/);
        if (streamMatch) {
          const streamKey = streamMatch[1];
          // If the stream has changed, add it to the modified list
          const streamIndex = parseInt(streamKey.slice(1), 10) - 1;
          modified.push(streamIndex);
        } else {
          // If non-stream code has changed, mark entire section as modified
          nonStreamChange = true;
        }
      }
    }
  
    // If non-stream changes are detected, mark all streams as modified
    if (nonStreamChange) {
      return [...Array(8).keys()]; // Mark all streams as modified
    }
  
    return modified;
  }
  
  
  
  hasNonStreamChanges(oldCode, newCode) {
    const streamRegex = /^\s*(d\d+)\s*\$/gm;
    const oldNonStreamCode = oldCode.replace(streamRegex, '');
    const newNonStreamCode = newCode.replace(streamRegex, '');
    return oldNonStreamCode !== newNonStreamCode;
  }

  getModifiedStreams(row) {
    return Array.from(this.modifiedStreams[row] || []);
  }

  clearModifiedStreams(row, streamIndex = null) {
    if (this.modifiedStreams[row]) {
      if (streamIndex !== null) {
        this.modifiedStreams[row].delete(streamIndex);
        if (this.modifiedStreams[row].size === 0) {
          delete this.modifiedStreams[row];
        }
      } else {
        delete this.modifiedStreams[row];
      }
    }
  }

  getSections() {
    return this.sections;
  }

  modifySection(sectionCode, activeStream) {
    const lines = sectionCode.split('\n');
    const streamRegex = /^\s*(d\d+)\s*\$/;
    let isInActiveStream = false;
    let isInOtherStream = false;

    const modifiedLines = lines.map((line) => {
      if (line.trim().startsWith('hush')) {
        return `--${line}`;
      }

      const match = line.match(streamRegex);
      if (match) {
        const currentStream = match[1];
        if (currentStream === activeStream) {
          isInActiveStream = true;
          isInOtherStream = false;
          return line; // Leave active stream line uncommented
        } else {
          isInActiveStream = false;
          isInOtherStream = true;
          return `--${line}`; // Comment out non-active streams
        }
      }

      if (isInActiveStream) {
        return line; // Leave lines in the active stream uncommented
      }

      if (isInOtherStream) {
        return `--${line}`; // Comment out lines in other streams
      }

      return line; // Leave unrelated lines untouched
    });

    return modifiedLines.join('\n');
  }
}

module.exports = StateManager;
