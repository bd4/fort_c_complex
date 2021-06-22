#include <stdio.h>

#include <complex>

#include "cpp_complex_add.h"

static int *g_handle = NULL;

void print_handle(int *handle) {
    printf("handle = %p, value = %d\n", handle, *handle);
}

extern "C"
void print_int(int *v) {
    if (g_handle == NULL) {
        g_handle = (int *)malloc(sizeof(*g_handle));
        *g_handle = 1;
    }
    print_handle(g_handle);
    printf("v is %d at %p\n", *v, v);
}

extern "C"
void print_complex(std::complex<float> *v) {
    if (g_handle == NULL) {
        g_handle = (int *)malloc(sizeof(*g_handle));
        *g_handle = 2;
    }
    print_handle(g_handle);
    printf("v is (%f, %f) at %p\n", v->real(), v->imag(), v);
}

extern "C"
void print_complex_2(int a, int b,
                     const std::complex<float> *v,
                     const std::complex<float> *v2) {
    if (g_handle == NULL) {
        g_handle = (int *)malloc(sizeof(*g_handle));
        *g_handle = 3;
    }
    print_handle(g_handle);
    printf("a is %d, b is %d\n", a, b);
    printf("v is (%f, %f) at %p\n", v->real(), v->imag(), v);
    printf("v2 is (%f, %f) at %p\n", v2->real(), v2->imag(), v2);
}

extern "C"
void print_complex_add_i(int a, int b, std::complex<float> *v) {
    if (g_handle == NULL) {
        g_handle = (int *)malloc(sizeof(*g_handle));
        *g_handle = 3;
    }
    print_handle(g_handle);
    printf("a is %d, b is %d\n", a, b);
    printf("v is (%f, %f) at %p\n", v->real(), v->imag(), v);
    complex_add_i(v);
    printf("v+i is (%f, %f) at %p\n", v->real(), v->imag(), v);
}
