class BasePatternGenerator {
    constructor() {
      // Common utilities or configuration shared across generators
    }
  
    // Utility function to generate a random number within a range
    getRandomInt(min, max, exponent = 1) {
      return Math.floor(Math.pow(Math.random(),exponent) * (max - min + 1)) + min;
    }
  
    // Utility function to randomly select from an array
    pickRandom(options) {
      return options[Math.floor(Math.random() * options.length)];
    }

    // Utility function to generate a random float between min and max
    getRandomFloat(min, max, exponent = 1) {
        return Math.pow(Math.random(),exponent) * (max - min) + min;
    }

    probDo(probability) {
       return((Math.random() < probability))
    }

    weightedRandom(options) {
      const totalWeight = options.reduce((sum, { weight }) => sum + weight, 0);
      let randomNum = Math.random() * totalWeight;
      for (const option of options) {
        if (randomNum < option.weight) {
          return typeof option.value === 'function' ? option.value() : option.value;
        }
        randomNum -= option.weight;
      }
    }
    
  }
  
module.exports = BasePatternGenerator