const RhythmPatternGenerator = require('./RhythmPatternGenerator');
const AcidBasslineGenerator = require('./AcidBasslineGenerator.js')
const BasePatternGenerator = require('./BasePatternGenerator.js');
const base = new BasePatternGenerator();
const generator = new RhythmPatternGenerator();
const acid = new AcidBasslineGenerator();


for (let i = 0; i < 10; i++) {
  // const pattern = generator.generatePattern();
  // console.log(`Generated Pattern ${i + 1}:`);
  // console.log(`${pattern}\n`);
  console.log(acid.generateEuclidTrigPattern() + ' ' + acid.generateOctavePattern())
  // console.log(base.getRandomEvenInt(1,16,0.5))
  // console.log(base.getRandomEvenInt(1,16,1.5))
}