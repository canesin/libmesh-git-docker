#!/usr/bin/bash
set -xe

mkdir /tmp/build
cd /tmp/build
# Build OpenBLAS from git master
git clone --branch=master git://github.com/xianyi/OpenBLAS.git
(cd OpenBLAS \
    && make DYNAMIC_ARCH=1 NO_AFFINITY=1 NUM_THREADS=64 \
    && make install)

# Libraries in /opt/OpenBLAS/lib
ldconfig

cd /
rm -rf /tmp/build
