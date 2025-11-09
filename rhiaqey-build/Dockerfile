Focker.io/bitnami/minideb:bookwormROM rust:1.91.0-slim-trixie

RUN apt-get update \
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

CMD ["/bin/bash"]
