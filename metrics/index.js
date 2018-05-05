const mysql = require('mysql2/promise');

class Stats {

    constructor(dbHost, dbPassword) {
        this._dbHost = dbHost;
        this._dbPassword = dbPassword;
    }

    async update() {
        let data = await this.load();
        data = this.extend(data);
        data = this.format(data);
        return data;
    }

    async load() {
        if (this._dbHost && !this.connectionPool) {
            this._connectionPool = await mysql.createPool({
                host: dbHost,
                user: 'pool_metrics',
                password: dbPassword,
                database: 'pool'
            });
        }

        if (this._connectionPool) {
            // query DB
        }
        else return DUMMY_DATA; // testing only
    }

    extend(data) {
        data.expected = data.rewards/data.connected;
        return data;
    }

    format(raw) {
        let formatted = Object.assign({}, raw);

        let index = 0, scale = ['H/s', 'kH/s', 'MH/s', 'GH/s', 'TH/s', 'PH/s'];
        while (formatted.hashpower >= 1000) {
            index++;
            formatted.hashpower /= 1000;
        }
        formatted.hashpower = `${formatted.hashpower} ${scale[index]}`

        return { raw, formatted };
    }
}

const DUMMY_DATA = {
    "connected": 100,     // currently
    "hashpower": 1000000, // current H/s
    "fee": 0.01,          // fraction
    "rewards": 4000       // per day
}
