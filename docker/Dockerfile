# Start from the CUDA image
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

ENV CUDA /usr/local/cuda
ENV NVHPC_ROOT_PATH /opt/nvidia/hpc_sdk
ENV NVHPC_VERSION 23.5
ENV CUDA_VERSION 12.1
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA}/lib64
ENV NVCC /usr/local/cuda/bin/nvcc
ENV PATH=${PATH}:${CUDA}/bin
ENV NVHPC_INSTALL_DIR /opt/nvidia

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    cmake \
    automake \
    autoconf \
    && rm -rf /var/lib/apt/lists/*

# Download and install the HPC SDK
RUN curl https://developer.download.nvidia.com/hpc-sdk/ubuntu/DEB-GPG-KEY-NVIDIA-HPC-SDK | gpg --dearmor -o /usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg \
    && echo 'deb [signed-by=/usr/share/keyrings/nvidia-hpcsdk-archive-keyring.gpg] https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64 /' | tee /etc/apt/sources.list.d/nvhpc.list \
    && apt-get update -y \
    && apt-get install -y nvhpc-23-5

# Update environment variables for NVHPC
ENV PATH=${NVHPC_ROOT_PATH}/Linux_x86_64/${NVHPC_VERSION}/compilers/bin:$PATH
ENV MANPATH ${NVHPC_ROOT_PATH}/Linux_x86_64/${NVHPC_VERSION}/compilers/man:${MANPATH}
ENV LD_LIBRARY_PATH ${NVHPC_ROOT_PATH}/Linux_x86_64/${NVHPC_VERSION}/compilers/lib:${LD_LIBRARY_PATH}

# Check availability of compilers
RUN nvcc --version && \
    nvc++ --version && \
    nvc --version && \
    nvfortran --version

# Install OpenMPI

ARG OPENMPI_SHORT_VERSION=4.1
ARG OPENMPI_LONG_VERSION=4.1.5

RUN cd /usr/local/src && \
        wget -q --show-progress --progress=bar:force:noscroll \
        "http://www.open-mpi.org/software/ompi/v${OPENMPI_SHORT_VERSION}/downloads/openmpi-${OPENMPI_LONG_VERSION}.tar.gz" && \
        tar -xvf openmpi-${OPENMPI_LONG_VERSION}.tar.gz && \
        cd openmpi-${OPENMPI_LONG_VERSION} && \
	export   CFLAGS=" -m64 -tp=zen2 -fpic" && \
	export CXXFLAGS=" -m64 -tp=zen2 -fpic" && \
	export  FCFLAGS=" -m64 -tp=zen2 -fpic" && \
	export  CFLAGS+=" -Mnodalign -Mautoinline" && \
	export LDFLAGS+=" -ldl -latomic" && \
        ./configure --prefix=/usr/local \
                                --disable-silent-rules \
                                --enable-shared --disable-static \
                                --enable-mpi-fortran \
                                --enable-mpi-cxx --enable-mpi-cxx-seek \
                                --with-cuda=/usr/local/cuda \
                                --enable-mpi1-compatibility && \
        make -j install && \
        rm -Rf /usr/local/src/*
	
ENV CPATH=${CPATH}:/usr/local/include/openmpi

ENV MPICC	mpicc
ENV MPICXX	mpicxx
ENV MPIF77	mpif77
ENV MPIF90	mpif90
# Clear out the installation logs:
#RUN rm -rf /var/lib/apt/lists/*
# In case there's anything here:
#RUN rm -Rf /tmp/*

#RUN ldconfig
#WORKDIR /root
#:ENTRYPOINT ["/bin/bash","-l","-c"]

