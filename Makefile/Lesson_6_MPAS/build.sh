#!/bin/bash

module load ncarenv/1.3 
module load nvhpc/22.5 


_OPENACC=false

make clean

make
