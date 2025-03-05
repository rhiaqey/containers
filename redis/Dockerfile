ARG VERSION

FROM docker.io/bitnami/minideb:bookworm AS builder

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

RUN git clone --depth 1 --branch ${VERSION} https://github.com/redis/redis.git /tmp/redis-${VERSION} && \
    cd /tmp/redis-${VERSION} && \
    make distclean && \
    make MALLOC=jemalloc && \
    make test

FROM bitnami/redis:${VERSION}

ARG VERSION
ARG USER=1000
ARG GROUP=1000

USER root

# Create the specified group and user, and add the user to the group
RUN groupadd -g $GROUP $GROUP \
    && useradd -u $USER -ms /bin/bash -g $GROUP $USER

RUN chown -R $USER:$GROUP /opt/bitnami/redis /bitnami/redis/data

USER $USER

COPY --from=builder --chown=$USER:$GROUP /tmp/redis-${VERSION}/src/redis-server /opt/bitnami/redis/bin/
