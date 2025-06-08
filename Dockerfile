# Use the official WAHA Docker image as the base
  FROM devlikeapro/waha

  # Set the engine to WEBJS (Chromium-based)
  ENV WAHA_ENGINE=WEBJS

  # Expose the dynamic port provided by Railway
  EXPOSE 3000

  # Copy WAHA source code (assuming you add it to your repo)
  COPY . /app

  # Install dependencies and build (if needed)
  RUN npm install
  RUN npm run build

  # Run WAHA with the correct port
  CMD ["npm", "run", "start:prod", "--", "--port", "$PORT"]
