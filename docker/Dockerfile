# Start from the CUDA image
FROM nvcr.io/nvidia/nvhpc:23.5-devel-cuda12.1-ubuntu22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    cmake \
    automake \
    autoconf \
    && rm -rf /var/lib/apt/lists/*

