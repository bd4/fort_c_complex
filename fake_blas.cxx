#include <cstdio>

#include <complex>

static void* g_handle = nullptr;

typedef struct {
    double x;
    double y;
} rocblas_double_complex;

__attribute__((noinline)) void roc_zaxpy(rocblas_double_complex* a)
{
  printf("pa %p\n", a);
}

extern "C" void gtblas_zaxpy(void* h, int n, std::complex<double> a,
                  const std::complex<double>* x, int incx,
                  std::complex<double>* y, int incy)
{
  roc_zaxpy(reinterpret_cast<rocblas_double_complex*>(&a));
}

extern "C" void gpublas_zaxpy(int n, const std::complex<double>* a,
                             const std::complex<double>* x, int incx,
                             std::complex<double>* y, int incy)
{
  gtblas_zaxpy(g_handle, n, *a, x, incx, y, incy);
}
