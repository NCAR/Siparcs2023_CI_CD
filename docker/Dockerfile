# Author: Haniye Kashgarani
# Affiliation: University of Wyoming
# ORCID: 0000-0001-6059-1920
# Date: 2023-07-24T19:51:32+00:00
# Github: haniyeka

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

#include path for libopen-rte.so.40 for openmpi
RUN export LD_LIBRARY_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/23.5/comm_libs/12.1/openmpi4/openmpi-4.1.5/lib/:$LD_LIBRARY_PATH

