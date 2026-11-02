# RustXNG on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/rustxng)

One-click Railway template for [RustXNG](https://github.com/sahenjp/RustXNG) (AGPL-3.0-or-later): a SearXNG-compatible metasearch and grounding engine for AI agents, written as a single Rust binary. A single request returns ranked results plus the page text. You don't need API keys, and outbound fetches are SSRF-guarded (public addresses only).

## Features

- Upstream image `ghcr.io/sahenjp/rustxng:0.26.0`, unmodified, packaged as `ghcr.io/onepush-dev/rustxng:0.26.0`
- SearXNG-compatible `/search?q=…&format=json` API and web UI, `/healthz`, OpenMetrics `/metrics`
- A generated `SEARXNG_SECRET` replaces the published default `server.secret_key` (signs the image/favicon proxy)
- Dual-stack listener on port 8888. Agents in the same Railway project can call `http://${{RustXNG.RAILWAY_PRIVATE_DOMAIN}}:8888` without going through the public internet

## Usage

```bash
curl "https://<your-domain>/search?q=railway+templates&format=json"
```

Point any SearXNG client (Open WebUI, LibreChat, LangChain `SearxSearchWrapper`, MCP SearXNG servers) at the service URL.

## Notes

- The instance is open, like upstream's default. To throttle abusive clients, mount your own `settings.toml` (`SEARXNG_SETTINGS_PATH`) with `server.limiter = true`. Be aware that upstream's public-instance limiter allows only a few JSON API calls per hour per IP, which blocks agent use.
- AGPL-3.0: if you modify RustXNG and serve it to others, publish your source. This image ships upstream's binary unchanged, built from https://github.com/sahenjp/RustXNG at v0.26.0.
