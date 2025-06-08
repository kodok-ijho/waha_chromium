 FROM devlikeapro/waha

 # Set the engine to WEBJS (Chromium-based)
 ENV WAHA_ENGINE=WEBJS

 # Expose the dynamic port provided by Railway
 EXPOSE 3000

 # Install dependencies with legacy peer deps
 RUN npm install --legacy-peer-deps

 # Run WAHA with the correct port
 CMD ["sh", "-c", "npm run start:prod --port $PORT"]
