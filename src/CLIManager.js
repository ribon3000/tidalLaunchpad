// src/CLIManager.js
const yargs = require('yargs');
const { hideBin } = require('yargs/helpers');
const midi = require('midi');

class CLIManager {
  constructor() {
    this.argv = yargs(hideBin(process.argv))
      .option('file-path', {
        alias: 'f',
        type: 'string',
        description: 'Tidal Code file to work with'
      })
      .option('list-ports', {
        alias: 'l',
        type: 'boolean',
        description: 'List available MIDI ports and exit',
      })
      .option('input-port', {
        alias: 'i',
        type: 'number',
        description: 'MIDI input port number for the Launchpad',
      })
      .option('output-port', {
        alias: 'o',
        type: 'number',
        description: 'MIDI output port number for the Launchpad',
      })
      .option('mapping', {
        alias: 'm',
        type: 'string',
        description: 'MIDI Controller map. Default: LP. Options: LP,TOSC.'
      })
      .help()
      .argv;

    this.validateArguments();
  }

  validateArguments() {
    if (this.argv['list-ports']) {
      const input = new midi.Input();
      const output = new midi.Output();

      console.log('Available MIDI Input Ports:');
      for (let i = 0; i < input.getPortCount(); i++) {
        console.log(`${i}: ${input.getPortName(i)}`);
      }

      console.log('\nAvailable MIDI Output Ports:');
      for (let i = 0; i < output.getPortCount(); i++) {
        console.log(`${i}: ${output.getPortName(i)}`);
      }

      process.exit(0);
    }

    if (typeof this.argv['input-port'] === 'undefined' || typeof this.argv['output-port'] === 'undefined') {
      console.error('Error: You must specify both --input-port and --output-port.');
      process.exit(1);
    }
  }

  getFilePath() {
    return this.argv['file-path']
  }

  getInputPort() {
    return this.argv['input-port'];
  }

  getOutputPort() {
    return this.argv['output-port'];
  }

  getMapping() {
    return this.argv['mapping'];
  }
}

module.exports = CLIManager;
