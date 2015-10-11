#!/usr/bin/bash
set -xe
cd /tmp
unzip master.zip
rm master.zip
cd `ls | grep libmesh`
export PETSC_DIR=/opt/petsc

./configure --prefix=/opt/libmesh \
            --with-methods="opt dbg devel" \
            --with-metis=PETSc \
            --enable-unique-ptr \
            --enable-unique-id \
            --enable-tracefiles

make
make install
cd /
rm -rf /tmp/*
