FROM caddy:2.8.4-builder-alpine@sha256:0030fe883629b7c7923e2b8b2ff76608346e08ab88192c5e78ab290e8ca7046f AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-webdav \
    --with github.com/greenpau/caddy-security


FROM caddy:2.8.4-alpine@sha256:896c6fb9e3eae11890f53dc528b8a9be1b4d058f6b7603024feb084fc203c0b4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
