// utils.js
function weightedRandom(options) {
    const totalWeight = options.reduce((sum, { weight }) => sum + weight, 0);
    let randomNum = Math.random() * totalWeight;
    for (const option of options) {
      if (randomNum < option.weight) {
        return option.value;
      }
      randomNum -= option.weight;
    }
  }
  
  function randomInt(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }
  
  module.exports = { weightedRandom, randomInt };