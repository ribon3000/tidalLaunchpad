// src/FileReader.js
const fs = require('fs');

class FileReader {
  static readFile(filePath) {
    try {
      return fs.readFileSync(filePath, 'utf-8');
    } catch (error) {
      console.error(`Error reading file ${filePath}: ${error.message}`);
      return '';
    }
  }
}

module.exports = FileReader;
