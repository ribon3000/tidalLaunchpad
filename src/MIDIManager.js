const midi = require('midi');

class MIDIManager {
  constructor(inputPort, outputPort) {
    this.input = new midi.Input();
    this.output = new midi.Output();

    // Open specified MIDI ports
    this.input.openPort(inputPort);
    this.output.openPort(outputPort);

    console.log(`MIDI input port ${inputPort} opened: ${this.input.getPortName(inputPort)}`);
    console.log(`MIDI output port ${outputPort} opened: ${this.output.getPortName(outputPort)}`);

    this.input.on('message', (deltaTime, message) => {
      this.handleMessage(message);
    });

    this.listeners = [];
  }

  // Handle incoming MIDI messages
  handleMessage(message) {
    for (const listener of this.listeners) {
      listener(message);
    }
  }

  // Register a listener for incoming messages
  addListener(listener) {
    this.listeners.push(listener);
  }

  // Send a message to the MIDI device
  sendMessage(message) {
    this.output.sendMessage(message);
  }

  // Set LED state for a specific button
  setLED(note, color) {
    this.sendMessage([144, note, color]);
  }

  // Clear all LEDs
  clearLEDs() {
    for (let note = 0; note < 128; note++) {
      this.setLED(note, 0);
    }
  }
}

module.exports = MIDIManager;
