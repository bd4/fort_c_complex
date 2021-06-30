.PHONY: all
all: call_zaxpy f_print

FC=gfortran-9
#CPP=g++-9
CC=g++
CPP=hipcc

FFLAGS=-g -std=f2008 -fbounds-check -Wall -ffree-line-length-none -save-temps
CFLAGS=-g -std=gnu++14 -save-temps -fPIE
CPPFLAGS=$(CFLAGS)

call_zaxpy: call_zaxpy.f90 gpublas_interface.o fake_blas.o
	$(FC) $(FFLAGS) -fdefault-real-8 -fdefault-double-8 $^ -o $@

gpublas_interface.o: gpublas_interface.f90 fake_blas.o
	$(FC) $(FFLAGS) -c $< -o $@

fake_blas.o: fake_blas.cxx
	$(CPP) $(CPPFLAGS) -c $< -o $@

f_print: f_print.f90 c_print.o c_print_interface.o cpp_complex_add.o
	$(FC) $(FFLAGS) $^ -o $@

c_print_interface.o: c_print_interface.f90 c_print.o
	$(FC) $(FFLAGS) -c $< -o $@

c_print.o: c_print.c cpp_complex_add.o

cpp_complex_add.o: cpp_complex_add.cxx
	$(CPP) $(CPPFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -rf *.o *.mod f_print call_xaxpy
