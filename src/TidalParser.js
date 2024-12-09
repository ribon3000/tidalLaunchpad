// src/TidalParser.js
class TidalParser {
  static parseScenes(fileContent) {
    const scenes = {};
    let currentScene = null;

    fileContent.split('\n').forEach((line) => {
      const sceneMatch = line.match(/-- scene (\d+)/i);
      if (sceneMatch) {
        currentScene = sceneMatch[1];
        scenes[currentScene] = [];
      } else if (currentScene) {
        scenes[currentScene].push(line);
      }
    });

    // Join lines back together for each scene
    Object.keys(scenes).forEach((key) => {
      scenes[key] = scenes[key].join('\n');
    });

    return scenes;
  }

  static parseClips(code) {
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

  static parseModifiedClips(oldCode, newCode) {
    const removeCommentsAndBlanks = (lines) => {
      return lines.filter(line => !/^\s*--/.test(line) && line.trim() !== '');
    };

    const oldLines = removeCommentsAndBlanks(oldCode.split('\n'));
    const newLines = removeCommentsAndBlanks(newCode.split('\n'));

    const modified = [];
    let nonClipChange = false;

    for (let i = 0; i < Math.max(oldLines.length, newLines.length); i++) {
      const oldLine = oldLines[i] || '';
      const newLine = newLines[i] || '';

      if (oldLine !== newLine) {
        const clipMatch = newLine.match(/^\s*(d[1-8])\s*\$/);
        if (clipMatch) {
          const clipKey = clipMatch[1];
          const clipIndex = parseInt(clipKey.slice(1), 10) - 1;
          modified.push(clipIndex);
        } else {
          nonClipChange = true;
        }
      }
    }

    if (nonClipChange) {
      return [...Array(8).keys()]; // Mark all clips as modified
    }

    return modified;
  }


  static modifyScene(buttonStates, sceneCode, activeClip = null) {
    const lines = sceneCode.split('\n');
    const clipRegex = /^\s*(d\d+)\s*\$/; // Regex to detect clip start
    const sceneRegex = /^-- scene \d+/i; // Regex to detect new scenes
  
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

  static getClipBlock(sceneCode, clipKey) {
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
      // Clip not found
      return { found: false, startIndex: -1, endIndex: -1, lines: [] };
    }

    // Starting from clipStartIndex+1, find the end of the clip
    // The clip ends if we hit:
    // - An empty line
    // - Another clip line
    // - Another scene line
    for (let j = clipStartIndex + 1; j < lines.length; j++) {
      const line = lines[j].trim();

      if (
        line === '' || 
        sceneStartRegex.test(line) || 
        anotherClipRegex.test(line)
      ) {
        clipEndIndex = j - 1;
        break;
      }
    }

    // If we never hit a boundary, the clip goes until the end of the file
    if (clipEndIndex === -1) {
      clipEndIndex = lines.length - 1;
    }

    const clipLines = lines.slice(clipStartIndex, clipEndIndex + 1);

    return {
      found: true,
      startIndex: clipStartIndex,
      endIndex: clipEndIndex,
      lines: clipLines
    };
  }
}

module.exports = TidalParser;
