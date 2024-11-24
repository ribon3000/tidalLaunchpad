const fs = require('fs');
const EventEmitter = require('events');
const parseTidalFile = require('./tidalFileParser');
const { parseStreams } = require('./utils');


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
  
      Object.keys(this.sections).forEach((key) => {
        const oldCode = oldSections[key] || '';
        const newCode = this.sections[key] || '';
  
        if (oldCode !== newCode) {
          const row = parseInt(key, 10) - 1;
          this.modifiedStreams[row] = this.parseModifiedStreams(oldCode, newCode);
        }
      });
    }

    parseStreams(code) {
        return parseStreams(code)
    }
  
    parseModifiedStreams(oldCode, newCode) {
      const oldStreams = this.parseStreams(oldCode);
      const newStreams = this.parseStreams(newCode);
  
      const modified = [];
      for (let i = 0; i < 8; i++) {
        const oldStream = oldStreams[i] || '';
        const newStream = newStreams[i] || '';
  
        if (oldStream !== newStream) {
          modified.push(i);
        }
      }
  
      // If non-stream code changes, mark all as modified
      if (this.hasNonStreamChanges(oldCode, newCode)) {
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
      return this.modifiedStreams[row] || [];
    }
  
    clearModifiedStreams(row, streamIndex = null) {
      if (streamIndex !== null) {
        this.modifiedStreams[row] = this.modifiedStreams[row].filter((i) => i !== streamIndex);
      } else {
        this.modifiedStreams[row] = [];
      }
    }
    getSections() {
        return this.sections;
      }


  
      modifySection(sectionCode, activeStream) {
        const lines = sectionCode.split('\n');
        const streamRegex = /^\s*(d\d+)\s*\$/; // Matches lines starting with d1, d2, ..., d8
        let isInActiveStream = false; // Tracks if we're inside the active stream
        let isInOtherStream = false; // Tracks if we're inside another stream
    
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
