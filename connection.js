// import dotenv from 'dotenv';
import dotenv from 'dotenv';
dotenv.config();

// import and require pool
import pg from 'pg';
const { Pool } = pg;

// create a new pool
const pool = new Pool({
    user: process.env.DB_USER,
    host: 'localhost',
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: 5432,
});

// connect to the database
const connectToDb = async () => {
    try {
        await pool.connect();
        console.log('Connected to the database');
    } catch (err) {
        console.error('Error connecting to the database', err);
        process.exit(1);
    }
};

// export pool and connectToDb
export {pool, connectToDb};