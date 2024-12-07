// src/StateManager.js
const EventEmitter = require('events');
const fs = require('fs');
const TidalParser = require('./TidalParser');

class StateManager extends EventEmitter {
  constructor(tidalManager, filePath, ledManager, generatorProvider) {
    super();
    this.currentPage = 0;
    this.tidalManager = tidalManager;
    this.filePath = filePath;
    this.ledManager = ledManager;
    this.generatorProvider = generatorProvider;
    this.scenes = {};
    this.modifiedClips = {};
    this.activeClips = Array(8).fill(null); // Active clips per track
    this.pendingChanges = {}; // track -> { sceneKey, originalClipLine, newClipCode, originalSceneCode }
    this.state = { 
      active_streams: {}, 
      active_buttons: {1: false, 2: false, 3: false, 4: false} 
    };

    fs.watch(this.filePath, () => {
      console.log(`File ${this.filePath} changed, reloading...`);
      this.reloadFile(this.filePath);
    });

    this.reloadFile(this.filePath);
  }

  switchPage(page){
    this.currentPage = page;
    //this.ledManager.updatePageLEDs(page);
    this.updateAllLEDs()
  }

  getCurrentPage(){
    return this.currentPage
  }

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

    // After file changed, update LEDs
    this.updateAllLEDs();
  }

  updateAllLEDs() {
    this.ledManager.updateAllLEDs(this.scenes, this.activeClips, this.modifiedClips, this.state.active_buttons, this.currentPage, this.pendingChanges);
  }

  hasPendingChanges(trackIndex) {
    return !!this.pendingChanges[trackIndex];
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

    // Update LEDs: if there was a previously active row, update that row's LEDs
    if (previousActiveRow !== null) {
      const sceneCode = this.scenes[previousActiveRow + 1];
      const modifiedClips = this.getModifiedClips(previousActiveRow);
      this.ledManager.updateRowLEDs(previousActiveRow, sceneCode, modifiedClips, this.activeClips);
    }
  }

  muteAllClips(){
    for(let i=0;i<8;i++) {
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
    const previousActiveRow = this.activeClips[track];
    this.setActiveClip(row, track);

    // Update LEDs for the activated clip row
    const updatedSceneCode = this.scenes[row + 1];
    const modifiedClips = this.getModifiedClips(row);
    this.ledManager.updateRowLEDs(row, updatedSceneCode, modifiedClips, this.activeClips);

    // If a different row was previously active on this track, update its LEDs
    if (previousActiveRow !== null && previousActiveRow !== row) {
      const prevSceneCode = this.scenes[previousActiveRow + 1];
      const prevModifiedClips = this.getModifiedClips(previousActiveRow);
      this.ledManager.updateRowLEDs(previousActiveRow, prevSceneCode, prevModifiedClips, this.activeClips);
    }
  }

  launchScene(row) {
    const sceneKey = row + 1;
    const sceneCode = this.scenes[sceneKey];
    if (!sceneCode) {
      console.log(`No scene found for row ${sceneKey}`);
      return;
    }

    // Modify the scene to activate the desired clips
    const modifiedScene = TidalParser.modifyScene(this.state.active_buttons, sceneCode);
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

    // Update LEDs for all rows after launching scene
    this.updateAllLEDs();
  }

  setModifierButtonState(button, state) {
    this.state.active_buttons[button] = state ? !this.state.active_buttons[button] : this.state.active_buttons[button];
    // Update automap LEDs after changing modifier states
    this.ledManager.updateAutomapLEDs(this.state.active_buttons)
    //this.updateAllLEDs();

    // Resend currently playing clips with updated modifiers
    const activeClips = this.getActiveClips();
    activeClips.forEach((r, track) => {
      if (r !== null) {
        const sceneKey = r + 1;
        const sceneCode = this.scenes[sceneKey];
        if (sceneCode) {
          const clipKey = `d${track + 1}`;
          const modifiedCode = TidalParser.modifyScene(this.state.active_buttons, sceneCode, clipKey);
          this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);
        }
      }
    });
  }

  getModifierButtonState(button) {
    return this.state.active_buttons[button] || false;
  }

  getCurrentlyActiveModifierButtons(){
    return this.state.active_buttons;
  }


generateCodeForTrack(trackIndex, generatorKey) {
  // Check if there's an active clip for this track
  const row = this.activeClips[trackIndex];
  if (row === null) {
    console.log(`No active clip on track ${trackIndex+1}, can't generate new code`);
    return;
  }

  const sceneKey = row + 1;
  const sceneCode = this.scenes[sceneKey];
  if (!sceneCode) {
    console.log(`No scene found for active clip on track ${trackIndex+1}`);
    return;
  }

  const clipKey = `d${trackIndex + 1}`;
  const clips = this.parseClips(sceneCode);
  if (!clips[clipKey]) {
    console.log(`No clip found for track ${trackIndex+1} in scene ${sceneKey}`);
    return;
  }

  const originalClipLine = clips[clipKey];

  // Run the generator
  const newPattern = this.generatorProvider.runGenerator(generatorKey, trackIndex+1);

  // Construct a new scene code with the generated pattern in place of the original clip line
  const newClipCode = `  d${trackIndex+1} $ ${newPattern}`;

  // We don’t overwrite scene code in file yet, we just send to Tidal
  // But first, we must modify the scene to activate only this new clip for testing.
  // We'll reuse `modifyScene` logic by passing activeClip = clipKey.
  const newScene = this.applyNewClipToScene(sceneCode, clipKey, newClipCode);
  const modifiedScene = TidalParser.modifyScene(this.state.active_buttons, newScene, clipKey);

  // Send the modified code to Tidal
  this.tidalManager.sendCommand(`:{\n${modifiedScene}\n:}`);

  // Store pending changes
  this.pendingChanges[trackIndex] = {
    sceneKey,
    originalSceneCode: sceneCode,
    originalClipLine,
    newClipCode
  };

  // Since we've updated what's playing on Tidal, also update internal state to show that the active clip now corresponds to generated code
  // Mark this clip as "pending" somehow, or just rely on LEDs later
  this.updateAllLEDs();
}

applyNewClipToScene(sceneCode, clipKey, newClipCode) {
  const lines = sceneCode.split('\n');

  const clipStartRegex = new RegExp(`^\\s*(${clipKey})\\s*\\$`);
  const anotherClipRegex = /^\s*(d[1-8])\s*\$/;
  const sceneStartRegex = /^-- scene \d+/i;

  let clipStartIndex = -1;
  let clipEndIndex = -1;

  // Find the start of the target clip
  for (let i = 0; i < lines.length; i++) {
    if (clipStartRegex.test(lines[i])) {
      clipStartIndex = i;
      break;
    }
  }

  if (clipStartIndex === -1) {
    // Clip not found, return original scene code
    return sceneCode;
  }

  // Starting from clipStartIndex+1, find the end of the clip
  // The clip ends if we hit:
  // - An empty line
  // - Another clip line
  // - Another scene line
  for (let j = clipStartIndex + 1; j < lines.length; j++) {
    const line = lines[j].trim();

    if (line === '' || sceneStartRegex.test(line) || anotherClipRegex.test(line)) {
      // The line at j does not belong to this clip
      clipEndIndex = j - 1;
      break;
    }
  }

  // If we never hit a boundary, the clip goes until the end of the file
  if (clipEndIndex === -1) {
    clipEndIndex = lines.length - 1;
  }

  // Now we have clipStartIndex and clipEndIndex indicating the old clip block
  // Replace that entire block with newClipCode lines
  const newClipLines = newClipCode.split('\n');

  const beforeClip = lines.slice(0, clipStartIndex);
  const afterClip = lines.slice(clipEndIndex + 1);

  const updatedLines = [...beforeClip, ...newClipLines, ...afterClip];
  return updatedLines.join('\n');
}

revertPendingChanges(trackIndex) {
  const pending = this.pendingChanges[trackIndex];
  if (!pending) return;

  // Revert to originalSceneCode in Tidal
  const clipKey = `d${trackIndex + 1}`;
  const modifiedCode = TidalParser.modifyScene(this.state.active_buttons,pending.originalSceneCode,clipKey);
  this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);

  // Clear pending changes
  delete this.pendingChanges[trackIndex];

  // Update LEDs
  this.updateAllLEDs();
}

commitPendingChanges(trackIndex) {
  const pending = this.pendingChanges[trackIndex];
  if (!pending) return;

  // Commit means writing the changes to file:
  // Replace the originalClipLine in originalSceneCode with newClipCode
  const updatedSceneCode = this.applyNewClipToScene(pending.originalSceneCode, `d${trackIndex+1}`, pending.newClipCode);
  
  this.writeSceneToFile(pending.sceneKey,updatedSceneCode);

  // Clear pending changes
  delete this.pendingChanges[trackIndex];

  this.updateAllLEDs();
}

writeSceneToFile(sceneKey, updatedSceneCode) {
    const updatedScenes = { ...this.scenes };
    updatedScenes[sceneKey] = updatedSceneCode;

    // this.fileHandler.writeFile(updatedScenes);
    let fileContent = '';

    // Reconstruct the file from the scenes
    Object.keys(updatedScenes).forEach((key, index) => {
      let sceneContent = updatedScenes[key].trim();
      fileContent += `-- scene ${key}\n${sceneContent}`;
      if (index !== Object.keys(updatedScenes).length - 1) {
        fileContent += '\n\n'; // Add two newlines between scenes
      }
    });

    fs.writeFileSync(this.filePath, fileContent);
    console.log(`File updated with new scenes.`);

  }
}

module.exports = StateManager;
