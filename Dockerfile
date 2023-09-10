ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
    wget \
    ca-certificates

RUN wget -qO - https://repository.clickhouse.com/stable/stable.key | apt-key add - \
    && echo "deb https://repository.clickhouse.com/stable/ main/" | tee /etc/apt/sources.list.d/clickhouse.list \
    && apt-get update \
    && apt-get install -y clickhouse-server clickhouse-client \
    && service clickhouse-server start

COPY rootfs /

WORKDIR /

EXPOSE 8123 9000

CMD ["clickhouse-server"]