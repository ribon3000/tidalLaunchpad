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

    // Handle Clip Button Press (Grid Button)
    if (status === 144 && velocity > 0) {
      const row = Math.floor(key / 16);
      const col = key % 16;

      console.log(`Grid button pressed: row ${row}, col ${col}`);

      if (this.generateModeActive) {
        console.log(`Generating pattern for clip d${col + 1} in row ${row}`);
        this.generatePattern(row, col);
      } else {
        // Regular grid button handling
        this.handleGridButtonPress(row, col);
      }
    }
  }

  handleGridButtonPress(row, col) {
    const scenes = this.stateManager.getScenes();
    const sceneKey = row + 1;
    const sceneCode = scenes[sceneKey];
    
    if (!sceneCode) {
      console.log(`No scene found for row ${row + 1}, muting...`);
      this.stateManager.deactivateClip(col);
      return;
    }

    if (col === 8) {
      // Scene launch button
      this.stateManager.launchScene(row);
    } else {
      const clipKey = `d${col + 1}`;
      const clips = this.stateManager.parseClips(sceneCode);

      if (clips.hasOwnProperty(clipKey)) {
        // Activate clip
        this.stateManager.activateClip(row, col, clipKey, sceneCode);
      } else {
        // Mute clip
        this.stateManager.deactivateClip(col);
      }
    }
  }

  generatePattern(row, col) {
    // Use the RhythmPatternGenerator to generate a new pattern
    const clipNumber = col + 1; // Match col (0-7) to d1-d8
    const generatedPattern = this.patternGenerator.generatePattern(clipNumber);

    // Get the current scenes and replace the code for the specific clip
    const scenes = this.stateManager.getScenes();
    const sceneKey = row + 1; // Scene key is 1-based row index
    if (!scenes[sceneKey]) {
      console.log(`No scene found for row ${sceneKey}`);
      return;
    }

    // Update the scene with the generated pattern
    const updatedSceneCode = this.stateManager.updateClipInScene(scenes[sceneKey], `d${clipNumber}`, generatedPattern);

    // Write the updated scene to the file
    this.stateManager.writeSceneToFile(sceneKey, updatedSceneCode);

    // Update the LED for the modified clip (new content indication)
    this.ledManager.updateRowLEDs(row, updatedSceneCode);
  }
}

module.exports = MIDIInputHandler