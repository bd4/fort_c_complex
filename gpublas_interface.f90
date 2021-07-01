module gpublas_interface
  use, intrinsic :: iso_c_binding
  implicit none

  interface
    subroutine gpublas_zaxpy(n,a,x,incx,y,incy) bind(c, name="gpublas_zaxpy")
      import
      integer(C_INT),intent(IN),value :: n,incx,incy
      complex(C_DOUBLE_COMPLEX), intent(IN) :: a
      complex(C_DOUBLE_COMPLEX), dimension(*),intent(IN) :: x
      complex(C_DOUBLE_COMPLEX), dimension(*),intent(INOUT) :: y
    end subroutine gpublas_zaxpy

    function malloc(nbytes) bind(c)
      import
      integer(C_SIZE_T) :: nbytes
      type(C_PTR) :: malloc
    end function malloc
  end interface
end module gpublas_interface
