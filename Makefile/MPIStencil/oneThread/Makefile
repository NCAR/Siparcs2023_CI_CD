#compiler
CC=nvc++

#compiler flag
CFLAGS= -g -O3 -Wall -std=c++11
ACCFLAGS= -acc -gpu=cc60,cc70,managed -Minfo=all -I${NCAR_ROOT_NVHPC}/include

OBJECTS= common.o functions.o main.o stencil.cc
BINARY= MPIStencil

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $(BINARY) $(OBJECTS) $(CFLAGS) $(ACCFLAGS)

%.o: %.cpp
	$(CC) -c $(CFLAGS) $(ACCFLAGS) $<

%.o: $.cc
	$(CC) -c $(CFLAGS) $(ACCFLAGS) $<

clean: 
	rm *.o $(BINARY)
