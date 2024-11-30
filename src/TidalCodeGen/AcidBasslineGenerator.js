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

        const generateNum = (sv = 0) => {
            let nums = ""
            if(this.probDo(0.5)){
                if(this.probDo(0.5)){
                    nums += this.getRandomInt(sv,15) + " "
                } else {
                    const brackets = (this.probDo(0.8)) ? "[]" : "<>"
                    const part1 = (this.probDo(0.5)) ? this.getRandomInt(1,15) : "0"
                    const part2 = (this.probDo(0.8)) ? this.getRandomInt(1,15) : "0"
                    nums += (part1 != part2) ? (brackets[0] + part1 + " " + part2 + brackets[1] + " ") : part1
                }
            } else {
                nums += sv + " "
            }
            return nums
        }
        const generateSubPat = (sv = 0, expo = 1) => {
            let subPat = ""
            const brackets = this.probDo(0.5) ? "[]" : "<>"
            //generate rotations pattern
            if(this.probDo(0.5)){
                if(this.probDo(0.5)){
                    //simple euclid rotation number, completely random
                    subPat = this.getRandomInt(0,16,expo)
                    subPat = (subPat > 0) ? subPat : sv
                } else {
                    let subPatLen = this.getRandomInt(2,5)
                    let subPatVals = brackets[0]
    
                    for(let i=0;i<subPatLen;i++) {
                            const newVal = generateNum(sv)
                            if(newVal != subPatVals[subPatVals.length-2]) {
                                subPatVals += newVal
                            }
                    }
                    //subPatVals = subPatVals.slice(0, -1)
                    subPatVals += brackets[1]
                    subPat = subPatVals
                }        
            } else {
                subPat = sv
            }
            return subPat
        }
        const euclidFills = generateSubPat(this.getRandomInt(8,16,0.5),0.125)
        const euclidRotations = generateSubPat(this.getRandomInt(0,3,1.5),1.5)
        return `"t( ${euclidFills} , 16 , ${euclidRotations} )"`
    }

    generateOctavePattern(){
        let octavePattern = ""
        let octavePatternLen = this.weightedRandom(
            [
                {value:3,weight:0.2},
                {value:4,weight:1},
                {value:5,weight:0.5},
                {value:6,weight:0.7},
                {value:7,weight:0.2},
                {value:8,weight:1},
                {value:12,weight:0.6},
                {value:14,weight:0.5},
                {value:16,weight:1},
                //{value: ()=> this.getRandomInt(2,16), weight:99} //we can also do functions here
            ]
        )
        octavePattern += "{"
        for(let i=0;i<octavePatternLen;i++){
            let val = (this.probDo(0.2)) ? "24 " : "12 "
            octavePattern += (this.probDo(0.2)) ? val : "0 "
        }
        octavePattern += "}%16"

        return `"${octavePattern}"`
    }
}

module.exports = AcidBasslineGenerator;