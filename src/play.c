#include <complex.h>
#include <dlfcn.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "common.h"

#define DLL_FILE_NAME "/usr/lib64/libimf.so"
double complex _ccosh(double complex in);

int main()
{
	void *handle = dlopen(DLL_FILE_NAME, RTLD_NOW);
	double complex (*ccosh)(double complex x);
	ccosh = dlsym(handle, "ccosh");

	uint64_t real = 0x80000f1c2a57e878;
	uint64_t imag = 0x73b408df054cc2ef;
	// double complex a = __builtin_complex(UINT64_TO_DOUBLE(real), UINT64_TO_DOUBLE(imag));
	double complex a = __builtin_complex(1.0, 2.0);
	double complex res1 = ccosh(a);
	double complex res2 = _ccosh(a);

	double a0 = creal(res1);
	double a1 = cimag(res1);
	double a2 = creal(res2);
	double a3 = cimag(res2);

	uint64_t rreal =  DOUBLE_UINT64(a0);
	uint64_t rimag =  DOUBLE_UINT64(a1);
	uint64_t rreal2 = DOUBLE_UINT64(a2);
	uint64_t rimag2 = DOUBLE_UINT64(a3);

	printf("0x%lx + 0x%lxi\n", rreal, rimag);
	printf("0x%lx + 0x%lxi\n", rreal2, rimag2);
	return 0;
}