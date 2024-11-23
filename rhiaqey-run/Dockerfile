FROM debian:12.8-slim

RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        net-tools \
        libssl-dev \
        curl \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates

CMD ["/bin/bash"]
