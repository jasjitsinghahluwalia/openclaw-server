# OpenClaw Server

Personal AI Assistant running on [Zeabur](https://zeabur.com/).

## Deployment

### One-Click Deploy to Zeabur

[![Deploy on Zeabur](https://zeabur.com/button.svg)](https://zeabur.com/templates/openclaw)

### Manual Deployment

1. Fork this repository
2. Connect to Zeabur
3. Set environment variables:
   - `OPENCLAW_GATEWAY_TOKEN`: Your gateway authentication token
   - `GOOGLE_API_KEY`: (Optional) Google AI API key

## Configuration

Edit `openclaw.json` to customize:
- AI model settings
- Channel configurations (WhatsApp, Telegram, Discord)
- Security settings

## Connecting Channels

After deployment, you'll need to:

1. **WhatsApp**: Run `openclaw channels login` locally and pair with your server
2. **Telegram**: Set `TELEGRAM_BOT_TOKEN` environment variable
3. **Discord**: Set `DISCORD_BOT_TOKEN` environment variable

## Access

- **Dashboard**: `https://your-app.zeabur.app/`
- **WebSocket**: `wss://your-app.zeabur.app/`

## Local Development

```bash
# Install OpenClaw
npm install -g openclaw@latest

# Run gateway
openclaw gateway --port 18789
```

## Documentation

- [OpenClaw Docs](https://docs.openclaw.ai/)
- [Zeabur Docs](https://zeabur.com/docs)
