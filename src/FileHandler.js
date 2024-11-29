// src/FileHandler.js
const fs = require('fs');
const EventEmitter = require('events');

class FileHandler extends EventEmitter {
  constructor(filePath) {
    super();
    this.filePath = filePath;
    this.watchFile();
  }

  watchFile() {
    fs.watch(this.filePath, () => {
      console.log(`File ${this.filePath} changed, reloading...`);
      const newContent = this.readFile();
      this.emit('fileChanged', newContent);
    });
  }

  readFile() {
    try {
      return fs.readFileSync(this.filePath, 'utf-8');
    } catch (error) {
      console.error(`Error reading file ${this.filePath}: ${error.message}`);
      return '';
    }
  }

  writeFile(scenes) {
    let fileContent = '';

    // Reconstruct the file from the scenes
    Object.keys(scenes).forEach((key, index) => {
      let sceneContent = scenes[key].trim();
      fileContent += `-- section ${key}\n${sceneContent}`;
      if (index !== Object.keys(scenes).length - 1) {
        fileContent += '\n\n'; // Add two newlines between scenes
      }
    });

    fs.writeFileSync(this.filePath, fileContent);
    console.log(`File updated with new scenes.`);
  }
}

module.exports = FileHandler;
