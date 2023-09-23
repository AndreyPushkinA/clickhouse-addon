FROM ghcr.io/hassio-addons/debian-base/amd64:7.1.0

RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates dirmngr

RUN mkdir -p /root/.gnupg && chmod 700 /root/.gnupg

RUN apt-get install -y sudo

RUN GNUPGHOME=$(mktemp -d) && \
    gpg --batch --no-default-keyring --keyring /usr/share/keyrings/clickhouse-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 8919F6BD2B48D754 && \
    rm -r "$GNUPGHOME"
ы
RUN chmod +r /usr/share/keyrings/clickhouse-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg] https://packages.clickhouse.com/deb stable main" > /etc/apt/sources.list.d/clickhouse.list && \
    apt-get update && \
    apt-get install -y clickhouse-server clickhouse-client

RUN mkdir -p /etc/services.d/clickhouse
COPY clickhouse/clickhouse-run /etc/services.d/clickhouse/run

CMD ["/init"]
