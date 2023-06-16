cmake_minimum_required(VERSION 3.10)

project(matrix_mult)

set(CMAKE_Fortran_COMPILER nvfortran)

enable_language(Fortran)
file(GLOB SOURCES *.f90)
add_executable(matrix_mult ${SOURCES})
