#!/bin/bash

set -o errexit -o nounset -o xtrace

sudo apt-get install \
    g++ \
    automake \
    autoconf \
    autoconf-archive \
    libtool \
    libboost-all-dev \
    libevent-dev \
    libdouble-conversion-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    liblz4-dev \
    liblzma-dev \
    libsnappy-dev \
    make \
    zlib1g-dev \
    binutils-dev \
    libjemalloc-dev \
    libssl-dev \
    libunwind8-dev \
    libelf-dev \
    libdwarf-dev \
    libiberty-dev \
    pkg-config \


git clone https://github.com/facebook/folly
cd folly/folly
autoreconf -ivf
./configure
make
make check
sudo make install

