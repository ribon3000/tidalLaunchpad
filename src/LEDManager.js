const { parseStreams } = require('./utils');

class LEDManager {
    constructor(midiManager, stateManager) {
      this.midiManager = midiManager;
      this.stateManager = stateManager;
      this.rowMapping = [0, 16, 32, 48, 64, 80, 96, 112]; // Launchpad rows
      this.ledColors = { off: 0, on: 3, active: 35, modified: 16 }; // Add more colors if needed
    }
  
    updateRowLEDs(row, sectionCode) {
      const streams = parseStreams(sectionCode);
  
      for (let col = 0; col < 8; col++) {
        const note = this.rowMapping[row] + col;
        const color = streams.includes(`d${col + 1}`) ? this.ledColors.on : this.ledColors.off;
        this.midiManager.setLED(note, color);
      }
  
      // Light up the scene launch button
      const sceneButton = this.rowMapping[row] + 8;
      this.midiManager.setLED(sceneButton, this.ledColors.on);
    }
  
    updateAllLEDs() {
        const sections = this.stateManager.getSections();
        const modifiedSections = this.stateManager.getModifiedSections();
      
        this.midiManager.clearLEDs();
        Object.keys(sections).forEach((section, index) => {
          this.updateRowLEDs(index, sections[section]);
          if (modifiedSections.includes(section)) {
            this.highlightModifiedRow(index);
          }
        });
      
        // Clear modified sections after updating LEDs
        this.stateManager.clearModifiedSections();
      }
  
    highlightActiveStream(row, streamIndex) {
      const note = this.rowMapping[row] + streamIndex;
      this.midiManager.setLED(note, this.ledColors.active);
    }
  
    highlightModifiedRow(row) {
      const sceneButton = this.rowMapping[row] + 8;
      this.midiManager.setLED(sceneButton, this.ledColors.modified);
    }
  }
  
  module.exports = LEDManager;
  