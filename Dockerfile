# Stage 1: pull down the comlink binary
FROM ghcr.io/swgoh-utils/swgoh-comlink:latest AS builder

# Stage 2: use Alpine (has /bin/sh), copy the binary in
FROM alpine:3.18

# (Install ca-certs so HTTPS endpoints still work)
RUN apk add --no-cache ca-certificates

# Copy the single binary; adjust this path if the binary lives elsewhere
COPY --from=builder /swgoh-comlink /usr/local/bin/swgoh-comlink

# Let Heroku inject $PORT; default to 3000 locally
ENV PORT ${PORT:-3000}

# EXPOSE is only for local Docker-Compose; Heroku ignores it
EXPOSE 3000

# Shell-form CMD: this runs under /bin/sh -c,
# so $APP_NAME and $PORT get expanded at runtime
CMD swgoh-comlink --name "$APP_NAME" --port "$PORT"