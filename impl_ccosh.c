#include <complex.h>
#include <dlfcn.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define DLL_FILE_NAME "/usr/lib64/libimf.so"
void print_every_byte(void *vid, int len)
{
	uint8_t *p = (uint8_t *)vid;
	for (int i = len - 1; i >= 0; i--) { // 以下是逐byte打印
			uint8_t byte = p[i];
			printf("%02x ", byte);
	}
	printf("\n");
}

union doubleu {
	double f;
	uint64_t i;
};

// rip + 0x1c40cd
uint8_t ccosh_global[] = {
	0x00,   0x00,   0x00,   0x00,   0x00,   0x00,   0x10,   0x00,
	0x00,   0x00,   0x00,   0x00,   0x00,   0x00,   0xf0,   0x4f
};

double ccosh_const0 = *(double *)(ccosh_global + 2); // 134217729
double ccosh_const1 = *(double *)(ccosh_global); // ?
double ccosh_const2 = (double)0x7FE0000000000000;

static inline void ccosh_path1(double x, double y, double *res_x, double *res_y) {
	int y_nan_infinite = ((*(uint64 *)&y) >> 52U) == 0x7ff;   
	double t1, t2;
	t1 = ccosh_const2 * ccosh_const2;	
	t2 = cos(y) * t1;
	t1 *= x;
	if (y_nan_infinite) {
		t2 *= y;
	} else {
		t2 *= sin(y);	
	}
	*res_x = t1;
	*res_y = t2;
}

static void ccosh_path2(double x, double y, double *res_x, double *res_y) {
	// stack variable
	double cosh_res[2]; // off 0x0
	double sinh_res[2]; // off 0x10
	double sin_y, cos_y; // off 0x30, 0x38
	__libm_cosh_k64(x, cosh_res);
	t0 = t5 = cosh_res[0];
	t4 = cosh_res[1];
	t5 += t4;
	t3 = t5 * ccosh_const0;
	t1 = t0 - t5;
	t2 = t3;
	t4 = t1 - t4;
	t2 = t5 - t2;
	t3 = t2 - t3;
	t5 = t3 - t5;
	cosh_res[0] = t3;
	t5 = t4 - t5;
	cosh_res[1] = t5;

	if (x_exp >= 0x3370) {
		// 475
		__libm_sinh_k64(x, sinh_res);
		t5 = sinh_res[1];
		t0 = sinh_res[0];
		t4 = t5 + t0;
		t3 *= t4;
		t1 = t4;
		t1 = t0 - t1;
		t2 = t3;
		t0 = y;
		t2 = t4 - t2;
		t5 = t1 - t5;
		t3 = t2 - t3;
		sinh_res[0] = t3;
		t4 = t3 - t4;
		t5 += t4;
		sinh_res[1] = t5;
		__libm_sincos_k64(y, &sin_y, &cos_y);
		t0 = sin_y;
		t4 = cos_y;
		t3 = t0 + t4;
		t6 *= t3;
		t1 = t0 - t3;
		t2 = t6;
		t4 = t1 - t4;
		t2 = t3 - t2;
		t5 = ccosh_const1;
		t6 = t2 - t6;
		t3 = t6 - t3;
		t6 += t5;
		t4 += t3;
		sin_y = t4;
		cos_y = t6;
		if (y_exp < 0x3370) {
			// 701	
		} else {
			t5 = unknown1;
			t0 = unknown0;
			t4 = t5;
			t3 = ccosh_const0;
			t4 += t0;
			t3 *= t4;
			t1 =t4;
			t1 =t0-t1;
			t2 =t3;
			t5 = t1-t5;
			t2 = t4-t2;
			t3=t2-t3;
			unknown0 = t3;
			t4 = t3 - t4;
			t5 += t4;
			// movsd  QWORD PTR [rdx],xmm5
			// call __libm_mul_k64
			// call __libm_mul_k64
			return res_x + res_y * I;	
		}
	}
}

static void ccosh_path3(int cos, double x, double y, double *res_x, double *res_y) {
	// stack variable
	double cosh_res[2]; // off 0x0
	double sinh_res[2]; // off 0x10
	double sin_y, cos_y; // off 0x30, 0x38

}

static inline void ccosh_path4(double x, double y, double *res_x, double *res_y) {
	int y_nan_infinite = ((*(uint64 *)&y) >> 52U) == 0x7ff;   
	double t1, t2;
	t1 = cosh(x) * cos(y);
	if (y_nan_infinite) {
		t2 = sinh(x) * y;
	} else {
		t2 = sinh(x) * sin(y);
	}
	*res_x = t1;
	*res_y = t2;
}

static void ccosh_path5(double x, double y, double *res_x, double *res_y) {
	int x_nan_infinite = ((*(uint64 *)&x) >> 52U) == 0x7ff;   
	int con1 = ((x >> (32U)) & 0xfffff) != 0;
	int con2 = (x & 0xffffffff) != 0;

	double t1, t2;
	t1 = cosh(x);
	t2 = y;
	if (!x_nan_infinite || (x_nan_infinite && !con1 && !con2)) {
		uint8_t al, dl, cl;
		dl = t2 & 0xff; 
		al = t1 & 0xff;
		cl = dl;
		cl &= 0x7f;
		dl >>= 7;	
		al >>= 7;	
		dl ^= al;
		dl >>= 7;
		cl |= dl;
		t2 = (t2 & (0xffffffffffffff)) | cl;
	}
	*res_x = t1;
	*res_y = t2;
}

// in = x + iy
// cosh(x + yi) = cosh(x)cos(y) + isinh(x)sin(y)
double complex _ccosh(double complex in) 
{
	double res_x, res_y; // off 0x40, 0x48

	double x = creal(in); // off 0x50
	double y = cimag(in); // off 0x58
	union doubleu x_u;	
	x_u.f = x;
	union doubleu y_u;	
	y_u.f = y;
	uint64_t x_exp = (x_u.i >> 52U) & 0x7ff;   // exponent
	uint64_t y_exp = (y_u.i >> 52U) & 0x7ff;   

	int con0 = x_exp == 0x7ff;
	int con1 = x_exp == 0;
	int con2 = ((x >> (32U)) & 0xfffff) != 0;
	int con3 = (x & 0xffffffff) != 0;
	int con9 = x_exp < 0x40a;

	int con4 = y_exp == 0;
	int con5 = y_exp != 0;
	int con6 = y_exp == 0x7ff;
	int con7 = y_exp != 0x7ff;
	int con8 = (y & 0xffffffff) != 0;
	int con10 = ((y >> (32U)) & 0xfffff) != 0;

	if (!con0) {
		if (con1 && !con2 && !con3) {
			if (!con4) {
				if (!con7) {
					ccosh_path3(1, x, y, &res_x, &res_y);
				} else {
					ccosh_path4(x, y, &res_x, &res_y);
				}
			} else {
				if (!con10 && !con8) {
					ccosh_path5(x, y, &res_x, &res_y);
				} else {
					ccosh_path4(x, y, &res_x, &res_y);
				}
			}
		} else {
			if (!con6) {
				if (con4 && !con10 && !con8) {
					ccosh_path4(x, y, &res_x, &res_y);
				} else {
					if (con9) {
						ccosh_path1(x, y, &res_x, &res_y);
					} else {
						ccosh_path2(x, y, &res_x, &res_y);
					}
				}
			} else {
				ccosh_path3(1, x, y, &res_x, &res_y);
			}
		}
	} else {
		if (!con5) {
			if (!con10 && !con8) {
				ccosh_path5(x, y, &res_x, &res_y);
			} else {
				ccosh_path4(x, y, &res_x, &res_y);
			}
		} else {
			if (!con7) {
				ccosh_path3(0, x, y, &res_x, &res_y);
			} else {
				ccosh_path4(x, y, &res_x, &res_y);
			}
		}
	}
	return __builtin_complex(res_x, res_y);
}

int main() 
{
	void *handle = dlopen(DLL_FILE_NAME, RTLD_NOW);
	double complex (*ccosh)(double complex x);
	ccosh = dlsym(handle, "ccosh");

	double complex a = 5.1 + 6.1*I;
	double complex res = ccosh(a);
	double rreal = creal(res);
	double rimag = cimag(res);
	printf("%lf + %lfi\n", rreal, rimag);
	dlclose(handle);
	return 0;
}