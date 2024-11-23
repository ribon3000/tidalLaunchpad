const { spawn } = require('child_process');

class TidalManager {
    constructor(bootFile) {
        this.bootFile = bootFile;
        this.process = null;
    }

    start() {
        this.process = spawn('~/.ghcup/bin/ghci -ghci-script', [this.bootFile], {
            shell: true,
        });

        this.process.stdout.on('data', (data) => {
            console.log(`TidalCycles: ${data}`);
        });

        this.process.stderr.on('data', (data) => {
            console.error(`Error: ${data}`);
        });

        this.process.on('error', (err) => {
            console.error(`Error starting TidalCycles: ${err.message}`);
        });

        this.process.on('close', (code) => {
            console.log(`TidalCycles exited with code ${code}`);
        });
    }

    sendCommand(command) {
        if (this.process) {
            this.process.stdin.write(command + '\n');
            console.log(command+"\n")
        } else {
            console.error('Tidal process not started');
        }
    }
}

module.exports = TidalManager;