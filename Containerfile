ARG CADDY_TAG

FROM docker.io/library/caddy:${CADDY_TAG}-builder AS builder

LABEL org.opencontainers.image.authors = "Christopher Smith <chris@smith27.net>" \
      org.opencontainers.image.description = "Lightweight caddy container built with Cloudflare binaries installed." \
      org.opencontainers.image.version = "1.0.0"

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare && \
    /usr/bin/caddy version

FROM docker.io/library/caddy:${CADDY_TAG}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
