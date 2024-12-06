// src/LEDManager.js
class LEDManager {
  constructor(midiManager, mapping) {
    this.midiManager = midiManager;
    this.mapping = mapping;
  }

  updateAutomapLEDs(modifierButtons) {
    // modifierButtons is an object like {1: true/false, 2: true/false, etc.}
    for (let i = 1; i <= 4; i++) {
      const active = modifierButtons[i];
      const colorName = active ? 'active' : 'off';
      const address = this.mapping.getModifierLEDAddress(i);
      const colorVal = this.mapping.getLEDColor(colorName);
      this.setLED(address, colorVal, true);
    }
  }

  updatePageLEDs(activePage){
    for (let i = 0; i < 4; i++) {
      const colorName = i == activePage ? 'active' : 'off';
      const address = this.mapping.getPageLEDAddress(i);
      const colorVal = this.mapping.getLEDColor(colorName);
      this.setLED(address, colorVal, true);
    }
  }

  updateRowLEDs(row, sceneCode, modifiedClips, activeClips) {
    // sceneCode: string code for the scene
    // modifiedClips: array of modified clip indexes for this row
    // activeClips: array of activeClips indexed by track

    const clips = this.parseClips(sceneCode);

    // The mapping defines how many clips per row (e.g., 8)
    const cols = this.mapping.getNumberOfColumns();
    // Typically, you have 8 clips plus one scene launch column; 
    // adjust as needed based on your mapping if scene launch is in that row.
    // If the last column is for scene launch, you might do cols-1 for actual clips.
    const clipCount = 8; // assuming 8 clips and 1 scene column.

    for (let col = 0; col < clipCount; col++) {
      const address = this.mapping.getClipLEDAddress(row, col);
      let colorName;
      if (clips.hasOwnProperty(`d${col + 1}`)) {
        if (modifiedClips.includes(col)) {
          colorName = 'modified';
        } else if (activeClips[col] === row) {
          colorName = 'active';
        } else {
          colorName = 'on';
        }
      } else {
        colorName = 'off';
      }
      const colorVal = this.mapping.getLEDColor(colorName);
      this.setLED(address, colorVal);
    }

    // If the mapping includes a scene launch column, update that LED as well
    if (cols > 8) {
      const sceneLaunchAddress = this.mapping.getSceneLaunchLEDAddress(row);
      // Decide what color scene launch LED should have. 
      // For example, "on" if the scene is defined, "off" otherwise:
      const sceneDefined = Object.keys(clips).length > 0;
      const sceneColorVal = this.mapping.getLEDColor(sceneDefined ? 'on' : 'off');
      this.setLED(sceneLaunchAddress, sceneColorVal);
    }
  }

  updateAllLEDs(scenes, activeClips, modifiedClipsMap, modifierButtons, activePage) {
    this.clearLEDs();
    if(activePage == 0){
      const rows = Object.keys(scenes).map(k => parseInt(k,10)-1).filter(r => r >=0);
      rows.forEach((row) => {
        const sceneCode = scenes[row + 1];
        const modifiedClips = modifiedClipsMap[row] ? Array.from(modifiedClipsMap[row]) : [];
        this.updateRowLEDs(row, sceneCode, modifiedClips, activeClips);
      });
    } else {
      //keep LEDS clear for now 
    }
    this.updateAutomapLEDs(modifierButtons);
    this.updatePageLEDs(activePage)
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

  // Set LED state for a specific button
  setLED(note, color, sendCC = false) {
    this.midiManager.sendMessage([sendCC ? 176 : 144, note, color]);
  }

  // Clear all LEDs
  clearLEDs() {
    // It's still okay to just iterate over all possible notes and turn them off.
    // Alternatively, the mapping could define how to clear. 
    for (let note = 0; note < 128; note++) {
      this.setLED(note, this.mapping.getLEDColor('off'));
      this.setLED(note,this.mapping.getLEDColor('off'),true); //also reset cc's to 0
    }
  }
}

module.exports = LEDManager;
