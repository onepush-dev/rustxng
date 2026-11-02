# RustXNG (sahenjp/RustXNG, AGPL-3.0-or-later) for Railway: the upstream image, unmodified,
# started on a dual-stack listener so both the public domain and the private network
# (other services calling http://rustxng.railway.internal:8888) can reach it.
FROM ghcr.io/sahenjp/rustxng:0.26.0
ENV SEARXNG_PORT=8888
EXPOSE 8888
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/local/bin/rustxng --bind '[::]' --port \"${SEARXNG_PORT:-8888}\""]
