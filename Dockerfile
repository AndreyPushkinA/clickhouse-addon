ARG BUILD_FROM=ubuntu:focal-20221130
FROM ${BUILD_FROM}

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates dirmngr gpg gnupg expect && \
    mkdir -p /root/.gnupg && chmod 600 /root/.gnupg && \
    GNUPGHOME="/root/.gnupg" gpg --no-default-keyring --keyring /usr/share/keyrings/clickhouse-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8919F6BD2B48D754 && \
    chmod +r /usr/share/keyrings/clickhouse-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg] https://packages.clickhouse.com/deb stable main" | tee /etc/apt/sources.list.d/clickhouse.list && \
    apt-get update && apt-get clean && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y clickhouse-server clickhouse-client && \
    echo "clickhouse-common clickhouse-common/use_pcre16 boolean false" | debconf-set-selections && \
    echo "clickhouse-common clickhouse-common/use_pcre8 boolean true" | debconf-set-selections && \
    service clickhouse-server start
