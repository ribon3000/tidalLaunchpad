const { parseStreams } = require('./utils');

class LEDManager {
    constructor(midiManager, stateManager) {
      this.midiManager = midiManager;
      this.stateManager = stateManager;
      this.rowMapping = [0, 16, 32, 48, 64, 80, 96, 112]; // Launchpad rows
      this.ledColors = { off: 0, on: 3, active: 35, modified: 60 }; // Add more colors if needed
      this.activeStreams = Array(8).fill(null); // Track active streams per column
    }
  
    updateRowLEDs(row, sectionCode) {
        const streams = this.stateManager.parseStreams(sectionCode);
        const modifiedStreams = this.stateManager.getModifiedStreams(row);
    
        for (let col = 0; col < 8; col++) {
          const note = this.rowMapping[row] + col;
          if (streams.includes(`d${col + 1}`)) {
            const color = modifiedStreams.includes(col) 
              ? this.ledColors.modified 
              : this.activeStreams[col] === row 
              ? this.ledColors.active 
              : this.ledColors.on;
            this.midiManager.setLED(note, color);
          } else {
            this.midiManager.setLED(note, this.ledColors.off);
          }
        }
        // Light up the scene launch button (optional: keep it simple for now)
        const sceneButton = this.rowMapping[row] + 8;
        this.midiManager.setLED(sceneButton, this.ledColors.on);
      }
  
    updateModifiedRows() {
      const modifiedSections = this.stateManager.getModifiedSections();
      const sections = this.stateManager.getSections();
  
      modifiedSections.forEach((sectionKey) => {
        const row = parseInt(sectionKey, 10) - 1; // Convert section key to row index
        const sectionCode = sections[sectionKey];
        this.updateRowLEDs(row, sectionCode, true);
      });
  
      // Clear modified sections after updating LEDs
      this.stateManager.clearModifiedSections();
    }
  
    updateAllLEDs() {
        const sections = this.stateManager.getSections();
        this.midiManager.clearLEDs();
        Object.keys(sections).forEach((sectionKey, index) => {
          const sectionCode = sections[sectionKey];
          this.updateRowLEDs(index, sectionCode);
        });
      }
  
    highlightActiveStream(row, streamIndex) {
      const note = this.rowMapping[row] + streamIndex;
      this.midiManager.setLED(note, this.ledColors.active);
    }

  setActiveStream(row, col) {
    // Deactivate the previously active stream in the column
    const prevActiveRow = this.activeStreams[col];
    if (prevActiveRow !== null) {
      const sections = this.stateManager.getSections();
      const sectionCode = sections[prevActiveRow + 1];
      this.updateRowLEDs(prevActiveRow, sectionCode);
    }

    // Set the new active stream
    this.activeStreams[col] = row;
    const sections = this.stateManager.getSections();
    const sectionCode = sections[row + 1];
    this.updateRowLEDs(row, sectionCode);
  }
}
  
  
  module.exports = LEDManager;
  