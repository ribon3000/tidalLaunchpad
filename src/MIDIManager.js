// src/MIDIManager.js
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
      this.controlOut.openPort(controlOutPort);
      console.log(`MIDI output port ${controlOutPort} opened for MIDI controls: ${this.output.getPortName(outputPort)}`);
    }

    console.log(`MIDI input port ${inputPort} opened: ${this.input.getPortName(inputPort)}`);
    console.log(`MIDI output port ${outputPort} opened: ${this.output.getPortName(outputPort)}`);

    this.input.on('message', (deltaTime, message) => {
      const statusByte = message[0]; 
      const messageType = statusByte & 0xF0;
      const channel = statusByte & 0x0F;
      const key = message[1];
      const velocity = message[2];
      this.handleMessage({ status: statusByte, key, velocity, channel: channel });
    });

    this.listeners = [];
  }

  handleMessage(data) {
    for (const listener of this.listeners) {
      listener(data);
    }
  }

  addListener(listener) {
    this.listeners.push(listener);
  }

  sendMessage(message) {
    this.output.sendMessage(message);
  }

  sendControlMessage(message){
    if (this.controlOut) {
      this.controlOut.sendMessage(message);
    }
  }
}

module.exports = MIDIManager;
