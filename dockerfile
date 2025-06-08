# Gunakan image Node.js sebagai base
FROM node:20-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
  chromium \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libdbus-1-3 \
  libdrm2 \
  libgbm1 \
  libnspr4 \
  libnss3 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  xdg-utils \
  wget \
  ca-certificates \
  --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*

# Atur env untuk Puppeteer pakai Chromium system
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium \
    PUPPETEER_SKIP_DOWNLOAD=true \
    NODE_ENV=production

# Set workdir
WORKDIR /app

# Copy package files dan install deps
COPY package*.json ./
RUN npm install --production

# Copy seluruh source code
COPY . .

# Port yang digunakan WAHA (default 3000)
EXPOSE 3000

# Jalankan WAHA
CMD ["npm", "start"]
