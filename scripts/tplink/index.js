const { Client } = require('tplink-smarthome-api');
const client = new Client();

function getDeviceByAlias(alias) {
    return new Promise((resolve, reject) => {
        client.startDiscovery();

        client.on('plug-new', (plug) => {
            if (plug.alias === alias) {
                resolve(plug);
            }
            client.stopDiscovery();
        });

        client.on('error', (error) => {
            client.stopDiscovery();
            reject(error);
        });
    });
}

async function run() {
    const [, , name, command] = process.argv;
    const device = await getDeviceByAlias(name);

    try {
        const output = await device[command]();
        console.log(output);
    } catch (err) {
        console.error(err);
    }
}

run();
