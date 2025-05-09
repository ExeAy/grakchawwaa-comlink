FROM ghcr.io/swgoh-utils/swgoh-comlink:latest

# Let Heroku expose your dyno’s port via $PORT
ENV PORT ${PORT:-3000}

# (Optional) Good for local Docker testing
EXPOSE 3000

# Shell form: will expand $APP_NAME and $PORT
CMD swgoh-comlink --name "$APP_NAME" --port "$PORT"