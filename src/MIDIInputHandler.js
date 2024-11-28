class MIDIInputHandler {
  constructor(midiManager, stateManager, ledManager, patternGenerator) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.ledManager = ledManager;
    this.patternGenerator = patternGenerator;

    this.generateModeActive = false;

    midiManager.addListener(this.handleMessage.bind(this));
  }

  handleMessage(message) {
    const [status, key, velocity] = message;

    // Handle Automap button press (Generate Button)
    if (status === 176 && key >= 104 && key <= 111) {
      if (velocity > 0) {
        // Set generate mode active when Automap button is pressed
        console.log(`Generate button pressed: ${key}`);
        this.generateModeActive = true;
      } else {
        // Deactivate generate mode when button is released
        console.log(`Generate button released: ${key}`);
        this.generateModeActive = false;
      }
    }

    // Handle Stream Button Press (Grid Button)
    if (status === 144 && velocity > 0) {
      const row = Math.floor(key / 16);
      const col = key % 16;

      console.log(`Grid button pressed: row ${row}, col ${col}`);

      if (this.generateModeActive) {
        console.log(`Generating pattern for stream d${col + 1} in row ${row}`);
        this.generatePattern(row, col);
      } else {
        // Regular grid button handling
        this.handleGridButtonPress(row, col);
      }
    }
  }

  handleGridButtonPress(row, col) {
    const sections = this.stateManager.getSections();
    const sectionCode = sections[row + 1];
    
    if (!sectionCode) {
      console.log(`No section found for row ${row + 1}`);
      return;
    }

    // Existing behavior for scene or individual stream activation
    if (col === 8) {
      // Scene launch button: play entire section and set scene active
      console.log(`Launching scene for row ${row}`);
      this.stateManager.launchScene(row);
    } else {
      // Individual stream activation
      const streamKey = `d${col + 1}`;
      this.stateManager.activateStream(row, col, streamKey, sectionCode);
    }
  }

  generatePattern(row, col) {
    // Use the RhythmPatternGenerator to generate a new pattern
    const streamNumber = col + 1; // Match col (0-7) to d1-d8
    const generatedPattern = this.patternGenerator.generatePattern(streamNumber);

    // Get the current sections and replace the code for the specific stream
    const sections = this.stateManager.getSections();
    const sectionKey = row + 1; // Section key is 1-based row index
    if (!sections[sectionKey]) {
      console.log(`No section found for row ${sectionKey}`);
      return;
    }

    // Update the section with the generated pattern
    const updatedSectionCode = this.stateManager.updateStreamInSection(sections[sectionKey], `d${streamNumber}`, generatedPattern);

    // Write the updated section to the file
    this.stateManager.writeSectionToFile(sectionKey, updatedSectionCode);

    // Update the LED for the modified stream (new content indication)
    this.ledManager.updateRowLEDs(row, updatedSectionCode);
  }
}

module.exports = MIDIInputHandler