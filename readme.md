# Deploying to Heroku with Docker

This project uses a custom Dockerfile. To deploy it to Heroku using Heroku's Container Registry, follow these steps:

---

## 1. Prerequisites

- You need a Heroku account.
- Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli).
- Install [Docker](https://docs.docker.com/get-docker/).

---

## 2. Log in to Heroku and Container Registry

```sh
heroku login
heroku container:login
```

---

## 3. Create a Heroku App

This app has already been created and is called `grakchawwaa-swgoh-comlink`.

---

## 4. Build and Push Your Docker Image

From your project directory (where your Dockerfile is):

```sh
heroku container:push web -a grakchawwaa-swgoh-comlink
```

---

## 5. Release the Image

```sh
heroku container:release web -a grakchawwaa-swgoh-comlink
```

---

## 6. Open Your App

```sh
heroku open -a grakchawwaa-swgoh-comlink
```

---

## 7. (Optional) Set Config Vars

If your app needs environment variables, set them with:

```sh
heroku config:set VAR_NAME=value -a grakchawwaa-swgoh-comlink
```

---

### Notes

- Heroku expects your container to start a web process (i.e., listen on `$PORT`). If the base image you're using does not do this, you may need to add a `CMD` or `ENTRYPOINT` in your Dockerfile or override it in a `heroku.yml`.
- If you need to expose a port, make sure your app listens on the port specified by the `$PORT` environment variable (Heroku sets this automatically).
