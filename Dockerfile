FROM canesin/slepc-stable:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

# Update image and install required packages
RUN yum -y update
RUN yum -y install \
    make \
    cmake \
    perl \
    unzip \
    gcc \
    gcc-c++ \
    gcc-gfortran

## Install libmesh from git master
ADD libmesh.sh /libmesh.sh
ADD https://github.com/libMesh/libmesh/archive/master.zip /tmp/master.zip
RUN bash /libmesh.sh && rm /libmesh.sh

# Finalize by cleaning
RUN yum -y clean all
