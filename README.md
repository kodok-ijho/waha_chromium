WAHA Deployment on Railway
This repository sets up WAHA (WhatsApp HTTP API) with the Chromium-based WEBJS engine for deployment on Railway.
Prerequisites

A GitHub account linked to Railway.
A Railway account (sign up at railway.app).
Docker installed locally for testing (optional).
A WhatsApp-installed mobile device for scanning the QR code to start a session.

Setup Instructions

Fork or Clone this Repository:

Fork this repository to your GitHub account or clone it locally.


Create a New Project on Railway:

Log in to your Railway dashboard.
Click "New Project" and select "Deploy from GitHub repo."
Choose this repository and link your GitHub account if prompted.


Configure Environment Variables:

In the Railway dashboard, go to the service settings and add the following variables:
PORT: 3000 (Railway requires the app to listen on this port).
WAHA_ENGINE: WEBJS (ensures the Chromium-based engine is used).
(Optional) WAHA_SWAGGER_USERNAME and WAHA_SWAGGER_PASSWORD for securing the Swagger API documentation.




Deploy the Application:

Click "Deploy Now" in the Railway dashboard.
Railway will build and deploy the Docker image from the Dockerfile.
Once deployed, go to the service settings and click "Generate Domain" to get a public URL.


Start a WhatsApp Session:

Open the deployed URL (e.g., https://your-app.railway.app) in your browser.
Navigate to the Swagger documentation at / (e.g., https://your-app.railway.app/).
Use the /session/start endpoint to generate a QR code.
Scan the QR code with your WhatsApp mobile app to start a session.


Test the API:

Use the Swagger UI to send a test message via the /api/sendText endpoint.
Example: Send a message to a WhatsApp number using the session you started.



Notes

The Dockerfile uses the official WAHA image (devlikeapro/waha) and sets the WEBJS engine.
The Procfile tells Railway to run npm start to launch the WAHA application.
Ensure your Railway plan supports Docker deployments (private registries may require the Pro plan).
If you encounter port issues, verify the PORT environment variable is set to 3000.
For private repositories, ensure Railway has access via the GitHub App configuration.

Troubleshooting

Application Error: Not listening on $PORT: Ensure the PORT environment variable is set to 3000 in Railway.
Build Fails: Check the deploy logs in the Railway dashboard for errors related to Docker or missing dependencies.
Session Fails to Start: Ensure your WhatsApp mobile app is ready to scan the QR code and that the browser environment supports Chromium.

For more details, refer to the WAHA GitHub repository or Railway documentation.
