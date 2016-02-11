FROM canesin/slepc-stable:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

## Install libmesh from git master
ADD libmesh.sh /libmesh.sh
ADD https://github.com/libMesh/libmesh/archive/master.zip /tmp/master.zip
RUN bash /libmesh.sh && rm /libmesh.sh
