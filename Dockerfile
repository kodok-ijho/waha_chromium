# Use the official WAHA Docker image as the base
FROM devlikeapro/waha

# Set the engine to WEBJS (Chromium-based)
ENV WAHA_ENGINE=WEBJS

# Expose the dynamic port provided by Railway
EXPOSE $PORT

# Command to run WAHA, using the PORT environment variable
CMD ["npm", "start", "--port", "$PORT"]
