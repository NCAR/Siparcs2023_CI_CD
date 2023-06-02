cmake_minimum_required(VERSION 3.10)

project(MPIStensil)

find_package(MPI REQUIRED)

file(GLOB SOURCES *.cpp)

add_executable(MPIStensil ${SOURCES})

target_link_libraries(MPIStensil MPI::MPI_CXX)
