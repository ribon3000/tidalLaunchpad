// src/StateManager.js
const EventEmitter = require('events');
const fs = require('fs');
const TidalParser = require('./TidalParser');

class StateManager extends EventEmitter {
  constructor(tidalManager, filePath) {
    super();
    this.tidalManager = tidalManager;
    this.filePath = filePath;
    this.scenes = {};
    this.modifiedClips = {};
    this.activeClips = Array(8).fill(null); // Active clips per track
    this.state = { active_streams: {}, active_buttons: {1: false, 2: false, 3: false, 4: false} };

    // Load file content and initialize state
    
    this.reloadFile(this.filePath);
    this.loadMetadata(this.filePath);
  }

  // Reload scenes from the file
  reloadFile(filePath) {
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const oldScenes = this.scenes;
    this.scenes = TidalParser.parseScenes(fileContent);

    if (JSON.stringify(this.scenes) === JSON.stringify(oldScenes)) {
      return;
    }

    Object.keys(this.scenes).forEach((key) => {
      const oldCode = oldScenes[key] || '';
      const newCode = this.scenes[key] || '';

      if (oldCode !== newCode) {
        const row = parseInt(key, 10) - 1;
        const modifiedInCurrentScene = TidalParser.parseModifiedClips(oldCode, newCode);

        if (!this.modifiedClips[row]) {
          this.modifiedClips[row] = new Set();
        }

        modifiedInCurrentScene.forEach((clipIndex) => {
          this.modifiedClips[row].add(clipIndex);
        });
      }
    });

    this.emit('fileChanged', this.scenes);
  }

  // Load metadata (state) from the file
  loadMetadata(filePath) {
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const metadataMatch = fileContent.match(/-- metadata:\s*(\{.*\})/);
    if (metadataMatch) {
      try {
        this.state = JSON.parse(metadataMatch[1]);
        console.log('Loaded state from metadata:', this.state);
      } catch (error) {
        console.error('Error parsing metadata:', error);
      }
    } else {
      console.log('No metadata found. Using default state.');
    }
  }

  // Save metadata (state) to the file
  saveMetadata() {
    const fileContent = fs.readFileSync(this.filePath, 'utf-8');
    const strippedContent = fileContent.replace(/-- metadata:\s*\{.*\}/, '').trim();

    const metadataString = `-- metadata: ${JSON.stringify(this.state, null, 2)}`;
    fs.writeFileSync(this.filePath, `${strippedContent}\n\n${metadataString}`);
    console.log('State saved to metadata:', this.state);
  }

  // Scene and clip management methods
  getScenes() {
    return this.scenes;
  }

  parseClips(code) {
    return TidalParser.parseClips(code);
  }

  getModifiedClips(row) {
    return Array.from(this.modifiedClips[row] || []);
  }

  clearModifiedClips(row, clipIndex = null) {
    if (this.modifiedClips[row]) {
      if (clipIndex !== null) {
        this.modifiedClips[row].delete(clipIndex);
        if (this.modifiedClips[row].size === 0) {
          delete this.modifiedClips[row];
        }
      } else {
        delete this.modifiedClips[row];
      }
    }
  }

  setActiveClip(row, track) {
    const previousActiveRow = this.activeClips[track];
    this.activeClips[track] = row;
    this.state.active_streams[`d${track + 1}`] = row !== null ? `scene ${row + 1}` : 'off';
    return previousActiveRow;
  }

  deactivateClip(track) {
    const previousActiveRow = this.activeClips[track];
    this.activeClips[track] = null;
    this.state.active_streams[`d${track + 1}`] = 'off';

    // Send the mute command to TidalCycles
    const clipNumber = track + 1;
    const muteCommand = `d${clipNumber} $ silence`;
    this.tidalManager.sendCommand(muteCommand);

    // Emit an event to update LEDs
    this.emit('clipDeactivated', { track, previousActiveRow });
  }

  reactivateAllCurrentlyPlayingClips(){
    for(const stream in this.state.active_streams){
      console.log(stream)
    }
  }

  muteAllClips(){
    for(let i=0;i<8;i++)
    {
      this.deactivateClip(i);
    }
  }

  getActiveClips() {
    return this.activeClips;
  }

  activateClip(row, track, clipKey, sceneCode) {
    const modifiedCode = this.modifyScene(sceneCode, clipKey);

    this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);

    this.clearModifiedClips(row, track);
    this.state.active_streams[`d${track + 1}`] = `scene ${row + 1}`;

    this.emit('clipActivated', { row, track, previousActiveRow: this.activeClips[track] });
  }

  modifyScene(sceneCode, activeClip = null) {
    const lines = sceneCode.split('\n');
    const clipRegex = /^\s*(d\d+)\s*\$/; // Regex to detect clip start
    const sceneRegex = /^-- scene \d+/i; // Regex to detect new scenes
    const buttonStates = this.state.active_buttons; // Active button states
  
    let isInActiveClip = false;
    let isInOtherClip = false;
    let currentClip = null;
  
    const modifiedLines = lines.map((line) => {
      // Comment out any `hush` lines when an individual clip is active
      if (activeClip && line.trim().startsWith('hush')) {
        return `--${line}`;
      }
  
      // Check for button-related comments
      const buttonMatch = line.match(/-- button (\d+)/);
      if (buttonMatch) {
        const button = parseInt(buttonMatch[1], 10);
        if (buttonStates[button] === false) {
          return `--${line}`; // Comment out lines associated with inactive buttons
        }
      }
  
      // Check for a new scene
      if (sceneRegex.test(line)) {
        isInActiveClip = false;
        isInOtherClip = false;
        currentClip = null;
        return line; // Keep scene header lines
      }
  
      // Check if the line starts a new clip
      const clipMatch = line.match(clipRegex);
      if (clipMatch) {
        currentClip = clipMatch[1];
  
        if (currentClip === activeClip || activeClip === null) {
          isInActiveClip = true;
          isInOtherClip = false;
          return line; // Keep active clip or all clips for scene launch
        } else {
          isInActiveClip = false;
          isInOtherClip = true;
          return `--${line}`; // Comment out the first line of inactive clips
        }
      }
  
      // Handle lines within the currently active or inactive clip
      if (isInActiveClip) {
        return line; // Keep lines for the active clip
      }
  
      if (isInOtherClip) {
        return `--${line}`; // Comment out lines for inactive clips
      }
  
      // Default: Keep lines unrelated to clips unless tied to an inactive button
      return line;
    });
  
    return modifiedLines.join('\n');
  }
  

  launchScene(row) {
    const sceneKey = row + 1;
    const sceneCode = this.scenes[sceneKey];
    console.log(sceneCode)
  
    if (!sceneCode) {
      console.log(`No scene found for row ${sceneKey}`);
      return;
    }
  
    // Modify the scene to activate the desired clips
    const modifiedScene = this.modifyScene(sceneCode);
  
    // Send the modified scene code to TidalCycles
    this.tidalManager.sendCommand(`:{\n${modifiedScene}\n:}`);
  
    // Parse the active clips from the scene
    const clips = TidalParser.parseClips(sceneCode);
  
    // Save the current state of active clips
    const previousActiveClips = [...this.activeClips];
    this.activeClips = Array(8).fill(null);
  
    Object.keys(clips).forEach((clipKey) => {
      const trackIndex = parseInt(clipKey.slice(1), 10) - 1;
      if (trackIndex >= 0 && trackIndex < this.activeClips.length) {
        this.activeClips[trackIndex] = row;
      }
    });
  
    this.clearModifiedClips(row);
  
    // Emit the sceneLaunched event
    this.emit('sceneLaunched', {
      row,
      activeClips: this.activeClips,
      previousActiveClips,
    });
  }
  
  

  updateClipInScene(sceneCode, clipKey, newPattern) {
    const lines = sceneCode.split('\n');
    const clipRegex = new RegExp(`^\\s*${clipKey}\\s*\\$`);
    let updated = false;
    const updatedLines = [];
    let skipLines = false;

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i];

      if (clipRegex.test(line)) {
        updated = true;
        skipLines = true;

        const newPatternLines = newPattern.trim().split('\n');
        newPatternLines[0] = `  ${clipKey} $ ${newPatternLines[0].trim()}`;

        for (let j = 1; j < newPatternLines.length; j++) {
          newPatternLines[j] = '    ' + newPatternLines[j].trim();
        }

        updatedLines.push(...newPatternLines);
        continue;
      }

      if (skipLines) {
        const isAnotherClip = /^\s*(d[1-8])\s*\$/.test(line);
        if (isAnotherClip || line.trim() === '' || /^-- section/.test(line)) {
          skipLines = false;
        } else {
          continue;
        }
      }
      updatedLines.push(line);
    }

    if (!updated) {
      const newPatternLines = newPattern.trim().split('\n');
      newPatternLines[0] = `  ${clipKey} $ ${newPatternLines[0].trim()}`;

      for (let j = 1; j < newPatternLines.length; j++) {
        newPatternLines[j] = '    ' + newPatternLines[j].trim();
      }

      updatedLines.push(...newPatternLines);
    }

    const finalLines = updatedLines.filter((line, index, arr) => {
      if (line.trim() === '' && arr[index - 1]?.trim() === '') {
        return false;
      }
      return true;
    });

    return finalLines.join('\n').trim();
  }

  setModifierButtonState(button, state) {
    this.state.active_buttons[button] = state;
  
    // Emit an event if needed (optional)
    this.emit('modifierButtonChanged', { button, state });
  }


    getModifierButtonState(button) {
      return this.state.active_buttons[button] || false;
    }

    getCurrentlyActiveModifierButtons(){
      return this.state.active_buttons
    }

  

  writeSceneToFile(sceneKey, updatedSceneCode) {
    const updatedScenes = { ...this.scenes };
    updatedScenes[sceneKey] = updatedSceneCode;

    // this.saveMetadata(); // Save metadata when writing scenes
    this.fileHandler.writeFile(updatedScenes);
  }
}

module.exports = StateManager;
