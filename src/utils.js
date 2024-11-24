function parseStreams(code) {
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
  
  module.exports = {
    parseStreams,
  };
  