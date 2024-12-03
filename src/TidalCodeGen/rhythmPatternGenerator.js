const {BasePatternGenerator} = require('./BasePatternGenerator')

class RhythmPatternGenerator extends BasePatternGenerator {
    constructor() {
      super();
      // Configuration or state specific to rhythm generation can go here
    }
  
    // Generate rhythmical polyrhythm based pattern
    generatePattern(streamN = 1) {
      // Randomly determine the polyrhythm lengths and offsets
      const patternA1 = this.generatePolyrhythm();
      const patternA2 = this.generatePolyrhythm();
      const patternB1 = this.generatePolyrhythm();
      const patternB2 = this.generatePolyrhythm();
  
      // Generate amp factors for subtle dynamic variation
      const a2AmpFactor = this.getRandomFloat(0.2, 0.5);
      const b2AmpFactor = this.getRandomFloat(0.3, 0.7);
  
      // Define other attributes like loop length, stream number, etc.
      const loopLength = this.getRandomInt(2, 8); // Loop length (e.g., between 2 and 8)
      const streamNumber = streamN; // Random stream number (d1 to d8)
      const midiNoteNumber = 36; // We can randomize or choose a specific note
  
      // Generate the boolean pattern for 'sew'
      const sewPattern = this.generateSewPattern();
  
      // Construct the final pattern
      const patternCode = ` outside ${loopLength} loopFirst $ sew "${sewPattern}" 
      (stack [s "${patternA2}%16" # amp ${a2AmpFactor}, s "${patternA1}%16"]) 
      (stack [s "${patternB2}%16" # amp ${b2AmpFactor}, s "${patternB1}%16"]) # n ${midiNoteNumber}
      `;
      return patternCode;
    }
  
    // Generate a polyrhythm pattern in the form "{t ~!x}" or similar
    generatePolyrhythm() {
      const length = this.getRandomInt(2, 8); // Length in 16th notes (e.g., between 2 and 8)
      const offset = this.getRandomInt(0, length - 1); // Random offset for "t"
  
      // Construct a pattern based on length and offset
      let pattern = "{";
      for (let i = 0; i < length; i++) {
        if (i === offset) {
          pattern += "t ";
        } else {
          pattern += "~ ";
        }
      }
      pattern = pattern.trim() + "}";
  
      return pattern;
    }
  
    // Generate the boolean pattern for sew (e.g., "0@3 1@5")
    generateSewPattern() {
      const sewPattern = `${this.pickRandom(['0', '0'])}@${this.getRandomInt(2, 5)} ${this.pickRandom(['1', '1'])}@${this.getRandomInt(2, 5)}`;
      return sewPattern;
    }
  }

module.exports = RhythmPatternGenerator;