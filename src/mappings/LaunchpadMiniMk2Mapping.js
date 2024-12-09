const ControllerMapping = require('./ControllerMapping')

// LaunchpadMiniMk2Mapping.js
class LaunchpadMiniMk2Mapping extends ControllerMapping {
    constructor() {
      super();
      this.rowMapping = [0,16,32,48,64,80,96,112];
      this.automapRow = [104,105,106,107,108,109,110,111];
      this.colors = { off: 0, on: 13, active: 63, modified: 60 };
      this.modifierButtons = [108, 109, 110, 111]; 
      this.pageButtons = [104, 105, 106, 107];
    }
  
    parseMessage(status, key, velocity, channel = 0) {
      // Check if it's a modifier button
      if (status === 176 && this.automapRow.includes(key)) {
        const isModifier = this.modifierButtons.indexOf(key);
        const isPageButton = this.pageButtons.indexOf(key);
        if (isModifier > -1) {
            // Check if this is write or clear
          if(isModifier === 0) { // write button
            // If velocity > 0 => pressed, else released
            return { type: 'write', pressed: velocity > 0 };
          }
          if(isModifier === 1) { // clear button
            return { type: 'clear', pressed: velocity > 0 };
          }
          if(isModifier === 2 && velocity > 0){
            return {type:'scrollUp', pressed: velocity > 0}
          }
          if(isModifier === 3 && velocity > 0){
            return {type:'scrollDown', pressed: velocity > 0}
          }
          return { type: 'modifierPress', index: isModifier + 1, active: velocity > 0 };
        } else if (isPageButton > -1) {
          // Page selection buttons, start at 104
          return { type: 'pageButton', key: key - 104, pressed: velocity > 0 };
        }
      }
  
      // Check grid button (clips)
      if (status === 144 && velocity > 0) {
        const row = Math.floor(key / 16);
        const col = key % 16;
        if (col === 8) {
          return { type: 'sceneLaunch', row: row };
        } else if (col < 8) {
          return { type: 'clipPress', row: row, col: col };
        }
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


    getUseCCForAutomap(){
      return true
    }
  
  
    getSceneLaunchLEDAddress(row) {
      // On Launchpad, scene launch buttons are col=8, so:
      return this.getClipLEDAddress(row, 8);
    }
  
    getLEDColor(colorName) {
      return this.colors[colorName] || this.colors.off;
    }
  
    getNumberOfRows() { return 8; }
    getNumberOfColumns() { return 9; }
  }
  
  module.exports = LaunchpadMiniMk2Mapping;