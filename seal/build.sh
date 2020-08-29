#!/bin/bash

# Regular cmake build
mkdir build
cd build
cmake -D BUILD_TESTING=OFF -D SEAL_USE_ZLIB=OFF -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_LIBDIR=lib -D CMAKE_INSTALL_PREFIX=$PREFIX ..
make -j${CPU_COUNT}
make install
