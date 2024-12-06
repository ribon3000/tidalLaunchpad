const AcidBasslineGenerator = require('./AcidBasslineGenerator')
const RhythmPatternGenerator = require('./RhythmPatternGenerator')

class GeneratorProvider {
    constructor() {
        this.AcidBasslineGenerator = new AcidBasslineGenerator;
        this.RhythmPatternGenerator = new RhythmPatternGenerator;
        this.availableGenerators = {acidBasslineGenerator: this.AcidBasslineGenerator,
                                    rhythmPatternGenerator: this.RhythmPatternGenerator}
    }

    listAvailableGenerators(){
        return this.availableGenerators.keys()
    }

    runGenerator(key,trackN){
        return this.availableGenerators[key].generatePattern(trackN)
    }

}