class LEDManager {
    constructor(midiManager, stateManager) {
      this.midiManager = midiManager;
      this.stateManager = stateManager;
      this.rowMapping = [0, 16, 32, 48, 64, 80, 96, 112]; // Launchpad rows
      this.ledColors = { off: 0, on: 3, active: 35, modified: 60 };
      this.activeStreams = Array(8).fill(null); // Track active streams per column
    }

    updateRowLEDs(row, sectionCode) {
        const streams = this.stateManager.parseStreams(sectionCode);
        const modifiedStreams = this.stateManager.getModifiedStreams(row);
      
        console.log(`Updating LEDs for row ${row} with streams:`, streams);
      
        for (let col = 0; col < 8; col++) {
          const note = this.rowMapping[row] + col;
          let color;
      
          // Check if the stream exists in the parsed streams object
          if (streams.hasOwnProperty(`d${col + 1}`)) {
            if (modifiedStreams.includes(col)) {
              color = this.ledColors.modified; // Highlight modified stream
            } else if (this.activeStreams[col] === row) {
              color = this.ledColors.active; // Highlight active stream
            } else {
              color = this.ledColors.on; // Default color for an unmodified, available stream
            }
          } else {
            color = this.ledColors.off; // No stream available at this button position
          }
      
          console.log(`Setting LED for note ${note} in row ${row}, column ${col} to color ${color}`);
          this.midiManager.setLED(note, color);
        }
      }
      
    updateAllLEDs() {
      console.log("Updating all LEDs...");
      const sections = this.stateManager.getSections();
      this.midiManager.clearLEDs();
      Object.keys(sections).forEach((sectionKey, index) => {
        const sectionCode = sections[sectionKey];
        this.updateRowLEDs(index, sectionCode);
      });
    }
  
    setActiveStream(row, col) {
    console.log(`Activating stream in row ${row}, column ${col}`);

    // Deactivate the previously active stream in the column
    const prevActiveRow = this.activeStreams[col];
    if (prevActiveRow !== null && prevActiveRow !== row) {
        console.log(`Deactivating previous active stream in row ${prevActiveRow}, column ${col}`);
        const sections = this.stateManager.getSections();
        const sectionCode = sections[prevActiveRow + 1];
        this.activeStreams[col] = null; // Clear previous active stream tracking
        this.updateRowLEDs(prevActiveRow, sectionCode);
    }

    // Set the new active stream
    this.activeStreams[col] = row;

    // Clear modified status for the activated stream
    this.stateManager.clearModifiedStreams(row, col);

    // Update the LEDs
    const sections = this.stateManager.getSections();
    const sectionCode = sections[row + 1];
    this.updateRowLEDs(row, sectionCode);
    }

      
      deactivateStream(col) {
        console.log(`Deactivating stream in column ${col}`);
      
        // Deactivate the currently active stream in the column
        const prevActiveRow = this.activeStreams[col];
        if (prevActiveRow !== null) {
          const sections = this.stateManager.getSections();
          const sectionCode = sections[prevActiveRow + 1];
          this.activeStreams[col] = null; // Clear active stream tracking
          this.updateRowLEDs(prevActiveRow, sectionCode);
        }
      }      
  
    setSceneActive(row) {
      console.log(`Setting all streams in row ${row} as active`);
  
      // Deactivate all other streams
      this.activeStreams.fill(null);
      const sections = this.stateManager.getSections();
  
      // Update LEDs for all rows
      Object.keys(sections).forEach((sectionKey, index) => {
        this.updateRowLEDs(index, sections[sectionKey]);
      });
  
      // Set all streams in the row as active
      for (let col = 0; col < 8; col++) {
        this.activeStreams[col] = row;
      }
  
      // Update LEDs for the active row
      const sectionCode = sections[row + 1];
      this.updateRowLEDs(row, sectionCode);
    }
  }
  
  module.exports = LEDManager;
  