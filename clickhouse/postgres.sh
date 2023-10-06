#!/bin/bash

# Wait for ClickHouse server to start. Adjust the sleep time as needed.
sleep 10

# Run ClickHouse client commands
clickhouse-client
clickhouse client --query="CREATE DATABASE home ENGINE = MaterializedPostgreSQL('192.168.100.237:5432', 'homeassistant', '', '') SETTINGS materialized_postgresql_tables_list = 'table1';"
