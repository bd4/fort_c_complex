module test_fake_blas
    use gpublas_interface
    implicit none

  contains
    subroutine test_gpublas_zaxpy()
      complex, dimension(:), pointer :: x, y
      complex :: a
      integer(C_INT) :: n
      type(C_PTR) :: cptr_x, cptr_y

      n = 10

      cptr_x = malloc(n*c_sizeof(C_DOUBLE_COMPLEX))
      call c_f_pointer(cptr_x, x, [n])
      cptr_y = malloc(n*c_sizeof(C_DOUBLE_COMPLEX))
      call c_f_pointer(cptr_y, y, [n])

      a = cmplx(2, 0)

      call gpublas_zaxpy(size(x), a, x, 1, y, 1)
    end subroutine test_gpublas_zaxpy
end module test_fake_blas

program main
  use test_fake_blas
  implicit none

  call test_gpublas_zaxpy()
end program main
