cmake_minimum_required(VERSION 3.10)
set(CMAKE_CUDA_COMPILER nvcc)
set(CMAKE_CXX_COMPILER nvc++)

project(matrix_mult LANGUAGES CXX CUDA)

#set_target_properties(particles
#                       PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set CUDA flags
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -g -O3 -I${NVHPC_ROOT_PATH}/include")

# Set CXX flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3 -Wall")

file(GLOB SOURCES *.cpp *.cu)

add_executable(matrix_mult ${SOURCES})
