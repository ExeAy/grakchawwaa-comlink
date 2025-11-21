# Deploying to Heroku with Docker

This project uses a custom Dockerfile and is automatically deployed to Heroku using GitHub Actions.

---

## Automated Deployment

Deployment is handled automatically by GitHub Actions. Every push to the `main` branch will trigger a deployment to Heroku.

### Initial Setup (One-time)

1. **Get your Heroku API Key:**
   - Go to https://dashboard.heroku.com/account
   - Or run locally: `heroku auth:token`

2. **Add the API Key to GitHub Secrets:**
   - Go to your GitHub repository
   - Navigate to **Settings** → **Secrets and variables** → **Actions**
   - Click **New repository secret**
   - Name: `HEROKU_API_KEY`
   - Value: Your Heroku API key
   - Click **Add secret**

3. **Set Config Vars (if needed):**
   If your app needs environment variables, set them in Heroku:
   ```sh
   heroku config:set VAR_NAME=value -a grakchawwaa-swgoh-comlink
   ```

### How It Works

- **Automatic:** Pushes to `main` branch automatically trigger deployment
- **Manual:** You can also manually trigger deployments from the **Actions** tab in GitHub
- The workflow builds your Docker image and deploys it to the Heroku app `grakchawwaa-swgoh-comlink`

---

## Heroku App

This app is deployed to: `grakchawwaa-swgoh-comlink`

To open your app:
```sh
heroku open -a grakchawwaa-swgoh-comlink
```

---

## Notes

- Heroku expects your container to start a web process (i.e., listen on `$PORT`). If the base image you're using does not do this, you may need to add a `CMD` or `ENTRYPOINT` in your Dockerfile or override it in a `heroku.yml`.
- If you need to expose a port, make sure your app listens on the port specified by the `$PORT` environment variable (Heroku sets this automatically).
