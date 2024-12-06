// src/MIDIInputHandler.js
class MIDIInputHandler {
  constructor(midiManager, stateManager, mapping) {
    this.midiManager = midiManager;
    this.stateManager = stateManager;
    this.mapping = mapping;

    midiManager.addListener(this.handleRawMessage.bind(this));
  }

  handleRawMessage(message) {
    const [status, key, velocity] = message;
    const event = this.mapping.parseMessage(status, key, velocity);

    if (!event) return;

    switch (event.type) {
      case 'modifierPress':
        this.stateManager.setModifierButtonState(event.index, event.active);
        break;

      case 'clipPress':
        if(this.stateManager.getCurrentPage() == 0){
          this.handleClipPress(event.row, event.col);
        } else {
          console.log('got clip button press: '+JSON.stringify(event))
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
    console.log(`${row}, ${col}`)
    const scenes = this.stateManager.getScenes();
    const sceneKey = row + 1;
    const sceneCode = scenes[sceneKey];

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
