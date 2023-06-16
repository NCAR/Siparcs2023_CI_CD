cmake_minimum_required(VERSION 3.10)

project(matrix_mult)

enable_language(Fortran)

set(CMAKE_Fortran_COMPILER nvfortran)
file(GLOB SOURCES *.f90)
add_executable(matrix_mult ${SOURCES})
