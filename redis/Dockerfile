ARG TAG

ARG VERSION

FROM bitnami/redis:${TAG}

USER root

RUN mkdir -p /var/lib/apt/lists/partial && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install vim -y

USER 1001

COPY --chown=1001:1001 tmp/redis-${VERSION}/src/redis-server    /opt/bitnami/redis/bin/
COPY --chown=1001:1001 tmp/redis-${VERSION}/src/redis-sentinel  /opt/bitnami/redis/bin/
