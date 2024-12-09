const ControllerMapping = require('./ControllerMapping')

// LaunchpadMiniMk2Mapping.js
class LaunchpadMiniMk2Mapping extends ControllerMapping {
    constructor() {
      super();
      this.rowMapping = [0,8,16,24,32,40,48,56];
      this.automapRow = [0,1,2,3,4,5,6,7];
      this.sceneRow = [0,1,2,3,4,5,6,7]; //separate midi channel for scenes
      this.colors = { off: 0, on: 13, active: 63, modified: 60 };
      this.modifierButtons = [4, 5, 6, 7]; 
      this.pageButtons = [0, 1, 2, 3];
    }
  
    parseMessage(status, key, velocity, channel) {
      // Check if it's a modifier button
      if (status === 146 && this.automapRow.includes(key)) {
        const isModifier = this.modifierButtons.indexOf(key);
        const isPageButton = this.pageButtons.indexOf(key);
        if (isModifier > -1) {
          // Check if this is write or clear
          if(isModifier === 0) { // write button
            // If velocity > 0 => pressed, else released
            return { type: velocity > 0 ? 'writePress' : 'writeRelease' };
          }
          if(isModifier === 1) { // clear button
            return { type: velocity > 0 ? 'clearPress' : 'clearRelease' };
          }
          if(isModifier === 2){
            return {type: velocity > 0 ? 'scrollUpPress' : 'scrollUpRelease'}
          }
          if(isModifier === 3){
            return {type: velocity > 0 ? 'scrollDownPress' : 'scrollDownRelease'}
          }
        } else if (isPageButton > -1) {
          return {type: velocity > 0 ? 'pageButtonPress' : 'pageButtonRelease', key: key}
        }
      }
  
      // Check grid button (clips)
      if (status === 144 && velocity > 0) {
        const row = Math.floor(key / 8);
        const col = key % 8;
        return { type: 'clipPress', row: row, col: col };
      }

      if (status === 145 && velocity > 0) {
        return {type: 'sceneLaunch', row: key}
      }
  
      return null; // Not a recognized event
    }
  
    getClipLEDAddress(row, col) {
      return this.rowMapping[row] + col;
    }
  
    getModifierLEDAddress(index) {
      // index 1-4 mapped to automapRow starting at position 4
      return this.automapRow[index+3]; 
    }

    getPageLEDAddress(index)
    {
      return this.pageButtons[index];
    }
  
    getSceneLaunchLEDAddress(row) {
      // On Launchpad, scene launch buttons are col=8, so:
      return this.sceneRow[row];
    }
  
    getLEDColor(colorName) {
      return this.colors[colorName] || this.colors.off;
    }

    getUseCCForAutomap(){
      return false
    }

      // Example channel assignments:
    getClipLEDChannel(row, col) {
      return 0; // Clip grid on channel 1 (0 means 0x90)
    }

    getModifierLEDChannel(index) {
      return 2; // Modifiers on channel 3 (0x92)
    }

    getSceneLaunchLEDChannel(row) {
      return 1; // Scenes on channel 2 (0x91)
    }

    getPageLEDChannel(index) {
      return 2; // Pages also on channel 3 (0x92)
    }
  
    getNumberOfRows() { return 8; }
    getNumberOfColumns() { return 9; }
  }
  
  module.exports = LaunchpadMiniMk2Mapping;