FROM ghcr.io/swgoh-utils/swgoh-comlink:latest

# Let comlink pick up the dyno‐assigned port automatically
# (Heroku sets $PORT for you)
ENV PORT  ${PORT:-3000}

# Expose helps with local testing, but Heroku ignores EXPOSE
EXPOSE 3000

# Tell Docker (and thus Heroku) exactly how to start your app
# It will pick up $APP_NAME, $ACCESS_KEY, $SECRET_KEY and $PORT
CMD ["swgoh-comlink", "--name", "${APP_NAME}", "--port", "${PORT}"]