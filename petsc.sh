#!/usr/bin/bash
set -xe

mkdir /tmp/build
cd /tmp/build
wget http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.tar.gz
tar xzf petsc-lite-3.6.tar.gz
ls | grep petsc | cd
./configure PETSC_DIR=/opt/petsc-3.6 PETSC_ARCH=dorcker-gnu-opt --with-blas-lapack-dir=/opt/OpenBLAS/lib --with-debugging=0 COPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' CXXOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' FOPTFLAGS='-O3 -march=core-avx2 -mtune=core-avx2' --download-mpich
make PETSC_DIR=/opt/petsc-3.6 PETSC_ARCH=dorcker-gnu-opt

# Clean
cd /
rm -rf /tmp/*
