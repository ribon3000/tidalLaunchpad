const CLIManager = require('./src/CLIManager');
const MIDIManager = require('./src/MIDIManager');
const TidalManager = require('./src/TidalManager');
const StateManager = require('./src/StateManager');
const LEDManager = require('./src/LEDManager');
const MIDIInputHandler = require('./src/MIDIInputHandler.js');
const LaunchpadMiniMk2Mapping = require('./src/mappings/LaunchpadMiniMk2Mapping'); // example path

const cli = new CLIManager();
const midiManager = new MIDIManager(cli.getInputPort(), cli.getOutputPort());

// Select a mapping based on some CLI argument or default
const mapping = new LaunchpadMiniMk2Mapping();

const tidalBootFile = './BootTidal.hs';
const tidalCodeFile = cli.getFilePath() ? cli.getFilePath() : './playback.hs';

const tidal = new TidalManager(tidalBootFile);
tidal.start();

const ledManager = new LEDManager(midiManager, mapping);
const state = new StateManager(tidal, tidalCodeFile, ledManager);

new MIDIInputHandler(midiManager, state, mapping);

state.updateAllLEDs();
