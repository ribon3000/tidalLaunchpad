// FileEditorServer.js
const express = require('express');
const fs = require('fs');
const path = require('path');

class FileEditorServer {
  constructor(port, filePath) {
    this.port = port;
    this.filePath = path.resolve(filePath);
    this.app = express();
    this.setupRoutes();
  }

  setupRoutes() {
    this.app.use(express.static('public')); // Serve HTML, CSS, and JS files
    this.app.use(express.json());

    // Route to get file content
    this.app.get('/file', (req, res) => {
      fs.readFile(this.filePath, 'utf8', (err, data) => {
        if (err) {
          res.status(500).send('File read error');
        } else {
          res.send(data);
        }
      });
    });

    // Route to save file content
    this.app.post('/file', (req, res) => {
      fs.writeFile(this.filePath, req.body.content, 'utf8', (err) => {
        if (err) {
          res.status(500).send('File write error');
        } else {
          res.send('File updated');
        }
      });
    });
  }

  start() {
    this.app.listen(this.port, () => {
      console.log(`Server started on http://localhost:${this.port}`);
    });
  }
}

module.exports = FileEditorServer;
