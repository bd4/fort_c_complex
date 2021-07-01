#include <cstdio>

#include "fake_blas.h"

static int a = 0x12345;
static void *g_handle = &a;

typedef struct {
    double x;
    double y;
} rocblas_double_complex;

__attribute__((noinline)) void roc_zaxpy(rocblas_double_complex* a)
{
  printf("pa %p\n", a);
}

void gtblas_zaxpy(void *h, int n, complex_t<double> a,
                  const complex_t<double>* x, int incx,
                  complex_t<double>* y, int incy)
{
  printf("h %p\n", h);
  roc_zaxpy(reinterpret_cast<rocblas_double_complex*>(&a));
}

void gpublas_zaxpy(int n, const complex_t<double>* a,
                   const complex_t<double>* x, int incx,
                   complex_t<double>* y, int incy)
{
  //printf("pa from Fortran %p\n", a);
  gtblas_zaxpy(g_handle, n, *a, x, incx, y, incy);
}
