#compiler
MPICC=mpic++

#compiler flag
CFLAGS= -g -O3 -Wall -std=c++11

OBJECTS= common.o functions.o main.o
BINARY= MPIStencil

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(MPICC) -o $(BINARY) $(OBJECTS) $(CFLAGS)

%.o: %.cpp
	$(MPICC) -c $(CFLAGS) $<

clean: 
	rm *.o $(BINARY)
