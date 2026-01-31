FROM node:22-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install OpenClaw globally
RUN npm install -g openclaw@latest

# Create app directory
WORKDIR /app

# Create OpenClaw directories
RUN mkdir -p /root/.openclaw

# Copy configuration (will be overridden by env vars)
COPY openclaw.json /root/.openclaw/openclaw.json

# Expose gateway port
EXPOSE 18789

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD curl -f http://localhost:18789/health || exit 1

# Start OpenClaw gateway
CMD ["openclaw", "gateway", "--port", "18789", "--bind", "lan"]
