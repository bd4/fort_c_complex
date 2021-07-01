
#ifdef USE_THRUST_COMPLEX

#include <thrust/complex.h>

template <typename T>
using complex_t = thrust::complex<T>;

#else

#include <complex>

template <typename T>
using complex_t = std::complex<T>;

#endif

extern "C" void gpublas_zaxpy(int n, const complex_t<double>* a,
                             const complex_t<double>* x, int incx,
                             complex_t<double>* y, int incy);
