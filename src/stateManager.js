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


  launchScene(row) {
    const sectionKey = row + 1;
    const sectionCode = this.sections[sectionKey];
    if (!sectionCode) {
      console.log(`No section found for row ${sectionKey}`);
      return;
    }
  
    // Send the entire section code to TidalCycles
    this.tidalManager.sendCommand(`:{\n${sectionCode}\n:}`);
  
    // Update active streams
    const streams = TidalParser.parseStreams(sectionCode);
    const previousActiveStreams = [...this.activeStreams]; // Copy of previous active streams
    // Reset activeStreams and set the streams from the current scene
    this.activeStreams = Array(8).fill(null);
    Object.keys(streams).forEach((streamKey) => {
      const streamIndex = parseInt(streamKey.slice(1), 10) - 1;
      this.activeStreams[streamIndex] = row;
    });
  
    // Clear modified streams for this row
    this.clearModifiedStreams(row);
  
    // Emit an event with the row and the active streams
    this.emit('sceneLaunched', {
      row,
      activeStreams: this.activeStreams,
      previousActiveStreams,
    });
  }


  updateStreamInSection(sectionCode, streamKey, newPattern) {
    const lines = sectionCode.split('\n');
    const streamRegex = new RegExp(`^\\s*${streamKey}\\s*\\$`);
    let updated = false;
    const updatedLines = [];
    let skipLines = false;

    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];

        if (streamRegex.test(line)) {
            // Start of the stream block to replace
            updated = true;
            skipLines = true;

            // Prepare the new stream code
            const newPatternLines = newPattern.trim().split('\n');
            newPatternLines[0] = `  ${streamKey} $ ${newPatternLines[0].trim()}`;

            for (let j = 1; j < newPatternLines.length; j++) {
                newPatternLines[j] = '    ' + newPatternLines[j].trim(); // Indent subsequent lines
            }

            updatedLines.push(...newPatternLines);
            continue;
        }

        if (skipLines) {
            // Check if the line is the start of another stream or end of the block
            const isAnotherStream = /^\s*(d[1-8])\s*\$/.test(line);
            if (isAnotherStream || line.trim() === '' || /^-- section/.test(line)) {
                skipLines = false;
            } else {
                continue; // Skip lines belonging to the old stream block
            }
        }
        updatedLines.push(line);
    }

    // If streamKey not found, append it to the section
    if (!updated) {
        const newPatternLines = newPattern.trim().split('\n');
        newPatternLines[0] = `  ${streamKey} $ ${newPatternLines[0].trim()}`;

        for (let j = 1; j < newPatternLines.length; j++) {
            newPatternLines[j] = '    ' + newPatternLines[j].trim(); // Indent subsequent lines
        }

        updatedLines.push(...newPatternLines);
    }

    // Remove any extra blank lines
    const finalLines = updatedLines.filter((line, index, arr) => {
        // Remove consecutive blank lines
        if (line.trim() === '' && arr[index - 1]?.trim() === '') {
            return false;
        }
        return true;
    });

    return finalLines.join('\n').trim();
}

  writeSectionToFile(sectionKey, updatedSectionCode) {
    // Create a copy of the sections
    const updatedSections = { ...this.sections };
    updatedSections[sectionKey] = updatedSectionCode;

    // Write the updated sections back to the file
    this.fileWatcher.writeFile(updatedSections);
  }

  activateStream(row, col, streamKey, sectionCode) {
    // Step 1: Set the active stream
    const previousActiveRow = this.setActiveStream(row, col);
  
    // Step 2: Modify the section to activate only the desired stream
    const modifiedCode = this.modifySection(sectionCode, streamKey);
  
    // Step 3: Send the command to TidalManager to activate the stream
    this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);
  
    // Step 4: Clear the modified status for the activated stream
    this.clearModifiedStreams(row, col); // 'col' is the stream index
  
    // Step 5: Notify that the stream has been activated
    this.emit('streamActivated', { row, col, previousActiveRow });
  }


deactivateStream(col) {
  const previousActiveRow = this.activeStreams[col];
  this.activeStreams[col] = null;

  // Send the mute command to TidalCycles
  const streamNumber = col + 1;
  const muteCommand = `d${streamNumber} $ silence`;
  this.tidalManager.sendCommand(muteCommand);

  // Emit an event to update LEDs
  this.emit('streamDeactivated', { col, previousActiveRow });
}

}

module.exports = StateManager;
