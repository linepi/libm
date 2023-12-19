#ifndef __COMMON_H__
#define __COMMON_H__
#include <complex.h>
#include <math.h>
#include <stdint.h>
double carg(double complex z);
float cargf(float complex z);
long double cargl(long double complex z);
double complex conj(double complex x);
complex double cproj(complex double z);
complex float cprojf(complex float z);
long long llround(double x);
long long llroundf(float x);
long long llroundl(long double x);
double creal(double complex z);
float crealf(float complex z);
double cimag(double complex z);
float cimagf(float complex z);
long long int llrintf(float x);

union doublecomplexu {
    double complex z;
    double f[2];
    uint64_t i[2];
};

union floatu {
    float f;
    uint32_t i;
};

union doubleu {
    double f;
    uint64_t i;
};

union longdoubleu {
    long double f;
    uint64_t i[2];
};

#endif