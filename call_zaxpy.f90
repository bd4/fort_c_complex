module test_fake_blas
    use gpublas_interface
    implicit none

  contains
    subroutine test_gpublas_zaxpy()
      complex, dimension(:), pointer :: dx, dy
      complex :: a
      complex, dimension(10) :: x, y, res
      integer(C_INT) :: incx, incy
      integer :: i

      incx = 1; incy = 1
      a = (2, 0)

      do i = 1,10
        x(i) = cmplx(i, 0)
        y(i) = cmplx(0, i)
      end do

      res = a * x + y

      call gpublas_zaxpy(size(x), a, x, incx, y, incy)

      print *, res
      print *, y
    end subroutine test_gpublas_zaxpy
end module test_fake_blas

program main
  use test_fake_blas
  implicit none

  call test_gpublas_zaxpy()
end program main
