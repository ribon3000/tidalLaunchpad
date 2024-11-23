const fs = require('fs');
const EventEmitter = require('events');
const parseTidalFile = require('./tidalFileParser');

class StateManager extends EventEmitter {
  constructor(tidalManager, filePath) {
    super();
    this.tidalManager = tidalManager;
    this.filePath = filePath;
    this.sections = {};
    this.currentSection = null;

    this.reloadFile();

    // Watch for file changes
    fs.watch(this.filePath, () => {
      console.log('File changed, reloading...');
      this.reloadFile();
      this.emit('fileChanged', this.sections); // Emit event with updated sections
    });
  }

  reloadFile() {
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
