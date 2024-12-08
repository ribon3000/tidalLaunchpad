// src/MIDIInputHandler.js
class MIDIInputHandler {
  constructor(midiManager, stateManager, mapping) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.mapping = mapping;

    midiManager.addListener(this.handleRawMessage.bind(this));
  }

  handleRawMessage(message) {
    console.log(message)
    const [status, key, velocity] = message;
    const event = this.mapping.parseMessage(status, key, velocity);

    if (!event) return;

    switch (event.type) {
      case 'modifierPress':
        this.stateManager.setModifierButtonState(event.index, event.active);
        break;

      case 'clipPress':
        if (this.stateManager.getCurrentPage() == 0) {
          this.handleClipPress(event.row, event.col);
        } else if (this.stateManager.getCurrentPage() == 1) {
          // Page 2 logic:
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
          console.log('got scene launch button press: '+JSON.stringify(event))
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
    const scenes = this.stateManager.getScenes();
    const sceneKey = row + 1;
    const sceneCode = scenes[sceneKey];
    const trackIndex = col;

    if (this.stateManager.hasPendingChanges(trackIndex)) {
      // If this is the same clip that has pending changes, revert
      // We know it's the same clip if it's active
      // Actually, if the user presses the same clip that's currently active and pending, revert
      const activeRowForThisTrack = this.stateManager.getActiveClips()[trackIndex];
      if (activeRowForThisTrack === row) {
        // same clip
        this.stateManager.revertPendingChanges(trackIndex);
        return;
      } else {
        // different clip pressed, commit pending changes to file
        this.stateManager.commitPendingChanges(trackIndex);
        // now activate the newly pressed clip as normal
      }
    }

    if (!sceneCode) {
      console.log(`No scene found for row ${row + 1}, muting...`);
      this.stateManager.deactivateClip(col);
      return;
    }

    // If the last column is reserved for scene launch in your mapping,
    // event.type=clipPress will never be triggered for that column. 
    // If it can, handle it here similarly to before:
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
