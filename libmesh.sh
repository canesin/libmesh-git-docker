#!/usr/bin/bash
set -xe
cd /tmp
unzip master.zip
rm master.zip
cd `ls | grep libmesh`

export PETSC_DIR=/opt/petsc
export SLEPC_DIR=/opt/slepc

./configure --with-methods="opt oprof dbg" \
            --prefix=/opt/libmesh \
            --enable-silent-rules \
            --enable-unique-id \
            --disable-warnings \
            --enable-unique-ptr \
            --enable-openmp \
            --disable-timestamps
             
make
make install
echo "export LIBMESH_DIR=/opt/libmesh" >> $HOME/.bash_profile
cd /
rm -rf /tmp/*
