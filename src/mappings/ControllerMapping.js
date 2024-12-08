// ControllerMapping.js (interface-like)
class ControllerMapping {
    // Parse a raw MIDI message and return a normalized event
    parseMessage(status, key, velocity) {
      // e.g. return { type: 'clipPress', row: 2, col: 3 } or null if irrelevant
    }

    getUseCCForAutomap(){
      return false
    }
  
    // Given row/col, return the MIDI note or CC number for the LED
    getClipLEDAddress(row, col) {}
  
    // Return the LED address for a modifier button at a given index
    getModifierLEDAddress(modIndex) {}
  
    // Return the LED address for a scene launch button at a given row, if applicable
    getSceneLaunchLEDAddress(row) {}
  
    // Return the MIDI velocity/value for a given color name
    getLEDColor(colorName) {}
    
    // Optionally: dimensions
    getNumberOfRows() { return 8; }
    getNumberOfColumns() { return 9; } // 8 clips + 1 scene launch column for Launchpad
  }
  

module.exports = ControllerMapping;