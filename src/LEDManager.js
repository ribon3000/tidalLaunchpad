// src/LEDManager.js

class LEDManager {
  constructor(midiManager, stateManager) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.rowMapping = [0, 16, 32, 48, 64, 80, 96, 112]; // Launchpad rows
    this.ledColors = { off: 0, on: 13, active: 63, modified: 60 };
  }

  updateRowLEDs(row, sceneCode) {
    const clips = this.stateManager.parseClips(sceneCode);
    const modifiedClips = this.stateManager.getModifiedClips(row);
    const activeClips = this.stateManager.getActiveClips();
  
    for (let col = 0; col < 8; col++) {
      const note = this.rowMapping[row] + col;
      let color;
  
      if (clips.hasOwnProperty(`d${col + 1}`)) {
        if (modifiedClips.includes(col)) {
          color = this.ledColors.modified; // Highlight modified clip (green)
        } else if (activeClips[col] === row) {
          color = this.ledColors.active; // Highlight active clip (orange)
        } else {
          color = this.ledColors.on; // Default color for an unmodified, available clip (red)
        }
      } else {
        color = this.ledColors.off; // No clip available at this button position
      }
  
      this.midiManager.setLED(note, color);
    }
  }
  

  updateAllLEDs() {
    const scenes = this.stateManager.getScenes();
    this.midiManager.clearLEDs();
    Object.keys(scenes).forEach((sceneKey) => {
      const row = parseInt(sceneKey, 10) - 1;
      if (row >= 0 && row < 8) {
        const sceneCode = scenes[sceneKey];
        this.updateRowLEDs(row, sceneCode);
      }
    });
  }

  setActiveClip(row, col) {
    console.log(`Activating clip in row ${row}, column ${col}`);

    // Deactivate the previously active clip in the column
    const previousActiveRow = this.stateManager.setActiveClip(row, col);
    if (previousActiveRow !== null && previousActiveRow !== row) {
      console.log(`Deactivating previous active clip in row ${previousActiveRow}, column ${col}`);
      const scenes = this.stateManager.getScenes();
      const sceneCode = scenes[previousActiveRow + 1];
      this.updateRowLEDs(previousActiveRow, sceneCode);
    }

    // Update the LEDs for the newly activated row
    const sceneCode = this.stateManager.getScenes()[row + 1];
    this.updateRowLEDs(row, sceneCode);
  }

  deactivateClip(col) {
    console.log(`Deactivating clip in column ${col}`);

    const previousActiveRow = this.stateManager.getActiveClips()[col];
    if (previousActiveRow !== null) {
      const scenes = this.stateManager.getScenes();
      const sceneCode = scenes[previousActiveRow + 1];
      this.stateManager.deactivateClip(col);
      this.updateRowLEDs(previousActiveRow, sceneCode);
    }
  }

  setSceneActive(row) {
    console.log(`Setting all clips in row ${row} as active`);

    // Deactivate all other clips
    for (let col = 0; col < 8; col++) {
      this.stateManager.deactivateClip(col);
    }
    const scenes = this.stateManager.getScenes();

    // Update LEDs for all rows
    Object.keys(scenes).forEach((sceneKey, index) => {
      this.updateRowLEDs(index, scenes[sceneKey]);
    });

    // Set all clips in the row as active
    for (let col = 0; col < 8; col++) {
      this.stateManager.setActiveClip(row, col);
    }

    // Update LEDs for the active row
    const sceneCode = scenes[row + 1];
    this.updateRowLEDs(row, sceneCode);
  }


  handleSceneLaunched(row, activeClips, previousActiveClips) {
    const scenes = this.stateManager.getScenes();
  
    // Update LEDs for all rows
    for (let r = 0; r < 8; r++) {
      const sceneCode = scenes[r + 1];
      if (sceneCode) {
        this.updateRowLEDs(r, sceneCode);
      }
    }
  }
}

module.exports = LEDManager;
