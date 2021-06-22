#include "cpp_complex_add.h"

void complex_add_i(std::complex<float> *a) {
    auto i = std::complex<float>(0.0, 1.0);
    *a += i;
}
