const {Pool} = require('pg');

const config = {
    host: 'localhost',
    user: 'postgres',
    password: 'superpass',
    database: 'reserFood'
};

const pool = new Pool(config); 



module.exports = pool;