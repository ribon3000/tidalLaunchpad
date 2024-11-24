// src/stateManager.js
const EventEmitter = require('events');
const FileWatcher = require('./FileWatcher');
const TidalParser = require('./TidalParser');

class StateManager extends EventEmitter {
  constructor(tidalManager, filePath) {
    super();
    this.tidalManager = tidalManager;
    this.filePath = filePath;
    this.sections = {};
    this.modifiedStreams = {};
    this.isFirstLoad = true;

    this.fileWatcher = new FileWatcher(filePath);
    this.fileWatcher.on('fileChanged', (fileContent) => {
      this.reloadFile(fileContent);
      this.emit('fileChanged', this.sections);
    });

    this.reloadFile(this.fileWatcher.readFile());
  }

  reloadFile(fileContent) {
    const oldSections = this.sections;
    this.sections = TidalParser.parseSections(fileContent);
  
    if (this.isFirstLoad) {
      this.modifiedStreams = {};
      this.isFirstLoad = false;
      return;
    }
  
    if (JSON.stringify(this.sections) === JSON.stringify(oldSections)) {
      return; // No changes detected
    }
  
    Object.keys(this.sections).forEach((key) => {
      const oldCode = oldSections[key] || '';
      const newCode = this.sections[key] || '';
  
      if (oldCode !== newCode) {
        const row = parseInt(key, 10) - 1;
        const modifiedInCurrentSection = TidalParser.parseModifiedStreams(oldCode, newCode);
  
        if (!this.modifiedStreams[row]) {
          this.modifiedStreams[row] = new Set();
        }
  
        modifiedInCurrentSection.forEach((streamIndex) => {
          this.modifiedStreams[row].add(streamIndex);
        });
      }
    });
  }

  parseStreams(code) {
    return TidalParser.parseStreams(code);
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
          return line;
        } else {
          isInActiveStream = false;
          isInOtherStream = true;
          return `--${line}`;
        }
      }

      if (isInActiveStream) {
        return line;
      }

      if (isInOtherStream) {
        return `--${line}`;
      }

      return line;
    });

    return modifiedLines.join('\n');
  }
}

module.exports = StateManager;
