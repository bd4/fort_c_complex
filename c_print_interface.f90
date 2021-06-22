module c_print_interface
    use, intrinsic :: iso_c_binding
    implicit none

  interface
    subroutine print_int(v) bind(c)
        import
        integer(C_INT) :: v
    end subroutine print_int

    subroutine print_complex(v) bind(c)
        import
        complex :: v
    end subroutine print_complex

    subroutine print_complex_2(a, b, v, v2) bind(c)
        import
        integer(C_INT), value :: a, b
        complex :: v, v2
    end subroutine print_complex_2

    subroutine print_complex_add_i(a, b, v) bind(c)
        import
        integer(C_INT), value :: a, b
        complex :: v
    end subroutine print_complex_add_i

  end interface

  contains
    subroutine print_fortran_constant()
        complex, parameter :: complex_11 = (1, 1), complex_22 = (2, 2)
        call print_complex_2(7, 11, complex_11, complex_22)
    end subroutine print_fortran_constant
end module c_print_interface
