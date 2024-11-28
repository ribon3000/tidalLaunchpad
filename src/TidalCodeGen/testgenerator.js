const RhythmPatternGenerator = require('./rhythmPatternGenerator');
const generator = new RhythmPatternGenerator();


for (let i = 0; i < 10; i++) {
  const pattern = generator.generatePattern();
  console.log(`Generated Pattern ${i + 1}:`);
  console.log(`${pattern}\n`);
}