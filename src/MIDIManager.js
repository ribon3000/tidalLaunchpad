const midi = require('midi');

class MIDIManager {
  constructor(inputPort, outputPort, controlOutPort = -1) {
    this.input = new midi.Input();
    this.output = new midi.Output();
    this.controlOut = (controlOutPort > -1) ? new midi.Output() : null;

    // Open specified MIDI ports
    this.input.openPort(inputPort);
    this.output.openPort(outputPort);
    if(controlOutPort > -1) {
      this.controlOut.openPort(controlOutPort)
      console.log(`MIDI output port ${controlOutPort} opened for MIDI controls: ${this.output.getPortName(outputPort)}`);
    }

    console.log(`MIDI input port ${inputPort} opened: ${this.input.getPortName(inputPort)}`);
    console.log(`MIDI output port ${outputPort} opened: ${this.output.getPortName(outputPort)}`);

    this.input.on('message', (deltaTime, message) => {
      const statusByte = message[0]; // The first byte is the status byte
      const messageType = statusByte & 0xF0; // Extract the message type (high nibble)
      const channel = statusByte & 0x0F; // Extract the channel (low nibble)
    
      console.log(`Message Type: 0x${messageType.toString(16)}`);
      console.log(`Channel: ${channel + 1}`); // Add 1 to display as MIDI channel (1-16)
      console.log(`Message Data: ${message}`);
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

  sendControlMessage(message){
    this.controlOut.sendMessage(message);
  }
}

module.exports = MIDIManager;
