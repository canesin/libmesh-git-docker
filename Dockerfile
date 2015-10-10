FROM ubuntu:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# Update image and install required packages
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y \
    build-essential \
    gfortran \
    git-core

# Install OpenBLAS from git master
ADD openblas.conf /etc/ld.so.conf.d/openblas.conf
ADD openblas.sh /openblas.sh
RUN bash /openblas.sh && rm /openblas.sh

# Install PETSc from latest stable
ADD petsc.sh /petsc.sh
ADD http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.6.tar.gz /tmp/build
RUN bash /petsc.sh && rm /petsc.sh

## Install libmesh from git master
ADD libmesh.sh /libmesh.sh
RUN bash /libmesh.sh && rm /libmesh.sh

# Finalize by cleaning
RUN apt-get autoremove -y
RUN apt-get clean -y
