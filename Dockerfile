FROM ghcr.io/swgoh-utils/swgoh-comlink:latest

ENV PORT ${PORT:-3000}
EXPOSE 3000

# Exec form but explicitly invoke the shell
CMD ["sh", "-c", "swgoh-comlink --name \"$APP_NAME\" --port \"$PORT\""]