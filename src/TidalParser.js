class TidalParser {
    static parseSections(fileContent) {
      const sections = {};
      let currentSection = null;
  
      fileContent.split('\n').forEach((line) => {
        const sectionMatch = line.match(/-- section (\d+)/i);
        if (sectionMatch) {
          currentSection = sectionMatch[1];
          sections[currentSection] = [];
        } else if (currentSection) {
          sections[currentSection].push(line);
        }
      });
  
      // Join lines back together for each section
      Object.keys(sections).forEach((key) => {
        sections[key] = sections[key].join('\n');
      });
  
      return sections;
    }
  
    static parseStreams(code) {
      const lines = code.split('\n');
      const streams = {};
  
      lines.forEach((line) => {
        const match = line.match(/^\s*(d[1-8])\s*\$/);
        if (match) {
          const streamName = match[1];
          streams[streamName] = line;
        }
      });
  
      return streams;
    }
  
    static parseModifiedStreams(oldCode, newCode) {
      // Function to remove comments and blank lines
      const removeCommentsAndBlanks = (lines) => {
        return lines.filter(line => !/^\s*--/.test(line) && line.trim() !== '');
      };
    
      // Split code into lines and remove comments/blanks
      const oldLines = removeCommentsAndBlanks(oldCode.split('\n'));
      const newLines = removeCommentsAndBlanks(newCode.split('\n'));
    
      const oldStreams = this.parseStreams(oldCode);
      const newStreams = this.parseStreams(newCode);
    
      const modified = [];
      let nonStreamChange = false;
    
      // Compare the lines to determine modifications
      for (let i = 0; i < Math.max(oldLines.length, newLines.length); i++) {
        const oldLine = oldLines[i] || '';
        const newLine = newLines[i] || '';
    
        if (oldLine !== newLine) {
          // Check if the line belongs to a stream
          const streamMatch = newLine.match(/^\s*(d[1-8])\s*\$/);
          if (streamMatch) {
            const streamKey = streamMatch[1];
            // If the stream has changed, add it to the modified list
            const streamIndex = parseInt(streamKey.slice(1), 10) - 1;
            modified.push(streamIndex);
          } else {
            // If non-stream code has changed, mark entire section as modified
            //nonStreamChange = true; //commenting out because it's currently not working correctly
          }
        }
      }
    
      // If non-stream changes are detected, mark all streams as modified
      if (nonStreamChange) {
        return [...Array(8).keys()]; // Mark all streams as modified
      }
    
      return modified;
    }
  }
  
  module.exports = TidalParser;
  