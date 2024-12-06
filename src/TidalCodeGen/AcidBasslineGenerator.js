const { BasePatternGenerator, w, maybeApply } = require('./BasePatternGenerator');
/*
    should generate patterns such as this one:
    d4 $ outside 8 (loopFirst) -- loopLen
       $ fast 1 -- tempo
       -- main trig structure (complex euclidean based):
       $ s ("t({11 11 9 5 7}%16,16,{0 0 -1}%8)")  
       -- pitch sequence (independent of main trigs)
       -- features base pitch, octave modifiers (polyrhythmic) and interval modifiers (also poly)
       # n (43 + "{0 0 0 12 0 -12 0}%16" + "0 5 -2 7") 
       -- slide/length value sequence:
       # legato "{1 0.2 2 1 1 3 0.5}%16"
       -- accent/amp sequence:
       # amp "{0.2 0.2 1 0.2 0.2}%4" 
       -- macro sequences:
       # val1 "{0 1 0 0.25 0.5}%8" 
       # val2 (segment 16 $ rand) -- i like the option of having these be random
*/

class AcidBasslineGenerator extends BasePatternGenerator {
    constructor() {
        super()
        // Configuration or state specific to rhythm generation can go here
    }

    generatePattern(streamN = 1) {
        
        const trigPattern = this.generateEuclidTrigPattern()
        const loopLength = this.getRandomEvenInt(2,8,1.2)
        const loopAtPat = this.generateSubPat([{value:()=>this.getRandomInt(1,4,2), weight:1}],[
            w(()=>this.getRandomInt(0,8,2)),
            w(()=>this.getRandomInt(0,8,2) + 0.5),
            w(()=>0),
        ],"<>")
        const fastValue = 1
        const midiNoteNumber = 36
        const melodyPattern = this.compressSequence(this.generateSubPat([w(()=>8)], 
            [
                w(()=>0), 
                w(()=>this.getRandomInt(0,12)),
                w(()=>this.generateSubPat([w(()=>2,4),w(()=>4)]))
            ]))
        const octavePattern = this.generateOctavePattern()
        let accentPattern = "\"{1 0.5!4}%16\""
        const slidePattern  = this.generatePolyMetricPattern([w(()=>this.getRandomOddInt(3,9))],[w(()=>this.getRandomInt(1,4) * 0.5),w(()=>1)])
        const cutoffPattern = `(slow ${Math.random() * 0.5} $ rand)`
        const macroPattern = `(slow ${Math.random() + 0.5} $ rand)`

        //maybe apply some functions
        const reversePattern = (pattern) => `(rev $ ${pattern})`
        accentPattern = maybeApply(0.5,reversePattern)(accentPattern)

        // Construct the final pattern
        const patternCode = `outside ${loopLength} (loopAt "${loopAtPat}") $ fast "${fastValue}"
        $ s ${trigPattern}
        # n (${midiNoteNumber} + ${octavePattern} + "${melodyPattern}")
        # legato ${slidePattern}
        # amp ${accentPattern}
        # val1 (slow ${Math.random() + 0.5} $ rand)
        # val2 (slow ${Math.random() + 0.5} $ rand)`;
        return patternCode;
      }

    generateEuclidTrigPattern(){

        //workflow: devise weighted random choices for various function call parameters of "generateSubPat"
        //which can recursively call itself too, with different arguments (weights can be recursive as well, no idea if thats actually useful)
        //these can then be tweaked to create results we like

        let fillLenWeights = [
            w(()=>1),
            w(()=>2),
            w(()=>4,3),
            w(()=>this.getRandomEvenInt(4,12), 0.5),
            w(()=>this.getRandomOddInt(3,11), 0.5),
        ]

        let fillContentWeights = [
            w(() => this.getRandomOddInt(3,15,0.7), 0.5),
            w(() => this.getRandomEvenInt(2,16,0.7), 0.5),
            w(() => {return `${this.getRandomEvenInt(2,16,0.6)}!${this.getRandomInt(2,8,2)}`}, 0.5),
            w(() => 16, 0.5),
            w(() => this.generateSubPat([{value:2, weight:1}]), 0.5)
        ]

        let rotationLenWeights = [
            w(()=>4),
            w(()=>3,0.5),
            w(()=>1,0.5),
            w(()=>this.getRandomInt(1,8),0.5)
        ]

        const changeSign = (num) => 0-num

        let rotationContentWeights = [
            w(() =>0, 3),
            w(() => maybeApply(0.2,changeSign)(this.getRandomOddInt(3,15)), 1.5),
            w(() => this.getRandomEvenInt(2,16), 0.5),
        ]
        
        let euclidFills = this.generateSubPat(fillLenWeights, fillContentWeights)
        euclidFills = this.compressSequence(euclidFills)
        let euclidRotations = this.generateSubPat(rotationLenWeights, rotationContentWeights)
        euclidRotations = this.compressSequence(euclidRotations)
        return `"t(${euclidFills},16,${euclidRotations})"`
    }

    generateOctavePattern(){
        let lenWeights= [
                w(()=>this.getRandomEvenInt(2,16,2)),
                w(()=>this.getRandomOddInt(3,15,2), 0.5),
                w(()=>8)
            ]
            
            let valWeights = [
                w(()=>"24",0.2),
                w(()=>"12",0.8),
                w(()=>"0",6.2)
            ]
        return this.generatePolyMetricPattern(lenWeights,valWeights,16)
    }
}

module.exports = AcidBasslineGenerator;