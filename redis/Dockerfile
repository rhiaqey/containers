FROM docker.io/bitnami/minideb:bullseye as builder

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

RUN git clone --depth 1 --branch 7.2.1 https://github.com/redis/redis.git /tmp/redis-7.2.1

RUN cd /tmp/redis-7.2.1 && \
    make MALLOC=jemalloc

FROM bitnami/redis:7.2.1-debian-11-r26

COPY --from=builder --chown=1001:1001 /tmp/redis-7.2.1/src/redis-server /opt/bitnami/redis/bin/
