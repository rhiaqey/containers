ARG VERSION

FROM docker.io/bitnami/minideb:bookworm as builder

ARG VERSION

RUN apt-get update && \
    apt-get upgrade -y && \
    install_packages \
      ca-certificates \
      curl \
      libgomp1 \
      libssl1.1 \
      procps \
      git \
      make \
      gcc \
      build-essential \
      pkg-config \
      apt-utils \
      tcl

WORKDIR /tmp

RUN git clone --depth 1 --branch ${VERSION} https://github.com/redis/redis.git /tmp/redis-${VERSION} && \
    cd /tmp/redis-${VERSION} && \
    make MALLOC=jemalloc

FROM bitnami/redis-sentinel:${VERSION}

ARG VERSION

COPY --from=builder --chown=1000:1000 /tmp/redis-${VERSION}/src/redis-sentinel /opt/bitnami/redis/bin/
