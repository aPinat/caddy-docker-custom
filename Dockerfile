FROM caddy:2.8.4-builder-alpine@sha256:efcaded1f3de9b4af57b504287685af4abb4d6152188550387b454236526a9fc AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:896c6fb9e3eae11890f53dc528b8a9be1b4d058f6b7603024feb084fc203c0b4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
