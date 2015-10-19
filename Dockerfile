FROM canesin/slepc-stable:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

# Update image and install required packages
RUN yum -y update
RUN yum -y install \
    make \
    cmake \
    perl \
    unzip \
    oprofile \
    gcc \
    gcc-c++ \
    gcc-gfortran

## Install libmesh from git master
ADD libmesh.sh /libmesh.sh
ADD https://github.com/libMesh/libmesh/archive/master.zip /tmp/master.zip
RUN bash /libmesh.sh && rm /libmesh.sh

# Finalize by cleaning
# It does not free space directly but can do so if you want to minimize size by:
# docker export image | docker import -
RUN yum -y autoremove cmake
RUN yum -y clean all
