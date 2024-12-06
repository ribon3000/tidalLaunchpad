// index.js
const CLIManager = require('./src/CLIManager');
const MIDIManager = require('./src/MIDIManager');
const TidalManager = require('./src/TidalManager');
const StateManager = require('./src/StateManager');
const LEDManager = require('./src/LEDManager');
const MIDIInputHandler = require('./src/MIDIInputHandler.js');

// Initialize CLI Manager and parse arguments
const cli = new CLIManager();

// Initialize MIDI Manager with specified ports
const midiManager = new MIDIManager(cli.getInputPort(), cli.getOutputPort());

// File paths & handler
const tidalBootFile = './BootTidal.hs';
const tidalCodeFile = cli.getFilePath() ? cli.getFilePath() : './playback.hs';

// Initialize Tidal, State, and LED managers
const tidal = new TidalManager(tidalBootFile);
tidal.start();

const ledManager = new LEDManager(midiManager);
const state = new StateManager(tidal, tidalCodeFile, ledManager);

// Initialize MIDI Input Handler to manage MIDI interactions
new MIDIInputHandler(midiManager, state);

// Initial LED setup handled by StateManager after loading scenes
state.updateAllLEDs();
