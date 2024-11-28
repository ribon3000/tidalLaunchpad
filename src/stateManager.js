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
    this.activeStreams = Array(8).fill(null); // Track active streams per column

    this.fileWatcher = new FileWatcher(filePath);
    this.fileWatcher.on('fileChanged', (fileContent) => {
      this.reloadFile(fileContent);
      this.emit('fileChanged', this.sections);
    });

    this.reloadFile(this.fileWatcher.readFile());
  }


  setActiveStream(row, col) {
    const previousActiveRow = this.activeStreams[col];
    this.activeStreams[col] = row;

    return previousActiveRow; // This allows us to deactivate the previously active LED
  }

  getActiveStreams() {
    return this.activeStreams;
  }

  deactivateStream(col) {
    this.activeStreams[col] = null;
  }

  getSections() {
    return this.sections;
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


  updateStreamInSection(sectionCode, streamKey, newPattern) {
    // Replace or add the stream in the given section
    const lines = sectionCode.split('\n');
    const streamRegex = new RegExp(`^\\s*${streamKey}\\s*\\$.*`);

    let updated = false;
    const updatedLines = lines.map((line) => {
      if (streamRegex.test(line)) {
        updated = true;
        return `\ \ ${streamKey} $ ${newPattern}`;
      }
      return line;
    });

    // If streamKey not found, append it to the section
    if (!updated) {
      updatedLines.push(`\ \ ${streamKey} $ ${newPattern}`);
    }

    return updatedLines.join('\n');
  }

  writeSectionToFile(sectionKey, updatedSectionCode) {
    // Update the internal sections object
    this.sections[sectionKey] = updatedSectionCode;

    // Write the updated sections back to the file
    this.fileWatcher.writeFile(this.sections);
  }

  activateStream(row, col, streamKey, sectionCode) {
    // Step 1: Set the active stream
    const previousActiveRow = this.setActiveStream(row, col);

    // Step 2: Modify the section to activate only the desired stream
    const modifiedCode = this.modifySection(sectionCode, streamKey);

    // Step 3: Send the command to TidalManager to activate the stream
    this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);

    // Step 4: Clear the modified status for the activated stream
    this.clearModifiedStreams(row, col);

    // Step 5: Notify LEDManager to update LEDs for the row
    this.emit('streamActivated', { row, col, previousActiveRow });
  }
}

module.exports = StateManager;
