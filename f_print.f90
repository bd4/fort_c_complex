program f_print
    use c_print_interface
    implicit none

    integer, parameter :: one = 1
    complex, parameter :: complex_one = (1, 0), complex_i = (0, 1)
    complex :: complex_stack
   
    complex_stack = (1, 1)

    call print_int(one)
    call print_complex(complex_one)
    call print_complex(complex_stack)

    call print_complex_2(-1, 11, complex_one, complex_i)

    call print_fortran_constant()

    call print_complex_add_i(11, -1, complex_stack)
end program f_print
