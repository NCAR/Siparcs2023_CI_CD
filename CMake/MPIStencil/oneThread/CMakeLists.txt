cmake_minimum_required(VERSION 3.10)

project(MPIStencil)

find_package(MPI REQUIRED)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

file(GLOB SOURCES *.cpp *.cc)

# Set CMAKE_CXX_FLAGS
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3 -Wall")

# Set OpenACC flags
set(OpenACC_FLAGS "-acc -gpu=cc60,cc70,managed -Minfo=all")

# Combine CMAKE_CXX_FLAGS and OpenACC_FLAGS
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenACC_FLAGS}")

# Include NVHPC include directory
include_directories(${NCAR_ROOT_NVHPC}/include)

add_executable(MPIStencil ${SOURCES})

target_link_libraries(MPIStencil MPI::MPI_CXX)
