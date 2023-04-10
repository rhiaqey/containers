# https://github.com/bitnami/containers/blob/main/bitnami/redis/7.0/debian-11/Dockerfile
FROM bitnami/redis:7.0.10-debian-11-r5

ARG VERSION

COPY --chown=1001:1001 ./tmp/redis-${VERSION}/src/redis-server /opt/bitnami/redis/bin/
