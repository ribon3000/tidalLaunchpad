// testGenerator.js
const RhythmicPatternGenerator = require('./RhythmicPatternGenerator');

const generator = new RhythmicPatternGenerator();

for (let i = 0; i < 10; i++) {
  const pattern = generator.generatePattern();
  console.log(`Generated Pattern ${i + 1}:`);
  console.log(`d1 $ ${pattern}\n`);
}