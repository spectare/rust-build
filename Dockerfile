FROM cimg/rust:1.56

RUN sudo apt-get update && \
    sudo apt-get install -y curl file gcc g++ git make openssh-client \
    autoconf automake cmake libtool libcurl4-openssl-dev libssl-dev \
    libelf-dev libdw-dev binutils-dev zlib1g-dev libiberty-dev wget \
    xz-utils pkg-config python

ENV RUSTFLAGS "-C link-dead-code"
