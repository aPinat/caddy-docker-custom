FROM caddy:2.8.4-builder-alpine@sha256:98bd4545236c1aae8afab0eca255903487925e92ca06f14accf7e9ca607a163e AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:e97e0e3f8f51be708a9d5fadbbd75e3398c22fc0eecd4b26d48561e3f7daa9eb

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
