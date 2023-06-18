# https://github.com/bitnami/containers/blob/main/bitnami/redis-sentinel/7.0/debian-11/Dockerfile
FROM bitnami/redis-sentinel:7.0.11-debian-11-r20

ARG VERSION

COPY --chown=1001:1001 ./tmp/redis-${VERSION}/src/redis-sentinel /opt/bitnami/redis/bin/
