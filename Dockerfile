# RustXNG (sahenjp/RustXNG, AGPL-3.0-or-later) for Railway: the upstream image, unmodified,
# started on a dual-stack listener on Railway's PORT (8080), so both the public domain and
# the private network (http://rustxng.railway.internal:8080) reach it, and the healthcheck
# hits the right port.
FROM ghcr.io/sahenjp/rustxng:0.26.0
ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/local/bin/rustxng --bind '[::]' --port \"${PORT:-8080}\""]
