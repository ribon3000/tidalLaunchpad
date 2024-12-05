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
}

module.exports = TidalParser;
