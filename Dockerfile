FROM canesin/slepc-stable:latest
MAINTAINER Fabio Cesar Canesin, fabio.canesin@gmail.com

## Install libmesh from git master
ADD https://github.com/libMesh/libmesh/archive/master.zip /tmp/master.zip
WORKDIR /tmp
# Build LibMesh
RUN unzip -q master.zip
WORKDIR /tmp/libmesh-master
# Set PETSc and SLEPc paths
ENV PETSC_DIR /opt/petsc
ENV SLEPC_DIR /opt/slepc
# Configure
RUN ./configure --with-methods="opt pro dbg" \
    	--prefix=/opt/libmesh \
        --with-metis=PETSc \
        --enable-tbb \
        --enable-ifem \
        --enable-cxx11 \
        --enable-silent-rules \
        --enable-unique-ptr \
        --enable-unique-id \
        --disable-warnings \
        --disable-timestamps \
        --disable-fortran \
        --disable-pthreads \
        --disable-openmp \
        --disable-maintainer-mode
# Buld and test
RUN make -j$(nproc)
RUN make install -j$(nproc)
RUN make installcheck -j$(nproc) METHODS=opt
# Add LIBMESH_DIR to env variables
ENV LIBMESH_DIR /opt/libmesh
ENV PATH $LIBMESH_DIR/bin:$PATH
# Clean
RUN rm -rf /tmp/*
WORKDIR /opt
