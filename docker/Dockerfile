# Using NVIDIA CUDA image as base
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

# set the default shell to bash
SHELL ["/bin/bash", "-c"]

ARG DOCKERFILE=Dockerfile


# Set environment variables for CUDA
ENV CUDA /usr/local/cuda
ENV NVCC /usr/local/cuda/bin/nvcc
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA}/lib64
ENV LD_RUN_PATH=${LD_RUN_PATH}:${CUDA}/lib64
ENV PATH=${PATH}:${CUDA}/bin

# Set environment variables for NVHPC
ENV NVHPC_INSTALL_DIR /opt/nvidia
ENV NVHPC_VERSION 23.5
ENV CUDA_VERSION 12.1
ENV NVHPC_PACKAGE nvhpc_2023_235_Linux_x86_64_cuda_${CUDA_VERSION}
ENV NVHPC_ROOT_PATH ${NVHPC_INSTALL_DIR}/nvhpc


RUN apt-get update && apt-get install -y --no-install-recommends \
		libgomp1 \
		libmemkind-dev && \
	rm -Rf /var/lib/apt/lists/*
    
# Update and install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config \
	git \
    build-essential \
    wget \
    cmake \
    make \
	automake \
    autoconf \
    gfortran \
	autotools-dev \
    
   # libopenmpi-dev \
    && rm -rf /var/lib/apt/lists/*

# Download NVHPC package
#RUN mkdir -p ${NVHPC_INSTALL_DIR} && \
#    wget -q --show-progress --progress=bar:force:noscroll \
#    https://developer.download.nvidia.com/hpc-sdk/${NVHPC_VERSION}/${NVHPC_PACKAGE}.tar.gz \
#    -O ${NVHPC_INSTALL_DIR}/${NVHPC_PACKAGE}.tar.gz && \
#    ls -lh ${NVHPC_INSTALL_DIR}

# Install NVHPC
#RUN tar -xvf ${NVHPC_INSTALL_DIR}/${NVHPC_PACKAGE}.tar.gz -C ${NVHPC_INSTALL_DIR} 

#RUN ls -lh /opt/nvidia

#RUN cd ${NVHPC_INSTALL_DIR}/${NVHPC_PACKAGE} && \
#    ls -lh && \
#    ./install 
   # rm -rf ${NVHPC_INSTALL_DIR}/${NVHPC_PACKAGE}


# Update environment variables for NVHPC
ENV PATH ${NVHPC_ROOT_PATH}/Linux_x86_64/23.5/compilers/bin:${PATH}
ENV MANPATH ${NVHPC_ROOT_PATH}/Linux_x86_64/23.5/compilers/man:${MANPATH}
ENV LD_LIBRARY_PATH ${NVHPC_ROOT_PATH}/Linux_x86_64/23.5/compilers/lib:${LD_LIBRARY_PATH}

ARG OPENMPI_SHORT_VERSION=4.1
ARG OPENMPI_LONG_VERSION=4.1.5

RUN cd /usr/local/src && \
	curl --retry 5 -fSsL "http://www.open-mpi.org/software/ompi/v${OPENMPI_SHORT_VERSION}/downloads/openmpi-${OPENMPI_LONG_VERSION}.tar.gz" | tar xz && \
	cd openmpi-* && \
	export   CFLAGS=" -m64 -tp=zen2 -fpic" && \
	export CXXFLAGS=" -m64 -tp=zen2 -fpic" && \
	export  FCFLAGS=" -m64 -tp=zen2 -fpic" && \
	export  CFLAGS+=" -Mnodalign -Mautoinline" && \
	export LDFLAGS+=" -ldl -latomic" && \
	./configure --prefix=/usr/local \
				--with-ucx=/usr/local \
				--with-ucx-libdir=/usr/local/lib \
				--disable-silent-rules \
				--enable-shared --disable-static \
				--enable-mpi-fortran \
				--enable-mpi-cxx --enable-mpi-cxx-seek \
				--with-cuda=/usr/local/cuda \
				--with-verbs=yes --enable-orterun-prefix-by-default \
				--with-hwloc=/usr/local \
				--with-slurm \
				--with-pmix=/usr/local \
				--with-zlib \
				--enable-mpi1-compatibility && \
	make -j install && \
	rm -Rf /usr/local/src/*

ENV CPATH=${CPATH}:/usr/local/include/openmpi

ENV MPICC	mpicc
ENV MPICXX	mpicxx
ENV MPIF77	mpif77
ENV MPIF90	mpif90
# Clear out the installation logs:
RUN rm -rf /var/lib/apt/lists/*
# In case there's anything here:
RUN rm -Rf /tmp/*

RUN ldconfig
WORKDIR /root
ENTRYPOINT ["/bin/bash","-l","-c"]

