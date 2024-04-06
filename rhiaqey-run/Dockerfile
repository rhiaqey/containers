FROM --platform=$BUILDPLATFORM debian:bookworm-slim

ARG TARGETPLATFORM

RUN echo Building $TARGETPLATFORM on $BUILDPLATFORM

RUN    apt-get update \
    && apt-get install -y \
        ca-certificates \
        net-tools \
        libssl-dev \
        curl \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates







ENTRYPOINT [ "/bin/bash", "-c", "echo I am on $(uname -m)" ]
