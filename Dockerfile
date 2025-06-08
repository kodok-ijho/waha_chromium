# Use the official WAHA Docker image as the base
FROM devlikeapro/waha

# Set the engine to WEBJS (Chromium-based)
ENV WAHA_ENGINE=WEBJS

# Expose the dynamic port provided by Railway
EXPOSE 3000

# Copy package.json and install dependencies
COPY package.json /app/
RUN npm install --legacy-peer-deps

# Copy the rest of the application code (if you have it)
COPY . /app/

# Build the application
RUN npm run build

# Run WAHA with the correct port
CMD ["sh", "-c", "npm run start:prod --port $PORT"]
