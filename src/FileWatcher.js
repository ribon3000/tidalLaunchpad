const fs = require('fs');
const EventEmitter = require('events');
const FileReader = require('./FileReader');

class FileWatcher extends EventEmitter {
  constructor(filePath) {
    super();
    this.filePath = filePath;
    this.watchFile();
  }

  watchFile() {
    fs.watch(this.filePath, () => {
      console.log(`File ${this.filePath} changed, reloading...`);
      const newContent = FileReader.readFile(this.filePath);
      this.emit('fileChanged', newContent);
    });
  }

  readFile() {
    return FileReader.readFile(this.filePath);
  }
}

module.exports = FileWatcher;
