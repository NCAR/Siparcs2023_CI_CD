#!/bin/bash

# Load the necessary modules (software)
module purge
module load ncarenv/1.3
module load nvhpc/22.5
module load cuda/11.7
module list

# Export variables for use in the Makefile
export CUDA_ROOT_PATH="${NCAR_ROOT_CUDA}"
export NVHPC_ROOT_PATH="${NCAR_ROOT_NVHPC}/Linux_x86_64/22.5/compilers"
# Remove any previous build attempts
make clean
# Do a build
# Set _OPENACC=true to enable Openacc, otherwise set as false
make _OPENACC=true  
