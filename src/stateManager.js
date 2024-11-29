// src/StateManager.js
const EventEmitter = require('events');
const FileHandler = require('./FileHandler');
const TidalParser = require('./TidalParser');

class StateManager extends EventEmitter {
  constructor(tidalManager, filePath) {
    super();
    this.tidalManager = tidalManager;
    this.fileHandler = new FileHandler(filePath);
    this.scenes = {};
    this.modifiedClips = {};
    this.activeClips = Array(8).fill(null); // Active clips per track

    this.fileHandler.on('fileChanged', (fileContent) => {
      this.reloadFile(fileContent);
      this.emit('fileChanged', this.scenes);
    });

    this.reloadFile(this.fileHandler.readFile());
  }

  reloadFile(fileContent) {
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
  }

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

    return previousActiveRow;
  }

  deactivateClip(track) {
    const previousActiveRow = this.activeClips[track];
    this.activeClips[track] = null;
  
    // Send the mute command to TidalCycles
    const clipNumber = track + 1;
    const muteCommand = `d${clipNumber} $ silence`;
    this.tidalManager.sendCommand(muteCommand);
  
    // Emit an event to update LEDs
    this.emit('clipDeactivated', { track, previousActiveRow });
  }
  

  getActiveClips() {
    return this.activeClips;
  }

  activateClip(row, track, clipKey, sceneCode) {
    const modifiedCode = this.modifyScene(sceneCode, clipKey);

    this.tidalManager.sendCommand(`:{\n${modifiedCode}\n:}`);

    this.clearModifiedClips(row, track);

    this.emit('clipActivated', { row, track, previousActiveRow: this.activeClips[track] });
  }

  modifyScene(sceneCode, activeClip) {
    const lines = sceneCode.split('\n');
    const clipRegex = /^\s*(d\d+)\s*\$/;
    let isInActiveClip = false;
    let isInOtherClip = false;

    const modifiedLines = lines.map((line) => {
      if (line.trim().startsWith('hush')) {
        return `--${line}`;
      }

      const match = line.match(clipRegex);
      if (match) {
        const currentClip = match[1];
        if (currentClip === activeClip) {
          isInActiveClip = true;
          isInOtherClip = false;
          return line;
        } else {
          isInActiveClip = false;
          isInOtherClip = true;
          return `--${line}`;
        }
      }

      if (isInActiveClip) {
        return line;
      }

      if (isInOtherClip) {
        return `--${line}`;
      }

      return line;
    });

    return modifiedLines.join('\n');
  }

  launchScene(row) {
    const sceneKey = row + 1;
    const sceneCode = this.scenes[sceneKey];
    if (!sceneCode) {
      console.log(`No scene found for row ${sceneKey}`);
      return;
    }

    this.tidalManager.sendCommand(`:{\n${sceneCode}\n:}`);

    const clips = TidalParser.parseClips(sceneCode);
    const previousActiveClips = [...this.activeClips];
    this.activeClips = Array(8).fill(null);
    Object.keys(clips).forEach((clipKey) => {
      const trackIndex = parseInt(clipKey.slice(1), 10) - 1;
      this.activeClips[trackIndex] = row;
    });

    this.clearModifiedClips(row);

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

  writeSceneToFile(sceneKey, updatedSceneCode) {
    const updatedScenes = { ...this.scenes };
    updatedScenes[sceneKey] = updatedSceneCode;

    this.fileHandler.writeFile(updatedScenes);
  }
}

module.exports = StateManager;
