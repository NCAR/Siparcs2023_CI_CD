#Compiler
CC=nvc++

#Compiler flags
CFLAGS= -g -O3 -Wall -std=c++11

ACCFLAGS= -acc -gpu=cc60,cc70,managed -Minfo=all -I${NVHPC_ROOT_PATH}/include

# final executable file
BINARY= matrix_mult
# name of object files
OBJECTS= main.o common.o functions.o matrix_mult.o
# name of the code files we 
CFILES= main.cpp common.cpp functions.cpp matrix_mult.cc

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $(BINARY) $(OBJECTS) $(ACCFLAGS) 

%.o: %.cpp 
	$(CC) -c $(CFLAGS) $(ACCFLAGS) $<

%.o: $.cc
	$(CC) -c $(CFLAGS) $(ACCFLAGS) $<

clean: 
	rm *.o $(BINARY)
