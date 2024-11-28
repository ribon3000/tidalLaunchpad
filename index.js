const CLIManager = require('./src/CLIManager');
const MIDIManager = require('./src/MIDIManager');
const TidalManager = require('./src/tidalManager');
const StateManager = require('./src/stateManager');
const LEDManager = require('./src/LEDManager');
const RhythmPatternGenerator = require('./src/TidalCodeGen/rhythmPatternGenerator')
const MIDIInputHandler = require('./src/MIDIInputHandler.js');

// Initialize CLI Manager and parse arguments
const cli = new CLIManager();

// Initialize MIDI Manager with specified ports
const midiManager = new MIDIManager(cli.getInputPort(), cli.getOutputPort());

// File paths
const tidalBootFile = './BootTidal.hs';
const tidalCodeFile = './playback.hs';

// Initialize Tidal, State, and LED managers
const tidal = new TidalManager(tidalBootFile);
tidal.start();

const state = new StateManager(tidal, tidalCodeFile);
const ledManager = new LEDManager(midiManager, state);
const patternGen = new RhythmPatternGenerator()

// Initialize MIDI Input Handler to manage MIDI interactions
new MIDIInputHandler(midiManager, state, ledManager, patternGen);

// Initial LED setup
ledManager.updateAllLEDs();

state.on('fileChanged', () => {
  console.log('File changed, updating LEDs...');
  ledManager.updateAllLEDs();
});
state.on('streamActivated', ({ row, col, previousActiveRow }) => {
  // Update LEDs for the newly activated stream
  ledManager.setActiveStream(row, col);

  // Update LEDs for the previously active row if different
  if (previousActiveRow !== null && previousActiveRow !== row) {
    const sections = state.getSections();
    const sectionCode = sections[previousActiveRow + 1];
    ledManager.updateRowLEDs(previousActiveRow, sectionCode);
  }
});

state.on('streamDeactivated', ({ col, previousActiveRow }) => {
  // Update LEDs for the row where the stream was deactivated
  if (previousActiveRow !== null) {
    const sections = state.getSections();
    const sectionCode = sections[previousActiveRow + 1];
    ledManager.updateRowLEDs(previousActiveRow, sectionCode);
  }
});

state.on('sceneLaunched', ({ row, activeStreams, previousActiveStreams }) => {
  ledManager.handleSceneLaunched(row, activeStreams, previousActiveStreams);
});