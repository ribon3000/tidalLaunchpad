// src/LEDManager.js

class LEDManager {
  constructor(midiManager) {
    this.midiManager = midiManager;
    this.rowMapping = [0, 16, 32, 48, 64, 80, 96, 112]; // Launchpad rows
    this.ledColors = { off: 0, on: 13, active: 63, modified: 60 };
    this.automapRow = [104,105,106,107,108,109,110,111];
  }

  updateAutomapLEDs(modifierButtons) {
    // modifierButtons: object with keys 1-4 and boolean values.
    // We map these buttons onto the automapRow starting at index 4.
    for (let i = 0; i < 4; i++) {
      const state = modifierButtons[i+1] ? this.ledColors.active : this.ledColors.off;
      this.midiManager.setLED(this.automapRow[i+4], state, true);
    }
  }

  updateRowLEDs(row, sceneCode, modifiedClips, activeClips) {
    // sceneCode: string code for the scene
    // modifiedClips: array of modified clip indexes for this row
    // activeClips: array of activeClips indexed by track

    // Parse what clips exist in this scene row
    const clips = this.parseClips(sceneCode);

    for (let col = 0; col < 8; col++) {
      const note = this.rowMapping[row] + col;
      let color;

      if (clips.hasOwnProperty(`d${col + 1}`)) {
        if (modifiedClips.includes(col)) {
          color = this.ledColors.modified; // green
        } else if (activeClips[col] === row) {
          color = this.ledColors.active; // orange
        } else {
          color = this.ledColors.on; // red
        }
      } else {
        color = this.ledColors.off;
      }

      this.midiManager.setLED(note, color);
    }
  }

  updateAllLEDs(scenes, activeClips, modifiedClipsMap, modifierButtons) {
    this.midiManager.clearLEDs();
    // Update each scene row
    Object.keys(scenes).forEach((sceneKey) => {
      const row = parseInt(sceneKey, 10) - 1;
      if (row >= 0 && row < 8) {
        const sceneCode = scenes[sceneKey];
        const modifiedClips = modifiedClipsMap[row] ? Array.from(modifiedClipsMap[row]) : [];
        this.updateRowLEDs(row, sceneCode, modifiedClips, activeClips);
      }
    });

    this.updateAutomapLEDs(modifierButtons);
  }

  // Utility method to parse clips from code
  parseClips(code) {
    const lines = code.split('\n');
    const clips = {};

    lines.forEach((line) => {
      const match = line.match(/^\s*(d[1-8])\s*\$/);
      if (match) {
        const clipName = match[1];
        clips[clipName] = line;
      }
    });

    return clips;
  }
}

module.exports = LEDManager;
