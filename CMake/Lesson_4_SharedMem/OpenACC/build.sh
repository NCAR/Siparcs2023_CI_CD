#!/bin/bash
# Load the necessary modules (software)
module purge
module load ncarenv/1.3
module load nvhpc/22.5
module list

# Export variables for use in the Makefile
export NVHPC_ROOT_PATH="${NCAR_ROOT_NVHPC}/Linux_x86_64/22.5/compilers"

# Remove any previous build attempts
make clean
# Do a build
# Set OPENACC=true to enable OpenACC, otherwise set as false
make OPENACC=true
