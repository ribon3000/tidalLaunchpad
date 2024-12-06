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
    fs.watch(this.filePath, () => {
      console.log(`File ${this.filePath} changed, reloading...`);
      this.reloadFile(filePath)
    });

    this.reloadFile(this.filePath);
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
    const modifiedCode = TidalParser.modifyScene(this.state.active_buttons, sceneCode, clipKey);

    this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);

    this.clearModifiedClips(row, track);
    this.state.active_streams[`d${track + 1}`] = `scene ${row + 1}`;

    this.emit('clipActivated', { row, track, previousActiveRow: this.activeClips[track] });
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
    const modifiedScene = TidalParser.modifyScene(this.state.active_buttons, sceneCode);
  
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

    this.fileHandler.writeFile(updatedScenes);
  }
}

module.exports = StateManager;
