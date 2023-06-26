#compiler
MPICC=mpic++

#compiler flag
CFLAGS= -g -O3 -Wall -std=c++11
ACCFLAGS= -acc -gpu=cc60,cc70,managed -Minfo=all -I${NCAR_ROOT_NVHPC}/include

OBJECTS= common.o main.o stencil.o
BINARY= MPIStencil

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(MPICC) -o $(BINARY) $(OBJECTS) $(CFLAGS) $(ACCFLAGS)

%.o: %.cpp
	$(MPICC) -c $(CFLAGS) $(ACCFLAGS) $<

%.o: %.cc Makefile
	$(MPICC) -c $(CFLAGS) $(ACCFLAGS) $<

clean: 
	rm *.o $(BINARY)
