# Using NVIDIA CUDA image as base
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

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
ENV NVHPC_PACKAGE nvhpc_2023_235_Linux_x86_64_cuda_${CUDA_VERSION}.tar.gz
ENV NVHPC_ROOT_PATH ${NVHPC_INSTALL_DIR}/nvhpc

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    cmake \
    libopenmpi-dev \
    && rm -rf /var/lib/apt/lists/*

# Download NVHPC package
RUN mkdir -p ${NVHPC_INSTALL_DIR} && \
    wget -q --show-progress --progress=bar:force:noscroll \
    https://developer.download.nvidia.com/hpc-sdk/${NVHPC_VERSION}/${NVHPC_PACKAGE} \
    -O ${NVHPC_INSTALL_DIR}/${NVHPC_PACKAGE} && \
    ls -lh ${NVHPC_INSTALL_DIR}

# Install NVHPC
RUN tar -xvf ${NVHPC_INSTALL_DIR}/${NVHPC_PACKAGE} -C ${NVHPC_INSTALL_DIR} && \
    cd ${NVHPC_INSTALL_DIR}/${NVHPC_VERSION} 
    
RUN ./install -s install_components=nvfortran,nvc++,nvcc \
    -d ${NVHPC_ROOT_PATH} && \
    rm -rf ${NVHPC_INSTALL_DIR}/${NVHPC_PACKAGE}

# Update environment variables for NVHPC
ENV PATH ${NVHPC_ROOT_PATH}/Linux_x86_64/23.5/compilers/bin:${PATH}
ENV MANPATH ${NVHPC_ROOT_PATH}/Linux_x86_64/23.5/compilers/man:${MANPATH}
ENV LD_LIBRARY_PATH ${NVHPC_ROOT_PATH}/Linux_x86_64/23.5/compilers/lib:${LD_LIBRARY_PATH}

