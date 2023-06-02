#Compiler
F90=gfortran

#Compiler flags
FFLAGS= -O3 -Wall -free

# final executable file
BINARY= matrix_mult
# name of object files
OBJECTS= matrix_mult.o
# name of the code files we 
FFILES= matrix_mult.f90

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(F90) -o $(BINARY) $(OBJECTS) 

$(OBJECTS): $(FFILES)
	$(F90) -c $(FFLAGS) $<

clean: 
	rm *.o $(BINARY)
