FROM node:22-slim

# Install dependencies including Chromium for WhatsApp Web
RUN apt-get update && apt-get install -y \
    git \
    curl \
    chromium \
    libgbm1 \
    libnss3 \
    libatk-bridge2.0-0 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libatspi2.0-0 \
    libcups2 \
    && rm -rf /var/lib/apt/lists/*

# Set Puppeteer to use system Chromium
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

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
