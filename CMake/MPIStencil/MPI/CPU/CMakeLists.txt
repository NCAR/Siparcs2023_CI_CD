cmake_minimum_required(VERSION 3.10)

project(MPIStencil)

find_package(MPI REQUIRED)

file(GLOB SOURCES *.cpp)

add_executable(MPIStencil ${SOURCES})

target_link_libraries(MPIStencil MPI::MPI_CXX)
