// src/StateManager.js
const EventEmitter = require('events');
const fs = require('fs');
const TidalParser = require('./TidalParser');

class StateManager extends EventEmitter {
  constructor(tidalManager, filePath, ledManager, generatorProvider) {
    super();
    this.currentPage = 0;
    this.sceneOffset = 0; 
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
    this.ledManager.updateAllLEDs(this.scenes, this.activeClips, this.modifiedClips, this.state.active_buttons, this.currentPage, this.pendingChanges, this.sceneOffset);
  }

  hasPendingChanges(trackIndex) {
    return !!this.pendingChanges[trackIndex];
  }


  getSceneOffset() {
    return this.sceneOffset;
  }

  setSceneOffset(offset) {
    // Prevent offset from going negative
    this.sceneOffset = Math.max(0, offset);
    this.updateAllLEDs();
  }



  scrollDown() {
    // Increase offset by 1 only if possible (check if scenes exist below)
    let maxSceneNumber = Math.max(...Object.keys(this.scenes).map(k=>parseInt(k,10)));
    // If top row corresponds to scene sceneOffset+1, and bottom row to scene sceneOffset+8
    // Check if we can scroll down further: (sceneOffset + 8 < maxSceneNumber)
    if (this.sceneOffset < maxSceneNumber) {
      this.sceneOffset++;
      for (let i = 0; i < this.activeClips.length; i++) {
        this.activeClips[i]--;
      }
      this.updateAllLEDs();
    }
  }

  scrollUp() {
    if (this.sceneOffset > 0) {
      this.sceneOffset--;
      for (let i = 0; i < this.activeClips.length; i++) {
        this.activeClips[i]++;
      }
      this.updateAllLEDs();
    }
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
    this.activeClips[track] = null;
    this.state.active_streams[`d${track + 1}`] = 'off';

    // Send the mute command to TidalCycles
    const clipNumber = track + 1;
    const muteCommand = `d${clipNumber} $ silence`;
    this.tidalManager.sendCommand(muteCommand);
    this.updateAllLEDs()
  }

  deactivateAllClips(){
    for(let i=0;i<8;i++){
      this.activeClips[i] = null;
      this.state.active_streams[`d${i + 1}`] = 'off';
    }
    this.tidalManager.sendCommand(`:{\nhush\n:}`)
    this.updateAllLEDs()
  }

  getActiveClips() {
    return this.activeClips;
  }

  activateClip(row, track, clipKey, sceneCode) {
    const modifiedCode = TidalParser.modifyScene(this.state.active_buttons, sceneCode, clipKey);
    this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);

    this.clearModifiedClips(row, track);
    this.setActiveClip(row, track);

    this.updateAllLEDs()
  }

  launchScene(row) {
    console.log('launching scene for '+(row+1+this.sceneOffset))
    const sceneKey = row + 1 + this.sceneOffset;
    const sceneCode = this.scenes[sceneKey];
    if (!sceneCode) {
      console.log(`No scene found for row ${sceneKey}`);
      this.deactivateAllClips()
      return;
    }

    // Modify the scene to activate the desired clips
    const modifiedScene = TidalParser.modifyScene(this.state.active_buttons, sceneCode);
    this.tidalManager.sendCommand(`:{\n${modifiedScene}\n:}`);

    // Parse the active clips from the scene
    const clips = TidalParser.parseClips(sceneCode);

    // Save the current state of active clips
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

  const sceneKey = row + 1 + this.sceneOffset;
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

  // Writes all currently active (or pending) clips into a given sceneNum.
  writeAllActiveClipsToScene(sceneNum) {
    let updatedScenes = { ...this.scenes };
    if (!updatedScenes[sceneNum]) {
      updatedScenes[sceneNum] = '';
    }
  
    let newSceneLines = [`-- scene ${sceneNum}\ndo\n  hush`];
  
    for (let track = 0; track < 8; track++) {
      const row = this.activeClips[track];
      if (row === null) continue;
  
      const originalSceneNum = row + 1 + this.sceneOffset;
      const originalSceneCode = this.scenes[originalSceneNum];
      if (!originalSceneCode) continue; 
  
      const clipKey = `d${track + 1}`;
      let clipToWrite;
  
      if (this.pendingChanges[track]) {
        // Use pending changes
        const { newClipCode } = this.pendingChanges[track];
        clipToWrite = newClipCode;
        delete this.pendingChanges[track]; // no longer pending after we write
      } else {
        // Retrieve the currently playing clip line from original scene using TidalParser
        const { found, lines } = TidalParser.getClipBlock(originalSceneCode, clipKey);
        if (found) {
          // lines represent the entire clip block
          clipToWrite = lines.join('\n');
        } else {
          // No clip found, skip
          continue;
        }
      }
  
      if (clipToWrite) newSceneLines.push(clipToWrite);
    }
  
    const finalSceneCode = newSceneLines.join('\n');
    updatedScenes[sceneNum] = finalSceneCode;
  
    this.writeFullSceneSet(updatedScenes);
    this.reloadFile(this.filePath);
    this.updateAllLEDs();
  }
  


// Writes the currently active or pending clip for a specific track into a specified clip slot (row,col).
// This effectively replaces the clip line in the target scene with the current clip's code.
writeActiveClipToSlot(row, col) {
  const sceneNum = row + 1 + this.sceneOffset;
  const track = col;
  const clipKey = `d${track + 1}`;

  const updatedScenes = { ...this.scenes };
  let sceneCode = updatedScenes[sceneNum] || (`-- scene ${sceneNum}`);

  let newClipCode;

  if (this.pendingChanges[track]) {
    // Use pending changes
    newClipCode = this.pendingChanges[track].newClipCode;
    delete this.pendingChanges[track]; // no longer pending
  } else {
    // Get the currently playing clip line from its original scene
    const activeRow = this.activeClips[track];
    if (activeRow === null) {
      console.log(`No active clip on track ${track+1}`);
      return;
    }

    const originalSceneNum = activeRow + 1 + this.sceneOffset;
    const originalSceneCode = this.scenes[originalSceneNum];
    const { found, lines } = TidalParser.getClipBlock(originalSceneCode, clipKey);

    if (!found) {
      console.log(`No original clip found in scene ${originalSceneNum} track ${track+1}`);
      return;
    }

    newClipCode = lines.join('\n');
  }

  // Insert/Replace the clip line in the target scene
  sceneCode = this.applyNewClipToScene(sceneCode, clipKey, newClipCode);
  updatedScenes[sceneNum] = sceneCode;
  this.writeFullSceneSet(updatedScenes);
  this.reloadFile(this.filePath);
  this.updateAllLEDs();
}




insertEmptySceneBelowLowestActive() {
  // Find the lowest active scene number
  const activeRows = this.activeClips.filter(r => r !== null);
  if (activeRows.length === 0) {
    // No active clips, let's insert at the bottom of existing scenes
    const maxSceneNum = Math.max(...Object.keys(this.scenes).map(n=>parseInt(n,10)),1);
    this.insertSceneAt(maxSceneNum+1);
    return;
  }

  const lowestRow = Math.max(...activeRows);
  const lowestSceneNum = lowestRow + 1 + this.sceneOffset;

  // Insert a new empty scene after lowestSceneNum
  this.insertSceneAt(lowestSceneNum + 1);
}

// Helper method to insert an empty scene at a given sceneNum position
insertSceneAt(sceneNum) {
  let updatedScenes = { ...this.scenes };

  // We must shift all scenes >= sceneNum up by one
  const allSceneNums = Object.keys(updatedScenes).map(n=>parseInt(n,10)).sort((a,b)=>a-b);
  for (let i = allSceneNums.length -1; i >= 0; i--) {
    const oldNum = allSceneNums[i];
    if (oldNum >= sceneNum) {
      // Move this scene down by one
      updatedScenes[oldNum + 1] = updatedScenes[oldNum];
      delete updatedScenes[oldNum];
    }
  }

  // Insert the new empty scene
  updatedScenes[sceneNum] = `-- scene ${sceneNum}\ndo\n  hush`; // empty scene

  this.writeFullSceneSet(updatedScenes);
  this.reloadFile(this.filePath);
  this.updateAllLEDs();
}

clearScene(sceneNum) {
  // Remove all clip lines from the scene, leaving just the scene header
  // or you could remove the entire scene block. The user story suggests clearing content,
  // so we’ll keep the scene header but no clips.

  let updatedScenes = { ...this.scenes };
  if (!updatedScenes[sceneNum]) {
    console.log(`No scene ${sceneNum} to clear.`);
    return;
  }

  updatedScenes[sceneNum] = `-- scene ${sceneNum}\ndo\n  hush`; // empty content

  this.writeFullSceneSet(updatedScenes);
  this.reloadFile(this.filePath);
  this.updateAllLEDs();
}

clearClip(row, col) {
  const sceneNum = row + 1 + this.sceneOffset;
  const updatedScenes = { ...this.scenes };
  let sceneCode = updatedScenes[sceneNum];
  if (!sceneCode) {
    console.log(`No scene ${sceneNum} found.`);
    return;
  }

  const track = col;
  const clipKey = `d${track + 1}`;

  const { found, startIndex, endIndex } = TidalParser.getClipBlock(sceneCode, clipKey);

  if (!found) {
    console.log(`Clip ${clipKey} not found in scene ${sceneNum}`);
    return;
  }

  const lines = sceneCode.split('\n');
  const beforeClip = lines.slice(0, startIndex);
  const afterClip = lines.slice(endIndex + 1);

  const updatedLines = [...beforeClip, ...afterClip];
  sceneCode = updatedLines.join('\n');
  updatedScenes[sceneNum] = sceneCode;

  this.writeFullSceneSet(updatedScenes);
  this.reloadFile(this.filePath);
  this.updateAllLEDs();
}


writeFullSceneSet(updatedScenes) {
  let fileContent = '';

  const sortedSceneNums = Object.keys(updatedScenes)
    .map(k => parseInt(k,10))
    .sort((a,b)=>a-b);

  sortedSceneNums.forEach((key, index) => {
    let sceneContent = (updatedScenes[key] || '').trim();
    if (!sceneContent.startsWith('-- scene')) {
      sceneContent = `-- scene ${key}\n${sceneContent}`;
    }
    fileContent += sceneContent;
    if (index !== sortedSceneNums.length - 1) {
      fileContent += '\n\n';
    }
  });

  fs.writeFileSync(this.filePath, fileContent);
  this.scenes = updatedScenes; // update internal state
}



}

module.exports = StateManager;
