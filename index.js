const yargs = require('yargs');
const { hideBin } = require('yargs/helpers');
const midi = require('midi');
const MIDIManager = require('./src/MIDIManager');
const TidalManager = require('./src/tidalManager');
const StateManager = require('./src/stateManager');
const LEDManager = require('./src/LEDManager');

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
const ledManager = new LEDManager(midiManager, state);

// Initial LED setup
ledManager.updateAllLEDs();

state.on('fileChanged', () => {
  console.log('File changed, updating LEDs...');
  ledManager.updateAllLEDs();
});

// MIDI message handling
midiManager.addListener((message) => {
  const [status, note, velocity] = message;
  const isButtonPress = status === 144 && velocity > 0;

  if (isButtonPress) {
    const row = Math.floor(note / 16);
    const col = note % 16;

    const sections = state.getSections();
    const sectionCode = sections[row + 1];

    if (!sectionCode) {
      console.log(`No section found for row ${row + 1}`);
      return;
    }

    if (col === 8 && note === (ledManager.rowMapping[row] + 8)) {
      // Scene launch button: play entire section and set scene active
      console.log(`Launching scene for row ${row}`);
      tidal.sendCommand(`:{\n${sectionCode}\n:}`);
      state.clearModifiedStreams(row);
      ledManager.setSceneActive(row);
    } else {
      // Individual stream activation
      const streams = state.parseStreams(sectionCode);
      const streamKey = `d${col + 1}`; // Match button (0-7) to streams d1-d8

      if (streams[streamKey]) {
        console.log(`Activating stream ${streamKey} in row ${row}`);
        ledManager.setActiveStream(row, col);
        tidal.sendCommand(`:{\n${state.modifySection(sectionCode, streamKey)}\n:}`);
        state.clearModifiedStreams(row, col);
      } else {
        console.log(`Muting stream ${streamKey}`);
        tidal.sendCommand(`${streamKey} $ "~"`); // Mute stream
        ledManager.deactivateStream(col); // Turn off the LED
      }
    }
  }
});

