const express = require('express');
const { initWaha } = require('./app');

const app = express();
app.use(express.json());

// Enable CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

// Basic route for health check
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'OK', message: 'Waha API is running' });
});

async function startServer() {
  try {
    const waha = initWaha();
    await waha.start();
    console.log(`Waha API started successfully on port ${process.env.WAHA_PORT || 3000}`);
  } catch (error) {
    console.error('Error starting Waha:', error);
    process.exit(1);
  }
}

startServer();
