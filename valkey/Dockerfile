ARG VERSION

FROM docker.io/bitnami/minideb:bookworm as builder

ARG VERSION

RUN apt-get update && \
    apt-get upgrade -y && \
    install_packages \
      ca-certificates \
      curl \
      libgomp1 \
      libssl-dev \
      procps \
      git \
      make \
      gcc \
      build-essential \
      pkg-config \
      apt-utils \
      tcl

WORKDIR /tmp

RUN git clone --depth 1 --branch ${VERSION} https://github.com/valkey-io/valkey.git /tmp/valkey-${VERSION} && \
    cd /tmp/valkey-${VERSION} && \
    make MALLOC=jemalloc
