FROM yandex/clickhouse-server:latest

COPY ports.xml /etc/clickhouse-server/config.d/

COPY postgres.sh /docker-entrypoint-initdb.d/startup_script.sh

RUN chmod +x /docker-entrypoint-initdb.d/startup_script.sh

ENTRYPOINT ["/docker-entrypoint-initdb.d/startup_script.sh"]

EXPOSE 8124 9001
