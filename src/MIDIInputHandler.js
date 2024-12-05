class MIDIInputHandler {
  constructor(midiManager, stateManager, ledManager, patternGenerator) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.ledManager = ledManager;
    this.patternGenerator = patternGenerator;

    this.modifierButtons = [108, 109, 110, 111]; // Define the last 4 Automap buttons as modifier buttons

    midiManager.addListener(this.handleMessage.bind(this));
  }

  handleMessage(message) {
    const [status, key, velocity] = message;

    // Handle Automap button press
    if (status === 176 && key >= 104 && key <= 111) {
      if (this.modifierButtons.includes(key) && velocity > 0) {
        this.handleModifierButton(key);
      } else {
        this.handleAutomapButton(key, velocity > 0);
      }
    }

    // Handle Clip Button Press (Grid Button)
    if (status === 144 && velocity > 0) {
      const row = Math.floor(key / 16);
      const col = key % 16;
      if (col > 8) {
        console.log('Invalid column: ' + col);
        return;
      }

      console.log(`Grid button pressed: row ${row}, col ${col}`);

      this.handleGridButtonPress(row, col);
    }
  }

  handleModifierButton(button) {
    const buttonIndex = this.modifierButtons.indexOf(button) + 1;

    // Toggle the state of the modifier button
    const currentState = this.stateManager.getModifierButtonState(buttonIndex);
    const newState = !currentState;
    this.stateManager.setModifierButtonState(buttonIndex, newState);

    console.log(`Modifier button ${buttonIndex} ${newState ? 'activated' : 'deactivated'}`);

    this.ledManager.updateAutomapLEDs()
    this.stateManager.reactivateAllCurrentlyPlayingClips()
  }

  handleAutomapButton(button, isPressed) {
    console.log(`Automap button ${button} ${isPressed ? 'pressed' : 'released'}`);
  }

  handleGridButtonPress(row, col) {
    const scenes = this.stateManager.getScenes();
    const sceneKey = row + 1;
    const sceneCode = scenes[sceneKey];

    if (!sceneCode) {
      console.log(`No scene found for row ${row + 1}, muting...`);
      this.stateManager.muteAllClips()
      return;
    }

    if (col === 8) {
      // Scene launch button
      this.stateManager.launchScene(row);
    } else {
      const clipKey = `d${col + 1}`;
      const clips = this.stateManager.parseClips(sceneCode);

      if (clips.hasOwnProperty(clipKey)) {
        // Activate clip and apply modifiers
        const modifiedCode = this.stateManager.modifyScene(sceneCode, clipKey);
        this.stateManager.activateClip(row, col, clipKey, modifiedCode);
      } else {
        // Mute clip
        this.stateManager.deactivateClip(col);
      }
    }
  }
}

module.exports = MIDIInputHandler;