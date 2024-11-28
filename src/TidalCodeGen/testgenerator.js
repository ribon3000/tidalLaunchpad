// testGenerator.js
const RhythmicPatternGenerator = require('./RhythmicPatternGenerator');

const RhythmPatternGenerator = require('./rhythmPatternGenerator');

const generator = new RhythmicPatternGenerator();
const generator2 = new RhythmPatternGenerator();

for (let i = 0; i < 10; i++) {
  const pattern = generator.generatePattern();
  console.log(`Generated Pattern ${i + 1}:`);
  console.log(`d1 $ ${pattern}\n`);
}

for (let i = 0; i < 10; i++) {
  const pattern = generator2.generatePattern();
  console.log(`Generated Pattern ${i + 1}:`);
  console.log(`${pattern}\n`);
}