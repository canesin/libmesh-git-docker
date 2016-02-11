#!/usr/bin/bash
set -xe
cd /tmp

# Build LibMesh
unzip -q master.zip
rm master.zip
cd `ls | grep libmesh`

export PETSC_DIR=/opt/petsc
export SLEPC_DIR=/opt/slepc

# Build version for opmitzed code, profile with gprof and full debug for dev
./configure --with-methods="opt pro dbg" \
            --prefix=/opt/libmesh \
            --enable-silent-rules \
            --enable-unique-ptr \
            --enable-unique-id \
            --disable-warnings \
            --disable-timestamps \
            --disable-fortran

make
make install
make installcheck METHODS=opt

# Add LIBMESH_DIR to env variables
echo "export LIBMESH_DIR=/opt/libmesh" >> $HOME/.bashrc
source $HOME/.bashrc

# Clean files
cd /
rm -rf /tmp/*
