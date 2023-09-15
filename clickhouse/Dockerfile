ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for ClickHouse
RUN \
  apk add --no-cache \
    g++ \
    make \
    cmake \
    wget \
    curl \
    unixodbc \
    unixodbc-dev \
    libtool \
    libressl-dev \
    libcurl \
    libcurl-dev \
    libcap \
    libcap-dev \
    libtool \
    libtool-dev \
    tzdata \
    bash \
    boost-dev \
    rapidjson-dev \
    snappy-dev \
    zlib-dev \
    lz4-dev \
    brotli-dev \
    icu-dev \
    protobuf-dev \
    git

# Download ClickHouse source code
WORKDIR /tmp
RUN git clone --recursive https://github.com/ClickHouse/ClickHouse.git

# Build and install ClickHouse
WORKDIR /tmp/ClickHouse
RUN mkdir build
WORKDIR /tmp/ClickHouse/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make -j$(nproc)
RUN make install

# Clean up
WORKDIR /
RUN rm -rf /tmp/ClickHouse

CMD [ "clickhouse-server" ]
