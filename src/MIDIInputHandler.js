// src/MIDIInputHandler.js
class MIDIInputHandler {
  constructor(midiManager, stateManager, mapping) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.mapping = mapping;

    midiManager.addListener(this.handleRawMessage.bind(this));
  }

  handleRawMessage(data) {
    // data is now {status, key, velocity, channel}
    const { status, key, velocity, channel } = data;
    const event = this.mapping.parseMessage(status, key, velocity, channel);

    if (!event) return;

    switch (event.type) {
      case 'modifierPress':
        this.stateManager.setModifierButtonState(event.index, event.active);
        break;
      case 'clipPress':
        if (this.stateManager.getCurrentPage() === 0) {
          this.handleClipPress(event.row, event.col);
        } else if (this.stateManager.getCurrentPage() === 1) {
          console.log('Page 2 clip press: generate code for track 1 using acidBasslineGenerator');
          this.stateManager.generateCodeForTrack(0, 'acidBasslineGenerator');
        } else {
          console.log('Other page action...');
        }
        break;
      case 'sceneLaunch':
        if(this.stateManager.getCurrentPage() == 0){
          this.stateManager.launchScene(event.row);
        } else {
          console.log('got scene launch button press: '+JSON.stringify(event));
        }
        break;
      case 'pageButton':
        this.stateManager.switchPage(event.key);
        break;
      default:
        console.log(`Unknown event type: ${event.type}`);
        break;
    }
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
