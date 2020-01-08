FROM circleci/rust:1.40-buster

RUN sudo apt-get update && \
    sudo apt-get install -y curl file gcc g++ git make openssh-client \
    autoconf automake cmake libtool libcurl4-openssl-dev libssl-dev \
    libelf-dev libdw-dev binutils-dev zlib1g-dev libiberty-dev wget \
    xz-utils pkg-config python

ENV KCOV_VERSION 37
RUN wget https://github.com/SimonKagstrom/kcov/archive/v$KCOV_VERSION.tar.gz && \
    tar xzf v$KCOV_VERSION.tar.gz && \
    rm v$KCOV_VERSION.tar.gz && \
    cd kcov-$KCOV_VERSION && \
    mkdir build && cd build && \
    cmake .. && make && sudo make install && \
    cd ../.. && rm -rf kcov-$KCOV_VERSION

ENV RUSTFLAGS "-C link-dead-code"
