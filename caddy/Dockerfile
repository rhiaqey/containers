ARG VERSION

FROM --platform=$BUILDPLATFORM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/mholt/caddy-l4

FROM caddy:${VERSION}

ARG VERSION
ARG USER=1000
ARG GROUP=1000

ENV USER=$USER
ENV GROUP=$GROUP

# Create the specified group and user, and add the user to the group
RUN addgroup -g $GROUP $USER \
    && adduser -u $USER -D -G $USER $USER

USER $USER

COPY --from=builder --chown=$USER:$GROUP /usr/bin/caddy /usr/bin/caddy

# Set the default command to run Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
