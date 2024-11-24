function parseStreams(sectionCode) {
    const streamRegex = /\b(d\d+)\b/;
    const lines = sectionCode.split('\n');
    const streams = [];
  
    for (const line of lines) {
      const match = line.match(streamRegex);
      if (match) {
        streams.push(match[1]);
      }
    }
  
    return streams;
  }
  
  module.exports = { parseStreams };
  