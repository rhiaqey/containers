ARG REDIS_VERSION

FROM docker.io/bitnami/minideb:bullseye as builder

ARG REDIS_VERSION

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

RUN git clone --depth 1 --branch ${REDIS_VERSION} https://github.com/redis/redis.git /tmp/redis-${REDIS_VERSION}

RUN cd /tmp/redis-${REDIS_VERSION} && \
    make MALLOC=jemalloc

FROM bitnami/redis:${REDIS_VERSION}

ARG REDIS_VERSION

COPY --from=builder --chown=1001:1001 /tmp/redis-${REDIS_VERSION}/src/redis-server /opt/bitnami/redis/bin/
