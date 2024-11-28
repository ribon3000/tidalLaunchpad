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

    weightedRandom(options) {
      const totalWeight = options.reduce((sum, { weight }) => sum + weight, 0);
      let randomNum = Math.random() * totalWeight;
      for (const option of options) {
        if (randomNum < option.weight) {
          return option.value;
        }
        randomNum -= option.weight;
      }
    }
  }
  
module.exports = BasePatternGenerator