const BasePatternGenerator = require('./BasePatternGenerator')

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

//some notes on euclid trig generation for acid patterns
//fill values should trend towards 16 rather than 0
//whereas rotation values should be many and most of them should be 0

class AcidBasslineGenerator extends BasePatternGenerator {
    constructor() {
        super()
        // Configuration or state specific to rhythm generation can go here
    }

    generatePattern(streamN = 1) {
        
        const trigPattern = this.generateEuclidTrigPattern()


        // Construct the final pattern
        const patternCode = ` outside ${loopLength} loopFirst $ fast "${fastValue}"
        $ s ${trigPattern}
        # n (${midiNoteNumber} + ${octavePattern} + ${melodyPattern})
        # legato ${slidePattern}
        # amp ${accentPattern}
        # val1 ${cutoffPattern}
        # val2 ${macroPattern}
        `;
        return patternCode;
      }

    generateEuclidTrigPattern(){

        let fillLenWeights = [
            {value: 1, weight:2},
            {value: 2, weight:2},
            {value: 8, weight:1},
            {value: () =>  this.getRandomEvenInt(4,12), weight:0.5},
            {value: () =>  this.getRandomOddInt(3,11), weight:0.5},
        ]
        let fillContentWeights = [
            {value: () => this.getRandomOddInt(3,15), weight:0.5},
            {value: () => this.getRandomEvenInt(2,16), weight:0.5},
            {value: () => {return `${this.getRandomEvenInt(2,16)}!${this.getRandomInt(2,8)}`}, weight:0.5},
            {value: 16, weight:0.5},
            {value: () => this.generateSubPat([{value:2, weight:1}]), weight: 0.5}
        ]

        let offsetContentWeights = [
            {value: 0, weight: 5},
            {value: () => this.getRandomOddInt(3,15), weight:1.5},
            {value: () => this.getRandomEvenInt(2,16), weight:0.5},
        ]

        // const generateNum = (standardValue = 0) => {
        //     let nums = ""
        //     if(this.probDo(0.5)){
        //             nums += this.getRandomInt(standardValue,15) + " "
        //         } else {
        //             const brackets = (this.probDo(0.8)) ? "[]" : "<>"
        //             const part1 = (this.probDo(0.5)) ? this.getRandomInt(1,15) : "0"
        //             const part2 = (this.probDo(0.8)) ? this.getRandomInt(1,15) : "0"
        //             nums += (part1 != part2) ? (brackets[0] + part1 + " " + part2 + brackets[1] + " ") : part1
        //         }
        //     return nums
        // }
        
        let euclidFills = this.generateSubPat(fillLenWeights, fillContentWeights)
        euclidFills = this.compressSequence(euclidFills)
        let euclidRotations = this.generateSubPat(fillLenWeights, offsetContentWeights)
        euclidRotations = this.compressSequence(euclidRotations)
        return `"t( ${euclidFills} , 16 , ${euclidRotations} )"`
    }

    //this could be abstracted into: generatePolyPattern with weights for length and content choices, right?
    //and since we can use function calls in weights we could even do this recursively (makes no sense for polypatterns but others i guess)

    //recursion goes deep:
    //so basically there'd be grouped patterns which can also include themselves [], cycling patterns which can also include grouped patterns <> / <[]>
    //polypatterns which can include cycling and grouped patterns {}%16 / {[[]]<> <[]>}%16
    //and euclidean patterns which can include any of the above t(<>,16,{[[]] <> [<[]>]}%16)
    //i guess we're also missing nested cycling patterns <<>> and chord patterns as a subset of grouped patterns [,]
    //BUT lets start simple !!!!

    generateOctavePattern(){
        let lenWeights= [
                {value: ()=>this.getRandomEvenInt(2,16,2), weight: 1},
                {value: ()=>this.getRandomOddInt(3,15,2), weight: 0.5},
                {value: 8, weight: 1}
            ]
            
            let valWeights = [
                {value: "24", weight: 0.2},
                {value: "12", weight: 0.8},
                {value: ()=>this.generateOctavePattern(), weight:0.2},
                {value: "0", weight: 6.2}
            ]
        return this.generatePolyMetricPattern(lenWeights,valWeights,16)
    }

    //we need a base nested/recursive pattern generator for [5 2 [4 2 [3 3 4]]] style stuff
    //with a maximum recursion level at the topmost thing

    generateNestedPattern(){

    }
}

module.exports = AcidBasslineGenerator;