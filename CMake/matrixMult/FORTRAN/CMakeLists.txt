cmake_minimum_required(VERSION 3.10)

project(MatrixMult)

enable_language(Fortran)

file(GLOB SOURCES *.f90)

add_executable(MatrixMult ${SOURCES})
