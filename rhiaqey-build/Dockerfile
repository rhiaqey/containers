FROM --platform=$BUILDPLATFORM rust:1.77-slim-bookworm as builder

ARG TARGETPLATFORM

RUN echo Building $TARGETPLATFORM on $BUILDPLATFORM

RUN    apt-get update \
    && apt-get install -y \
        gcc-aarch64-linux-gnu \
        libc6-dev-arm64-cross \
        build-essential \
        pkg-config \
        libssl-dev \
        cmake \
        gcc \
        libc-bin \
        libc6-dev \
        protobuf-compiler \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates

ENTRYPOINT [ "/bin/bash", "-c", "echo I am on $(uname -m)" ]
