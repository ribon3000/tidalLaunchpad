class BasePatternGenerator {
    constructor() {
      // Common utilities or configuration shared across generators
    }
  
    // Utility function to generate a random number within a range
    getRandomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }
  
    // Utility function to randomly select from an array
    pickRandom(options) {
      return options[Math.floor(Math.random() * options.length)];
    }

    // Utility function to generate a random float between min and max
    getRandomFloat(min, max) {
        return Math.random() * (max - min) + min;
    }
  }
  
module.exports = BasePatternGenerator