ARG VERSION

FROM docker.io/bitnami/minideb:bullseye as builder

ARG VERSION

RUN apt-get update && \
    apt-get upgrade -y

RUN install_packages \
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

RUN git clone --depth 1 --branch ${VERSION} https://github.com/redis/redis.git /tmp/redis-${VERSION}

RUN cd /tmp/redis-${VERSION} && \
    make MALLOC=jemalloc

FROM bitnami/redis-sentinel:${VERSION}

ARG VERSION

COPY --from=builder --chown=1001:1001 /tmp/redis-${VERSION}/src/redis-sentinel /opt/bitnami/redis/bin/
