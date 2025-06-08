# waha_chromium
waha with Chromium support
Waha Railway Deploy
A WhatsApp API implementation using Waha with Chromium, designed for deployment on Railway.


Project Structure

waha-railway-deploy/
├── config/           # Environment configuration
│   └── .env
├── src/              # Application source code
│   ├── app.js        # Waha initialization logic
│   └── server.js     # Express server and entry point
├── .gitignore        # Git ignore rules
├── package.json      # Project metadata and dependencies
├── Procfile          # Railway process configuration
├── nixpacks.toml     # Railway environment configuration
├── README.md         # Project documentation

Prerequisites

Node.js and npm (install here)
Git (install here)
Railway account (sign up here)
GitHub account (sign up here)

Setup

Clone the repository:git clone https://github.com/<your-username>/waha-railway-deploy.git
cd waha-railway-deploy


Install dependencies:npm install


Configure environment variables:
Copy config/.env.example to config/.env (if provided) or create config/.env:WAHA_PORT=3000
WAHA_SECRET=your-secure-secret-key




Run locally:npm start


Access the health check at http://localhost:3000/health.



Deployment to Railway

Push to GitHub:
Ensure all changes are committed and pushed to your GitHub repository.


Create a Railway project:
Log in to Railway.
Create a new project and link it to your GitHub repository.


Add environment variables:
In Railway's dashboard, go to the Variables tab.
Add WAHA_PORT and WAHA_SECRET as defined in config/.env.


Deploy:
Railway will detect Procfile and nixpacks.toml to build and deploy the app.
Once deployed, access the app via the provided Railway URL.



Notes

Sessions: Waha stores session data in the sessions/ directory, which is ignored by .gitignore.
Chromium: The nixpacks.toml ensures Chromium is available in the Railway environment.
Security: Keep WAHA_SECRET secure and never commit config/.env to GitHub.
Documentation: Refer to Waha's GitHub for advanced configuration.

License
MIT
