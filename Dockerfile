FROM node:20

# Buat folder kerja
WORKDIR /app

# Copy semua file ke container
COPY . .

# Install dependencies
RUN npm install

# Build WAHA kalau pakai TypeScript atau bundler
# RUN npm run build

# Jalankan WAHA
CMD ["node", "index.js"]
