const express = require('express');
const puppeteer = require('puppeteer');
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');

const app = express();
const PORT = process.env.PORT || 3000;

// Swagger config
const swaggerOptions = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'WAHA Chromium API',
      version: '1.0.0',
      description: 'API ini menjalankan Puppeteer untuk scraping halaman web.',
    },
    servers: [
      {
        url: `http://localhost:${PORT}`,
        description: 'Local server',
      },
    ],
  },
  apis: ['./index.js'], // Dokumentasi dari JSDoc di dalam file ini
};

const swaggerSpec = swaggerJsdoc(swaggerOptions);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

/**
 * @swagger
 * /:
 *   get:
 *     summary: Kunjungi halaman contoh dengan Puppeteer
 *     description: Membuka halaman example.com dan mengambil judulnya.
 *     responses:
 *       200:
 *         description: Berhasil mendapatkan judul halaman
 *         content:
 *           text/plain:
 *             schema:
 *               type: string
 */
app.get('/', async (req, res) => {
  try {
    const browser = await puppeteer.launch({
      headless: true,
      args: ['--no-sandbox', '--disable-setuid-sandbox'],
    });

    const page = await browser.newPage();
    await page.goto('https://example.com');
    const title = await page.title();
    await browser.close();

    res.send(`Halaman berhasil dibuka: ${title}`);
  } catch (error) {
    console.error('Terjadi error:', error);
    res.status(500).send('Terjadi error saat menjalankan Puppeteer.');
  }
});

app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
  console.log(`Swagger UI tersedia di http://localhost:${PORT}/api-docs`);
});
