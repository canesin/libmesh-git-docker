#!/usr/bin/bash
set -xe

cd /tmp/build
# Build LibMesh from git master
export PETSC_DIR=/opt/petsc-3.6
git clone --branch=master git://github.com/libMesh/libmesh.git
cd libmesh
./configure --prefix=/opt/libmesh --enable-everything --with-methods="opt dbg devel"
make
make install

# Clean
cd /
rm -rf /tmp/*
