#Compiler
CC=nvc++
CUDACC=nvcc

#Compiler flags
CFLAGS= -g -O3 -Wall -std=c++11
CUDAFLAGS= -g -std=c++11 -O3 -I${NVHPC_ROOT_PATH}/include

# final executable file
BINARY= matrix_mult
# name of object files
OBJECTS= main.o common.o functions.o matrixMul.o
# name of the code files we 
#CFILES= main.cpp common.cpp functions.cpp matrixMul.cu
#CUDAFILES=
 
all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $(BINARY) $(OBJECTS) $(CUDAFLAGS) $(CFLAGS) 

%.o: %.cpp 
	$(CC) -c $(CFLAGS) $<

%.o: %.cu
	$(CUDACC) -c $(CUDAFLAGS) $<

clean: 
	rm *.o $(BINARY)
