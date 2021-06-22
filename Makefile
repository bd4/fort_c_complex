.PHONY: all
all: f_print

FC=gfortran-8
CC=g++
CPP=g++

FFLAGS=-O2
CFLAGS=-O2 -std=c++14
CPPFLAGS=$(CFLAGS)

f_print: f_print.f90 c_print.o c_print_interface.o cpp_complex_add.o
	$(FC) $(FFLAGS) $^ -o $@


c_print_interface.o: c_print_interface.f90 c_print.o
	$(FC) $(FFLAGS) -c $< -o $@

c_print.o: c_print.c cpp_complex_add.o

cpp_complex_add.o: cpp_complex_add.cxx
	$(CPP) $(CPPFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf *.o *.mod f_print
