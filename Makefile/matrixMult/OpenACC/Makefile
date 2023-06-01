#Compiler
CC=nvc++

#Compiler flags
CFLAGS= -g -O3 -Wall -std=c++11

#library paths
LDFLAGS= 

ACCFLAGS= -acc -gpu=cc60,cc70,managed -I${NVHPC_ROOT_PATH}/include 
# final executable file
BINARY= matrix_mult
# name of object files
OBJECTS= common.o main.o functions.o
# name of the code files we 
FFILES= common.cpp main.cpp functions.cpp 

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $(BINARY) $(OBJECTS) $(CFLAGS) $(ACCFLAGS)

%.o: %.c
	$(CC) -c $(CFLAGS) $(ACCFLAGS) $<

%.o: %.cc
	$(CC) -c $(CFLAGS) $(ACCFLAGS) $<
clean: 
	rm *.o $(BINARY)
