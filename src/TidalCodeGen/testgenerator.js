const RhythmPatternGenerator = require('./RhythmPatternGenerator');
const AcidBasslineGenerator = require('./AcidBasslineGenerator.js')
const { BasePatternGenerator, w } = require('./BasePatternGenerator.js');
const base = new BasePatternGenerator();
const generator = new RhythmPatternGenerator();
const acid = new AcidBasslineGenerator();

console.log(JSON.stringify(acid))


for (let i = 0; i < 10; i++) {
  // console.log(generator.generatePattern())
  // console.log(acid.generateEuclidTrigPattern() + ' ' + acid.generateOctavePattern())
  console.log(acid.generatePattern())
}