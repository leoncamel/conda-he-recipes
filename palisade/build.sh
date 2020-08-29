#!/bin/bash

ls -l

# Download extra "cereal" package, and extract it into "third-party/cereal" path
wget https://github.com/USCiLab/cereal/archive/v1.3.0.tar.gz
tar -zxvf v1.3.0.tar.gz --strip-components=1 -C "$PWD/third-party/cereal"

# Regular cmake build
mkdir build
cd build
cmake -D BUILD_TESTING=OFF \
    -D BUILD_UNITTESTS=OFF \
    -D BUILD_BENCHMARKS=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D SEAL_USE_ZLIB=OFF \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D CMAKE_INSTALL_PREFIX=$PREFIX ..
make -j${CPU_COUNT}
make install
