class StateManager {
    constructor(tidalManager, filePath) {
      this.tidalManager = tidalManager;
      this.filePath = filePath;
      this.sections = {};
      this.currentSection = null;
  
      this.reloadFile();
  
      // Watch for file changes
      const fs = require('fs');
      fs.watch(this.filePath, () => {
        console.log('File changed, reloading...');
        this.reloadFile();
      });
    }
  
    reloadFile() {
      const parseTidalFile = require('./tidalFileParser');
      this.sections = parseTidalFile(this.filePath);
    }
  
    getSections() {
      return this.sections;
    }
  
    parseStreams(sectionCode) {
      const streamRegex = /\b(d\d+)\b/; // Matches d1, d2, ..., d8
      const lines = sectionCode.split('\n');
      const streams = [];
  
      for (const line of lines) {
        const match = line.match(streamRegex);
        if (match) {
          streams.push(match[1]);
        }
      }
  
      return streams;
    }

    modifySection(sectionCode, activeStream) {
        const lines = sectionCode.split('\n');
        const streamRegex = /^\s*(d\d+)\s*\$/; // Matches lines starting with d1, d2, ..., d8
        let isInActiveStream = false; // Tracks if we're inside the active stream
        let isInOtherStream = false; // Tracks if we're inside another stream
        const modifiedLines = [];
      
        for (let i = 0; i < lines.length; i++) {
          const line = lines[i];
          const match = line.match(streamRegex);
      
          if (line.trim().startsWith('hush')) {
            // Always comment out "hush"
            modifiedLines.push(`--${line}`);
            continue;
          }
      
          if (match) {
            const currentStream = match[1]; // e.g., d1, d2, etc.
      
            if (currentStream === activeStream) {
              // Enter the active stream
              isInActiveStream = true;
              isInOtherStream = false;
              modifiedLines.push(line); // Leave the active stream line uncommented
            } else {
              // Enter another stream
              isInActiveStream = false;
              isInOtherStream = true;
              modifiedLines.push(`--${line}`); // Comment out this stream line
            }
            continue;
          }
      
          if (isInActiveStream) {
            // Leave lines in the active stream uncommented
            modifiedLines.push(line);
          } else if (isInOtherStream) {
            // Comment out lines in non-active streams
            modifiedLines.push(`--${line}`);
          } else {
            // Lines outside streams are left untouched
            modifiedLines.push(line);
          }
        }
      
        return modifiedLines.join('\n');
      }
      
      
      
  }
  
  module.exports = StateManager;
  