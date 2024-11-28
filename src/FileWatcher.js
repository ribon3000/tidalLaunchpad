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

  writeFile(sections) {
    let fileContent = '';

    // Reconstruct the file from the sections
    Object.keys(sections).forEach((key, index) => {
        let sectionContent = sections[key].trim();
        fileContent += `-- section ${key}\n${sectionContent}`;
        if (index !== Object.keys(sections).length - 1) {
            fileContent += '\n\n'; // Add two newlines between sections
        }
    });

    fs.writeFileSync(this.filePath, fileContent);
    console.log(`File updated with new sections.`);
}

}

module.exports = FileWatcher;
