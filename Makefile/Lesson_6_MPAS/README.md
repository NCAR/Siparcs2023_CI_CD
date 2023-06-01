Things to do:
1. ./build.sh
	1.1. module load ncarenv/1.3 
	1.2. module load nvhpc/22.5
2. make
	2.1. Build is conditional, checks if _OPENACC is true, then sets the OpenACC flags if the veriable was true. 
	2.2. First creates object file by compiling the .f90 fortran file. 
	2.3. Then creates the final binary file  
