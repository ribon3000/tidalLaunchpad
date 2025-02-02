const CLIManager = require('./src/CLIManager');
const MIDIManager = require('./src/MIDIManager');
const TidalManager = require('./src/TidalManager');
const StateManager = require('./src/StateManager');
const LEDManager = require('./src/LEDManager');
const MIDIInputHandler = require('./src/MIDIInputHandler.js');
const LaunchpadMiniMk2Mapping = require('./src/mappings/LaunchpadMiniMk2Mapping'); // example path
const TouchOSCLPMapping = require('./src/mappings/TouchOscLPMapping.js')

const GeneratorProvider = require('./src/TidalCodeGen/GeneratorProvider.js')

const cli = new CLIManager();
const midiManager = new MIDIManager(cli.getInputPort(), cli.getOutputPort());

// Select a mapping based on some CLI argument or default
const mappings = {LP: new LaunchpadMiniMk2Mapping(), TOSC: new TouchOSCLPMapping()};
const mapping = mappings[cli.getMapping()];

const tidalBootFile = './BootTidal.hs';
const tidalCodeFile = cli.getFilePath() ? cli.getFilePath() : './playback.hs';

const tidal = new TidalManager(tidalBootFile);
tidal.start();

const generatorProvider = new GeneratorProvider();
const ledManager = new LEDManager(midiManager, mapping);
const state = new StateManager(tidal, tidalCodeFile, ledManager,generatorProvider);

new MIDIInputHandler(midiManager, state, mapping);

state.updateAllLEDs();
