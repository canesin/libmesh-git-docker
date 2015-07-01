#!/usr/bin/bash
set -xe

mkdir /tmp/build
cd /tmp/build
wget http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.tar.gz

# Clean
cd /
rm -rf /tmp/build
