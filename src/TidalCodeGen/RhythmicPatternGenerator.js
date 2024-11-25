  // RhythmicPatternGenerator.js
  const { weightedRandom, randomInt } = require('./utils');
  
  class RhythmicPatternGenerator {
    constructor() {
      // Define options and weights
      this.patternTypes = [
        { value: 'euclidean', weight: 0.5 },
        { value: 'sequence', weight: 0.3 },
        { value: 'polyrhythm', weight: 0.2 },
      ];
  
      this.samples = [
        { value: 'bd', weight: 0.4 },
        { value: 'sn', weight: 0.3 },
        { value: 'hh', weight: 0.3 },
      ];
  
      this.modifiers = [
        { value: 'slow', weight: 0.3 },
        { value: 'fast', weight: 0.3 },
        { value: 'rev', weight: 0.2 },
        { value: 'jux', weight: 0.2 },
      ];
    }
  
    generatePattern() {
      const patternType = weightedRandom(this.patternTypes);
      let pattern = '';
  
      switch (patternType) {
        case 'euclidean':
          pattern = this.generateEuclideanPattern();
          break;
        case 'sequence':
          pattern = this.generateSequencePattern();
          break;
        case 'polyrhythm':
          pattern = this.generatePolyrhythmPattern();
          break;
      }
  
      // Randomly decide whether to apply a modifier
      if (Math.random() < 0.7) { // 70% chance to apply a modifier
        pattern = this.applyModifier(pattern);
      }
  
      return pattern;
    }
  
    generateEuclideanPattern() {
        const sample = weightedRandom(this.samples);
    
        // Generate pulses, steps, and rotation parameters
        const pulses = this.generateEuclideanParameter();
        const steps = this.generateEuclideanParameter();
        const rotation = this.generateEuclideanParameter();
    
        // Assemble the pattern string
        return `"${sample}(${pulses},${steps},${rotation})"`;
      }

      generateEuclideanParameter() {
        // Decide whether to use a static value or mini-notation
        const useMiniNotation = Math.random() < 0.5; // 50% chance
    
        if (useMiniNotation) {
          // Generate mini-notation pattern
          return this.generateMiniNotation();
        } else {
          // Generate static integer
          return this.randomEuclideanValue();
        }
      }


      randomEuclideanValue() {
        // Generate a random integer between 1 and 16
        return randomInt(1, 16).toString();
      }
    
      generateMiniNotation() {
        // Decide on the type of mini-notation to generate
        const notationType = weightedRandom([
          { value: 'list', weight: 0.5 },
          { value: 'cycle', weight: 0.3 },
          { value: 'nested', weight: 0.2 },
        ]);
    
        switch (notationType) {
          case 'list':
            return this.generateListNotation();
          case 'cycle':
            return this.generateCycleNotation();
          case 'nested':
            return this.generateNestedNotation();
        }
      }

      generateListNotation() {
        const numElements = randomInt(2, 4); // List of 2 to 4 elements
        const elements = [];
        for (let i = 0; i < numElements; i++) {
          if (Math.random() < 0.3) {
            // 30% chance to include duration
            elements.push(this.generateValueWithDuration());
          } else {
            elements.push(this.randomEuclideanValue());
          }
        }
        return `[${elements.join(' ')}]`;
      }
    
      generateCycleNotation() {
        const element = this.randomEuclideanValue();
        const repetitions = randomInt(2, 4);
        return `${element}@${repetitions}`;
      }
    
      generateNestedNotation() {
        const outerList = [];
        const numOuterElements = randomInt(2, 3);
        for (let i = 0; i < numOuterElements; i++) {
          if (Math.random() < 0.5) {
            // 50% chance to include an inner list
            const innerList = [];
            const numInnerElements = randomInt(2, 3);
            for (let j = 0; j < numInnerElements; j++) {
              innerList.push(this.randomEuclideanValue());
            }
            outerList.push(`<${innerList.join(' ')}>`);
          } else {
            outerList.push(this.randomEuclideanValue());
          }
        }
        return `[${outerList.join(' ')}]`;
      }
    
      generateValueWithDuration() {
        const value = this.randomEuclideanValue();
        const duration = randomInt(2, 4); // Duration between 2 and 4 cycles
        return `${value}@${duration}`;
      }
        
  
    generateSequencePattern() {
      const sample = weightedRandom(this.samples);
      const repeat = randomInt(2, 8);
      return `"${sample}*${repeat}"`;
    }
  
    generatePolyrhythmPattern() {
      const sample1 = weightedRandom(this.samples);
      const sample2 = weightedRandom(this.samples);
      const repeat1 = randomInt(2, 5);
      const repeat2 = randomInt(2, 5);
      return `stack [ "${sample1}*${repeat1}", "${sample2}*${repeat2}" ]`;
    }
  
    applyModifier(pattern) {
      const modifier = weightedRandom(this.modifiers);
  
      switch (modifier) {
        case 'slow':
          const slowAmount = randomInt(2, 4);
          return `slow ${slowAmount} $ ${pattern}`;
        case 'fast':
          const fastAmount = randomInt(2, 4);
          return `fast ${fastAmount} $ ${pattern}`;
        case 'rev':
          return `rev $ ${pattern}`;
        case 'jux':
          return `jux (|- gain 0.5) $ ${pattern}`;
        default:
          return pattern;
      }
    }
  }
  
  module.exports = RhythmicPatternGenerator;
  