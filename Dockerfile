# Use the official WAHA Docker image as the base
FROM devlikeapro/waha

# Set the engine to WEBJS (Chromium-based)
ENV WAHA_ENGINE=WEBJS

# Expose the port WAHA runs on (Railway requires this to be set via PORT env, but we define a default)
EXPOSE 3000

# Command to run WAHA
# CMD ["npm", "start"]
CMD ["npm", "start", "--", "--port", "3000"]
