const RhythmPatternGenerator = require('./RhythmPatternGenerator');
const AcidBasslineGenerator = require('./AcidBasslineGenerator.js')
const BasePatternGenerator = require('./BasePatternGenerator.js');
const base = new BasePatternGenerator();
const generator = new RhythmPatternGenerator();
const acid = new AcidBasslineGenerator();


for (let i = 0; i < 10; i++) {
  console.log('\t'+acid.generateEuclidTrigPattern() + ' ' + acid.generateOctavePattern())
}