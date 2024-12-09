// src/MIDIInputHandler.js
class MIDIInputHandler {
  constructor(midiManager, stateManager, mapping) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.mapping = mapping;

    // Store currently pressed keys
    this.currentChord = [];

    this.actionMap = {
      0: { // Clip Matrix Page
        'clipPress': (events) => {
          const e = events[0];
          this.handleClipPress(e.row, e.col);
          this.currentChord = [];
        },
        'sceneLaunch': (events) => {
          const e = events[0];
          this.stateManager.launchScene(e.row);
          this.currentChord = [];
        },
        'pageButtonPress':(events)=> {
          const e = events[0]
          console.log('switching page to: '+e.key)
          this.stateManager.switchPage(e.key)
          this.currentChord = [];
        },
        'scrollDownPress':()=>{
          this.stateManager.scrollDown()
          this.currentChord = []
        },
        'scrollUpPress':()=>{
          this.stateManager.scrollUp()
          this.currentChord = []
        },
        'write+sceneLaunch': (events) => {
          // events[0] should be 'write', events[1] is 'sceneLaunch'
          const sceneRow = events[1].row;
          const sceneNum = sceneRow + 1 + this.stateManager.getSceneOffset();
          this.stateManager.writeAllActiveClipsToScene(sceneNum);
          this.currentChord = [];
        },
        'write+clipPress': (events) => {
          // events[0] is 'write', events[1] is 'clipPress'
          const row = events[1].row;
          const col = events[1].col;
          this.stateManager.writeActiveClipToSlot(row, col);
          this.currentChord = [];
        },
        'write+clear': (events) => {
          this.stateManager.insertEmptySceneBelowLowestActive();
          this.currentChord = [];
        },
        'clear+sceneLaunch': (events) => {
          const sceneRow = events[1].row;
          const sceneNum = sceneRow + 1 + this.stateManager.getSceneOffset();
          this.stateManager.clearScene(sceneNum);
          this.currentChord = [];
        },
        'clear+clipPress': (events) => {
          const row = events[1].row;
          const col = events[1].col;
          this.stateManager.clearClip(row, col);
          this.currentChord = [];
        }
      },
      1: {
        'pageButtonPress':(events)=> {
          const e = events[0]
          console.log('switching page to: '+e.key)
          this.stateManager.switchPage(e.key)
          this.currentChord = [];
        },
        // Page 1 actions...
      },
      2: {
        'pageButtonPress':(events)=> {
          const e = events[0]
          console.log('switching page to: '+e.key)
          this.stateManager.switchPage(e.key)
          this.currentChord = [];
        },
      },
      3: {
        'pageButtonPress':(events)=> {
          const e = events[0]
          console.log('switching page to: '+e.key)
          this.stateManager.switchPage(e.key)
          this.currentChord = [];
        },
      }
      // etc...
    };


    midiManager.addListener(this.handleRawMessage.bind(this));
  }


  handleRawMessage(data) {
    const { status, key, velocity, channel } = data;
    const event = this.mapping.parseMessage(status, key, velocity, channel);
    if (!event) return;
  
    this.currentChord.push(event);
    this.checkForChordAction();
  }

  checkForChordAction() {
    const page = this.stateManager.getCurrentPage();
    const mapForPage = this.actionMap[page] || {};

    // Create pattern from currentChord
    // Just join the event.type fields with '+'
    const pattern = this.currentChord.map(e => e.type).join('+');

    console.log(`pattern: ${pattern}`)

    // Check exact match
    if (mapForPage[pattern]) {
      mapForPage[pattern](this.currentChord);
      return;
    }

    // If no multi-event pattern matched, check if single-event pattern matches
    if (this.currentChord.length === 1) {
      const singlePattern = this.currentChord[0].type;
      if (mapForPage[singlePattern]) {
        mapForPage[singlePattern](this.currentChord);
      }
    }

    // If still no match, clear chord.
    this.currentChord = [];
  }

  handleClipPress(row, col) {
    // No changes needed here, same logic
    const scenes = this.stateManager.getScenes();
    const sceneKey = row + 1;
    const sceneCode = scenes[sceneKey];
    const trackIndex = col;

    if (this.stateManager.hasPendingChanges(trackIndex)) {
      const activeRowForThisTrack = this.stateManager.getActiveClips()[trackIndex];
      if (activeRowForThisTrack === row) {
        this.stateManager.revertPendingChanges(trackIndex);
        return;
      } else {
        this.stateManager.commitPendingChanges(trackIndex);
      }
    }

    if (!sceneCode) {
      console.log(`No clip found for row ${row + 1}, column ${col+1} muting...`);
      this.stateManager.deactivateClip(col);
      return;
    }

    const clipKey = `d${col + 1}`;
    const clips = this.stateManager.parseClips(sceneCode);

    if (clips.hasOwnProperty(clipKey)) {
      this.stateManager.activateClip(row, col, clipKey, sceneCode);
    } else {
      this.stateManager.deactivateClip(col);
    }
  }
}

module.exports = MIDIInputHandler;
