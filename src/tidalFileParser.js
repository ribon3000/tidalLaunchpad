const fs = require('fs');

function parseTidalFile(filePath) {
    const fileContent = fs.readFileSync(filePath, 'utf-8');
    const sections = {};
    let currentSection = null;

    fileContent.split('\n').forEach((line) => {
        const sectionMatch = (line.match(/-- section (\d+)/) || line.match(/-- SECTION (\d+)/))
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

module.exports = parseTidalFile;
