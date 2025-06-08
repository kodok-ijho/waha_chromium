FROM node:20-slim

# Install Chromium dependencies (install satu kali saja, caching bisa efektif)
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy package.json dan package-lock.json dulu (agar npm install caching efektif)
COPY package*.json ./

# Install dependencies
RUN npm install

# Setelah dependencies terinstall, baru copy seluruh source code
COPY . .

# Pastikan Puppeteer tidak download Chromium otomatis (karena sudah ada library Chromium)
ENV PUPPETEER_SKIP_DOWNLOAD=true

CMD ["npm", "start"]
