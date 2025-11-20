# Stage 1: pull down the comlink binary
FROM ghcr.io/swgoh-utils/swgoh-comlink:latest AS builder

# Stage 2: use Alpine (has /bin/sh), copy the binary in
FROM alpine:3.18

# Install ca-certs so HTTPS endpoints still work
RUN apk add --no-cache ca-certificates

# Copy the single binary; adjust this path if the binary lives elsewhere
COPY --from=builder /swgoh-comlink /usr/local/bin/swgoh-comlink

# Ensure the binary is executable
RUN chmod +x /usr/local/bin/swgoh-comlink

# Set default PORT (Heroku will override this at runtime with $PORT)
ENV PORT=3000

# EXPOSE is only for local Docker-Compose; Heroku ignores it
EXPOSE 3000

# Use exec form with proper signal handling for graceful shutdowns
# The exec ensures the process receives signals properly (SIGTERM, SIGKILL)
# APP_NAME is required, so we always pass it
CMD ["/bin/sh", "-c", "exec swgoh-comlink --name \"${APP_NAME}\" --port \"${PORT}\""]
