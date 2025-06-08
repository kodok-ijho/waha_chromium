const { WhatsAppAPI } = require('@waha/core');
const { chromium } = require('@waha/engines');

const initWaha = () => {
  const waha = new WhatsAppAPI({
    engine: chromium(),
    sessionDir: '../sessions',
    port: process.env.WAHA_PORT || 3000,
    secret: process.env.WAHA_SECRET || 'your-secure-secret-key',
  });

  return waha;
};

module.exports = { initWaha };
