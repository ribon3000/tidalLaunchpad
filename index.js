// index.js
const CLIManager = require('./src/CLIManager');
const MIDIManager = require('./src/MIDIManager');
const TidalManager = require('./src/TidalManager');
const StateManager = require('./src/StateManager');
const LEDManager = require('./src/LEDManager');
const RhythmPatternGenerator = require('./src/TidalCodeGen/rhythmPatternGenerator');
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
const patternGen = new RhythmPatternGenerator();

// Initialize MIDI Input Handler to manage MIDI interactions
new MIDIInputHandler(midiManager, state, ledManager, patternGen);

// Initial LED setup
ledManager.updateAllLEDs();

state.on('fileChanged', () => {
  console.log('File changed, updating LEDs...');
  ledManager.updateAllLEDs();
});

state.on('clipActivated', ({ row, track, previousActiveRow }) => {
  ledManager.setActiveClip(row, track);

  if (previousActiveRow !== null && previousActiveRow !== row) {
    const scenes = state.getScenes();
    const sceneCode = scenes[previousActiveRow + 1];
    ledManager.updateRowLEDs(previousActiveRow, sceneCode);
  }
});

state.on('clipDeactivated', ({ track, previousActiveRow }) => {
  if (previousActiveRow !== null) {
    const scenes = state.getScenes();
    const sceneCode = scenes[previousActiveRow + 1];
    ledManager.updateRowLEDs(previousActiveRow, sceneCode);
  }
});

state.on('sceneLaunched', ({ row, activeClips, previousActiveClips }) => {
  ledManager.handleSceneLaunched(row, activeClips, previousActiveClips);
});

state.on('clipDeactivated', ({ track, previousActiveRow }) => {
  if (previousActiveRow !== null) {
    const scenes = state.getScenes();
    const sceneCode = scenes[previousActiveRow + 1];
    ledManager.updateRowLEDs(previousActiveRow, sceneCode);
  }
});
