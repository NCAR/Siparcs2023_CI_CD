#Compiler
F90=nvfortran

#Compiler flags
FFLAGS= -O3 -Wall -Mfree
ACCFLAGS= -acc -gpu=cc60,cc70,cc80,managed -Minfo=all -I${NVHPC_ROOT}/include

# final executable file
BINARY= matrix_mult
# name of object files
OBJECTS= matrix_mult.o
# name of the code files we 
FFILES= matrix_mult.f90

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(F90) -o $(BINARY) $(OBJECTS) $(FFLAGS) $(ACCFLAGS) 

$(OBJECTS): $(FFILES)
	$(F90) -c $(FFLAGS) $(ACCFLAGS) $<

clean: 
	rm *.o $(BINARY)
