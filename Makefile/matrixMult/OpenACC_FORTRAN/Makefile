F90=nvfortran

FFLAGS= -O3 -Wall -Mfree

BINARY= matrix_mult
OBJECTS= matrix_mult.o
FFILES= matrix_mult.f90

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(F90) -o $(BINARY) $(OBJECTS)

$(OBJECTS): $(FFILES)
	$(F90) -c $(FFLAGS) $<

clean: 
	rm *.o $(BINARY)
