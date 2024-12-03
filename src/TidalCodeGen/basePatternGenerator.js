class BasePatternGenerator {
    constructor() {
      // Common utilities or configuration shared across generators
    }

    getRandomOddInt(min, max, exponent = 1){
      let res = 0
      while(!res || res%2 == 0){
        res = this.getRandomInt(min,max,exponent)
      }
      return res
    }

    getRandomEvenInt(min, max, exponent = 1){
      let res = this.getRandomInt(min,max,exponent)
      while(res%2 != 0){
        res = this.getRandomInt(min,max,exponent)
      }
      return res
    }
  
    // Utility function to generate a random number within a range
    getRandomInt(min, max, exponent = 1) {
      return Math.floor(Math.pow(Math.random(),exponent) * (max - min + 1)) + min;
    }
  
    // Utility function to randomly select from an array
    pickRandom(options) {
      return options[Math.floor(Math.random() * options.length)];
    }

    // Utility function to generate a random float between min and max
    getRandomFloat(min, max, exponent = 1) {
        return Math.pow(Math.random(),exponent) * (max - min) + min;
    }

    probDo(probability) {
       return((Math.random() < probability))
    }

    weightedRandom(options) {
      const totalWeight = options.reduce((sum, { weight }) => sum + weight, 0);
      let randomNum = Math.random() * totalWeight;
      for (const option of options) {
        if (randomNum < option.weight) {
          return typeof option.value === 'function' ? option.value() : option.value;
        }
        randomNum -= option.weight;
      }
    }

  compressSequence(input) {
    if (typeof input !== 'string') {
        return input;
    }

    // Helper function to compress a flat sequence
    const compressFlatSequence = (sequence) => {
        const result = [];
        let count = 1;

        for (let i = 1; i <= sequence.length; i++) {
            if (sequence[i] === sequence[i - 1]) {
                count++;
            } else {
                if (count > 1) {
                    result.push(`${sequence[i - 1]}!${count}`);
                } else {
                    result.push(sequence[i - 1]);
                }
                count = 1;
            }
        }
        return result;
    };

    // Recursive function to parse and compress groups
    const parseAndCompress = (subInput) => {
        const stack = [];
        let currentSequence = [];
        let currentGroup = "";

        for (let i = 0; i < subInput.length; i++) {
            const char = subInput[i];

            if (char === "[" || char === "<") {
                // Push current sequence to stack
                if (currentSequence.length > 0) {
                    stack.push(compressFlatSequence(currentSequence).join(" "));
                    currentSequence = [];
                }
                // Push the opening group character to the stack
                stack.push(char);
            } else if (char === "]" || char === ">") {
                // Finish the current sequence
                if (currentSequence.length > 0) {
                    stack.push(compressFlatSequence(currentSequence).join(" "));
                    currentSequence = [];
                }

                // Collect everything from the stack until the matching opener
                let groupContent = [];
                while (stack.length > 0) {
                    const popped = stack.pop();
                    if (popped === "[" || popped === "<") {
                        currentGroup = char === "]" ? "[" : "<";
                        break;
                    }
                    groupContent.unshift(popped);
                }

                // Reconstruct the group, removing unwanted spaces
                const compressedGroup = `${currentGroup}${groupContent.join(" ")}${char}`;
                stack.push(compressedGroup);
            } else if (/\S/.test(char)) {
                // Accumulate current numbers (multi-digit, fractional, and `!` handling)
                if (/\d|!|\./.test(char)) {
                    let num = char;
                    while (i + 1 < subInput.length && /[\d!\.]/.test(subInput[i + 1])) {
                        num += subInput[++i];
                    }
                    currentSequence.push(num);
                } else {
                    currentSequence.push(char);
                }
            }
        }

        // Add any remaining sequence
        if (currentSequence.length > 0) {
            stack.push(compressFlatSequence(currentSequence).join(" "));
        }

        return stack.join(" ");
    };

    // Trim input and check if it's a single value
    input = input.trim();
    if (!input.includes(" ") && !input.includes("[") && !input.includes("<")) {
        return input; // Return single value as-is
    }

    // Parse recursively for groups and sequences
    const result = parseAndCompress(input.split(""));

    // Post-process to remove unwanted spaces near group delimiters
    return result.replace(/\[\s+/g, "[").replace(/\s+\]/g, "]")
                 .replace(/<\s+/g, "<").replace(/\s+>/g, ">");
}


  generateSubPat = (
      lenWeights = [{value: 8, weight:1}],
      contentWeights = [{value: () => this.getRandomInt(0,16), weight:1}],
      brackets = ()=>{return this.probDo(0.5) ? "[]" : "<>"}) => 
  {
    let patternLength = this.weightedRandom(lenWeights)
    let pattern = ""  
    for(let i=0;i<patternLength;i++) {
        let val = this.weightedRandom(contentWeights)
        let count = this.countIntegersInString(val)
        i+= (count > 1) ? count-1 : 0
        pattern += " " + val
    }
    let bracks = (typeof brackets === 'function') ? brackets() : brackets
    return bracks[0] + pattern.slice(1) + bracks[1]
  }

  countIntegersInString(input) {
    if(typeof input != "string") return 1
    // Use a regular expression to match all sequences of digits
    const matches = input.match(/\d+/g);

    // Return the number of matches, or 0 if no matches are found
    return matches ? matches.length : 0;
}


  generatePolyMetricPattern(lengthWeights, contentWeights, factor = 16){
    let pattern = ""
    let patternLength = this.weightedRandom(lengthWeights)
    for(let i=0;i<patternLength;i++){
        let val = this.weightedRandom(contentWeights)
        pattern += val + " "
    }
    pattern = this.compressSequence(pattern)
    pattern = "{" + pattern + "}%" + factor

    return `"${pattern}"`
  }

  }

  function w(valueFn, weight = 1) {
    return { value: valueFn, weight };
  }
  
  // Usage
  // let fillLenWeights = [
  //   w(() => 1),
  //   w(() => 2),
  //   w(() => 4, 3),
  //   w(() => this.getRandomEvenInt(4, 12), 0.5),
  //   w(() => this.getRandomOddInt(3, 11), 0.5),
  // ];
    
  module.exports = {
    BasePatternGenerator,
    w
  };