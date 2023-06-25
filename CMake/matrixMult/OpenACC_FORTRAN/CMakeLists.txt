cmake_minimum_required(VERSION 3.10)

project(matrix_mult)

set(CMAKE_Fortran_COMPILER nvfortran)

enable_language(Fortran)
file(GLOB SOURCES *.f90)

set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O3 -Wall -Mfree -acc -gpu=cc60,cc70,cc80,managed -Minfo=all -I${NVHPC_ROOT}/include")

add_executable(matrix_mult ${SOURCES})
