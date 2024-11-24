// src/LaunchpadState.js
class LaunchpadState {
    constructor() {
      this.activeStreams = Array(8).fill(null); // Track active streams per column (8 columns)
      this.modifiedStreams = {}; // Track modified streams by row
    }
  
    // Set a stream as active
    setActiveStream(row, col) {
      // Deactivate the previous active stream in the column
      const prevActiveRow = this.activeStreams[col];
      if (prevActiveRow !== null && prevActiveRow !== row) {
        this.deactivateStream(col);
      }
  
      // Set the new active stream
      this.activeStreams[col] = row;
  
      // Remove from modified streams if set active
      this.clearModifiedStream(row, col);
    }
  
    // Set an entire row as active (scene launch)
    setSceneActive(row) {
      this.activeStreams.fill(null); // Deactivate all current streams
      for (let col = 0; col < 8; col++) {
        this.activeStreams[col] = row; // Set all streams in the row as active
      }
  
      // Clear modified streams for the entire row
      this.clearModifiedStreams(row);
    }
  
    // Deactivate a stream in a specific column
    deactivateStream(col) {
      const prevActiveRow = this.activeStreams[col];
      if (prevActiveRow !== null) {
        this.activeStreams[col] = null;
      }
    }
  
    // Add a stream as modified
    addModifiedStream(row, col) {
      if (!this.modifiedStreams[row]) {
        this.modifiedStreams[row] = new Set();
      }
      this.modifiedStreams[row].add(col);
    }
  
    // Clear a specific modified stream
    clearModifiedStream(row, col) {
      if (this.modifiedStreams[row]) {
        this.modifiedStreams[row].delete(col);
        if (this.modifiedStreams[row].size === 0) {
          delete this.modifiedStreams[row];
        }
      }
    }
  
    // Clear all modified streams for a given row
    clearModifiedStreams(row) {
      if (this.modifiedStreams[row]) {
        delete this.modifiedStreams[row];
      }
    }
  
    // Get all modified streams for a given row
    getModifiedStreams(row) {
      return Array.from(this.modifiedStreams[row] || []);
    }
  
    // Check if a stream is active
    isStreamActive(row, col) {
      return this.activeStreams[col] === row;
    }
  }
  
  module.exports = LaunchpadState;
  