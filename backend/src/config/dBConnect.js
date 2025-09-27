const mongoose = require('mongoose');
    let dbURI = '';
    const DB_USER = process.env.MONGO_USER;
    const DB_PASS = process.env.MONGO_PASS;
    const DB_HOST = 'mongo-db'; 
    const DB_PORT = 27017;
    const DB_NAME = 'projetos';

    if (DB_USER && DB_PASS && DB_HOST && DB_PORT && DB_NAME) {
        dbURI = `mongodb://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}?authSource=admin`;
    } else {
        dbURI = 'mongodb://localhost:27017/projetos';
    }

const connectDB = async () => { 

    try {
        await mongoose.connect(dbURI); 
        console.log("Conectado ao MongoDB Local!");
    } catch (err) {
        console.error("Erro ao se conectar ao MongoDB Local:", err);
        process.exit(1); 
    }
};

module.exports = connectDB;