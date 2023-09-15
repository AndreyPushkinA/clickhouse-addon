ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base/amd64:6.0.0
FROM ${BUILD_FROM}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        dirmngr \
        gnupg

RUN \
    GNUPGHOME=$(mktemp -d) \
    && GNUPGHOME="$GNUPGHOME" gpg --no-default-keyring --keyring /usr/share/keyrings/clickhouse-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8919F6BD2B48D754 \
    && rm -r "$GNUPGHOME" \
    && chmod +r /usr/share/keyrings/clickhouse-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg] https://packages.clickhouse.com/deb stable main" | tee /etc/apt/sources.list.d/clickhouse.list

RUN apt-get update

RUN apt-get install -y clickhouse-server clickhouse-client

CMD ["clickhouse-server"]
