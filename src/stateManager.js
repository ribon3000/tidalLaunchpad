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
    this.modifiedSections = new Set(); // Track modified sections

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

    // Determine which sections are new or changed
    Object.keys(this.sections).forEach((key) => {
      if (this.sections[key] !== oldSections[key]) {
        this.modifiedSections.add(key);
      }
    });
  }

  getSections() {
    return this.sections;
  }

  clearModifiedSections() {
    this.modifiedSections.clear();
  }

  getModifiedSections() {
    return Array.from(this.modifiedSections);
  }

  parseStreams(sectionCode) {
    return parseStreams(sectionCode);
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
