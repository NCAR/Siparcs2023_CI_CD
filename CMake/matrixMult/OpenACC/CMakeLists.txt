cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_COMPILER nvc++)

project(matrix_mult LANGUAGES CXX)

#set_target_properties(particles
#                       PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
# Set the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set CXX flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -O3 -Wall -acc -gpu=cc60,cc70,managed -Minfo=all -I${NVHPC_ROOT_PATH}/include")

file(GLOB SOURCES *.cpp *.cc)

add_executable(matrix_mult ${SOURCES})
