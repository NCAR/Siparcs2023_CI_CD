# Compilers and linkers
F90=nvfortran

# Compiler flags
FFLAGS= -O3 -Wall -Mfree 

# .f90 files
FILES= mpas_atm_compute_vert_imp_coefs_work.F90
# object files needed to compile from f90 files
OBJECTS= mpas_atm_compute_vert_imp_coefs_work.o
# final binary file
BINARY=  mpas_atm_compute_vert_imp_coefs_work


#Since code includes OpenACC commands, we can also add openACC flags
ifeq ($(_OPENACC), true)
ACCFLAGS= -acc -gpu=cc60,cc70,managed -Minfo=all -I${NVHPC_ROOT_PATH}/include
else
ACCFLAGS= 
endif

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(F90) -o $(BINARY) $(OBJECTS) $(ACCFLAGS)

$(OBJECTS): $(FILES)
	$(F90) -c $(FFLAGS) $(ACCFLAGS) $<

clean: 
	rm *.o $(BINARY)

