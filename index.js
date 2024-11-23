const yargs = require('yargs');
const { hideBin } = require('yargs/helpers');
const midi = require('midi');
const MIDIManager = require('./src/MIDIManager');
const TidalManager = require('./src/tidalManager');
const StateManager = require('./src/stateManager');

// Parse command-line arguments
const argv = yargs(hideBin(process.argv))
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
  .help()
  .argv;

// List available MIDI ports and exit
if (argv['list-ports']) {
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

// Validate input/output ports
if (typeof argv['input-port'] === 'undefined' || typeof argv['output-port'] === 'undefined') {
  console.error('Error: You must specify both --input-port and --output-port.');
  process.exit(1);
}
// File paths
const tidalBootFile = './BootTidal.hs';
const tidalCodeFile = './playback.hs';

// Initialize managers
const tidal = new TidalManager(tidalBootFile);
tidal.start();

const midiManager = new MIDIManager(argv['input-port'], argv['output-port']);
const state = new StateManager(tidal, tidalCodeFile);

// Helper constants
const rowMapping = [0, 16, 32, 48, 64, 80, 96, 112]; // Launchpad rows
const ledColors = { off: 0, on: 3 };

// MIDI message handling
midiManager.addListener((message) => {
  const [status, note, velocity] = message;
  const isButtonPress = status === 144 && velocity > 0; // Note On

  if (isButtonPress) {
    const row = Math.floor(note / 16);
    const col = note % 16;

    const currentSections = state.getSections();
    const sectionCode = currentSections[row + 1];

    if (!sectionCode) {
      console.log(`No section found for row ${row + 1}`);
      return;
    }

    if (col === 8) {
      tidal.sendCommand(`:{\n${sectionCode}\n:}`);
    } else {
      const streamIndex = col;
      const streams = state.parseStreams(sectionCode);

      if (streams[streamIndex]) {
        const modifiedCode = state.modifySection(sectionCode, streams[streamIndex]);
        tidal.sendCommand(`:{\n${modifiedCode}\n:}`);
      } else {
        tidal.sendCommand(`d${streamIndex + 1} $ "~"`);
      }
    }

    updateLEDs(row, sectionCode);
  }
});

// Update LEDs for a given row
function updateLEDs(row, sectionCode) {
  const streams = state.parseStreams(sectionCode);

  for (let col = 0; col < 8; col++) {
    const note = rowMapping[row] + col;
    const color = streams.includes(`d${col + 1}`) ? ledColors.on : ledColors.off;
    midiManager.setLED(note, color);
  }

  const sceneButton = rowMapping[row] + 8;
  midiManager.setLED(sceneButton, ledColors.on);
}

// Update LEDs for all sections
function updateAllLEDs() {
  const currentSections = state.getSections();
  midiManager.clearLEDs();
  Object.keys(currentSections).forEach((section, index) => {
    updateLEDs(index, currentSections[section]);
  });
}

// Listen for file changes
state.on('fileChanged', () => {
  console.log('File changed, updating LEDs...');
  updateAllLEDs();
});

// Initial LED setup
updateAllLEDs();