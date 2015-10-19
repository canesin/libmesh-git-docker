#!/usr/bin/bash
set -xe
cd /tmp

# Build LibMesh
unzip -q master.zip
rm master.zip
cd `ls | grep libmesh`

export PETSC_DIR=/opt/petsc
export SLEPC_DIR=/opt/slepc

./configure --with-methods="opt oprof dbg" \
            --prefix=/opt/libmesh \
            --enable-silent-rules \
            --enable-unique-ptr \
            --enable-unique-id \
            --enable-openmp \
            --disable-warnings \
            --disable-timestamps

make
make install
make installcheck

# Add LIBMESH_DIR to env variables
echo "export LIBMESH_DIR=/opt/libmesh" >> $HOME/.bashrc
source $HOME/.bashrc

# Clean files
cd /
rm -rf /tmp/*
