// src/LEDManager.js
class LEDManager {
  constructor(midiManager, mapping) {
    this.midiManager = midiManager;
    this.mapping = mapping;
  }

  updateAutomapLEDs(modifierButtons) {
    for (let i = 1; i <= 4; i++) {
      const active = modifierButtons[i];
      const colorName = active ? 'active' : 'off';
      const address = this.mapping.getModifierLEDAddress(i);
      const colorVal = this.mapping.getLEDColor(colorName);

      const messageType = this.mapping.getUseCCForAutomap();
      const channel = this.mapping.getModifierLEDChannel(i);

      this.setLED(address, colorVal, messageType, channel);
    }
  }


  updatePageLEDs(activePage){
    for (let i = 0; i < 4; i++) {
      const colorName = i == activePage ? 'active' : 'off';
      const address = this.mapping.getPageLEDAddress(i);
      const colorVal = this.mapping.getLEDColor(colorName);
      const messageType = this.mapping.getUseCCForAutomap();
      const channel = this.mapping.getPageLEDChannel(i);

      this.setLED(address, colorVal, messageType, channel);
    }
  }


  updateRowLEDs(row, sceneCode, modifiedClips, activeClips, pendingTracks=[]) {
    const clips = this.parseClips(sceneCode);
    const cols = this.mapping.getNumberOfColumns();
    const clipCount = 8;

    for (let col = 0; col < clipCount; col++) {
      const address = this.mapping.getClipLEDAddress(row, col);
      const channel = this.mapping.getClipLEDChannel(row, col);

      let colorName;
      if (clips.hasOwnProperty(`d${col + 1}`)) {
        if (modifiedClips.includes(col)) {
          colorName = 'modified';
        } else if (activeClips[col] === row) {
          if (pendingTracks.includes(col)) {
            colorName = 'modified';
          } else {
            colorName = 'active';
          }
        } else {
          colorName = 'on';
        }
      } else {
        colorName = 'off';
      }

      const colorVal = this.mapping.getLEDColor(colorName);
      this.setLED(address, colorVal, false, channel);
    }

    if (cols > 8) {
      const sceneLaunchAddress = this.mapping.getSceneLaunchLEDAddress(row);
      const sceneLaunchChannel = this.mapping.getSceneLaunchLEDChannel(row);
      const sceneDefined = Object.keys(clips).length > 0;
      const sceneColorVal = this.mapping.getLEDColor(sceneDefined ? 'on' : 'off');
      this.setLED(sceneLaunchAddress, sceneColorVal, false, sceneLaunchChannel);
    }
  }
  updateAllLEDs(scenes, activeClips, modifiedClipsMap, modifierButtons, activePage, pendingChanges) {
    this.clearLEDs();
    if(activePage == 0){
      const rows = Object.keys(scenes).map(k => parseInt(k,10)-1).filter(r => r >=0);
      rows.forEach((row) => {
        const sceneCode = scenes[row + 1];
        const modifiedClips = modifiedClipsMap[row] ? Array.from(modifiedClipsMap[row]) : [];
        
        // Check pendingChanges
        // If any track playing this row has pendingChanges, highlight that clip specially
        let pendingTracks = [];
        for (let track = 0; track < activeClips.length; track++) {
          if (activeClips[track] === row && pendingChanges[track]) {
            // This track has pending changes
            pendingTracks.push(track);
          }
        }
  
        // updateRowLEDs with a new parameter pendingTracks
        this.updateRowLEDs(row, sceneCode, modifiedClips, activeClips, pendingTracks);
      });
    } else {
      // Other pages: keep LEDS clear for now 
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
  setLED(note, color, sendCC = false, channel = 0) {
    // Note on (0x90) + channel, or CC (0xB0) + channel
    const base = sendCC ? 0xB0 : 0x90;
    const status = base + channel;
    this.midiManager.sendMessage([status, note, color]);
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
