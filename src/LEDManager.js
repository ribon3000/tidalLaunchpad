// src/LEDManager.js

class LEDManager {
  constructor(midiManager, stateManager) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.rowMapping = [0, 16, 32, 48, 64, 80, 96, 112]; // Launchpad rows
    this.ledColors = { off: 0, on: 3, active: 35, modified: 60 };
  }

  updateRowLEDs(row, sectionCode) {
    const streams = this.stateManager.parseStreams(sectionCode);
    const modifiedStreams = this.stateManager.getModifiedStreams(row);
    const activeStreams = this.stateManager.getActiveStreams();

    for (let col = 0; col < 8; col++) {
      const note = this.rowMapping[row] + col;
      let color;

      if (streams.hasOwnProperty(`d${col + 1}`)) {
        if (modifiedStreams.includes(col)) {
          color = this.ledColors.modified; // Highlight modified stream
        } else if (activeStreams[col] === row) {
          color = this.ledColors.active; // Highlight active stream
        } else {
          color = this.ledColors.on; // Default color for an unmodified, available stream
        }
      } else {
        color = this.ledColors.off; // No stream available at this button position
      }

      this.midiManager.setLED(note, color);
    }
  }

  updateAllLEDs() {
    const sections = this.stateManager.getSections();
    this.midiManager.clearLEDs();
    Object.keys(sections).forEach((sectionKey) => {
      const row = parseInt(sectionKey, 10) - 1;
      if (row >= 0 && row < 8) {
        const sectionCode = sections[sectionKey];
        this.updateRowLEDs(row, sectionCode);
      }
    });
  }

  setActiveStream(row, col) {
    console.log(`Activating stream in row ${row}, column ${col}`);

    // Deactivate the previously active stream in the column
    const previousActiveRow = this.stateManager.setActiveStream(row, col);
    if (previousActiveRow !== null && previousActiveRow !== row) {
      console.log(`Deactivating previous active stream in row ${previousActiveRow}, column ${col}`);
      const sections = this.stateManager.getSections();
      const sectionCode = sections[previousActiveRow + 1];
      this.updateRowLEDs(previousActiveRow, sectionCode);
    }

    // Update the LEDs for the newly activated row
    const sectionCode = this.stateManager.getSections()[row + 1];
    this.updateRowLEDs(row, sectionCode);
  }

  deactivateStream(col) {
    console.log(`Deactivating stream in column ${col}`);

    const previousActiveRow = this.stateManager.getActiveStreams()[col];
    if (previousActiveRow !== null) {
      const sections = this.stateManager.getSections();
      const sectionCode = sections[previousActiveRow + 1];
      this.stateManager.deactivateStream(col);
      this.updateRowLEDs(previousActiveRow, sectionCode);
    }
  }

  setSceneActive(row) {
    console.log(`Setting all streams in row ${row} as active`);

    // Deactivate all other streams
    for (let col = 0; col < 8; col++) {
      this.stateManager.deactivateStream(col);
    }
    const sections = this.stateManager.getSections();

    // Update LEDs for all rows
    Object.keys(sections).forEach((sectionKey, index) => {
      this.updateRowLEDs(index, sections[sectionKey]);
    });

    // Set all streams in the row as active
    for (let col = 0; col < 8; col++) {
      this.stateManager.setActiveStream(row, col);
    }

    // Update LEDs for the active row
    const sectionCode = sections[row + 1];
    this.updateRowLEDs(row, sectionCode);
  }
}

module.exports = LEDManager;
