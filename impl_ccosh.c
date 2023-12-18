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

void path1() {

}

void path2() {

}

void path3(int cos) {

}

void path4() {

}

void path5() {

}

// in = x + yi
// cosh(x+yi) = cosh(x)cos(y)+isinh(x)sin(y)
double complex _ccosh(double complex in) 
{
	double t0,t1,t2,t3,t4,t5,t6; // tmp

	// stack variable
	double cosh_res[2]; // off 0x0
	double sinh_res[2]; // off 0x10
	double unknown0, unknown1; // off 0x20, 0x28
	double sin_y, cos_y; // off 0x30, 0x38
	double res_x, res_y; // off 0x40, 0x48
	double x = creal(in); // off 0x50
	double y = cimag(in); // off 0x58

	union doubleu x_u;	
	x_u.f = x;
	union doubleu y_u;	
	y_u.f = y;

	uint64_t x_exp = (x_u.i >> 52U) & 0x7ff;   // exponent
	uint64_t x_frac = x_u.i & 0xfffffffffffff;   // significand
	uint64_t y_exp = (y_u.i >> 52U) & 0x7ff;   
	uint64_t y_frac = y_u.i & 0xfffffffffffff;   

	int con0 = x_exp == 0x7ff;
	int con1 = x_exp == 0;
	int con2 = ((x >> (32U)) & 0xfffff) != 0;
	int con3 = (x & 0xffffffff) != 0;
	int con4 = y_exp == 0;
	int con5 = y_exp != 0;
	int con6 = y_exp < 0x7ff;
	int con7 = y_exp == 0x7ff;
	int con8 = (y & 0xffffffff) != 0;
	int con9 = x_exp < 0x40a;
	int con10 = ((y >> (32U)) & 0xfffff) != 0;
	// 1 0 0

	// 1 0 1

	// 1 1 0  con1 con2 !con3
	
	// 1 1 1

	if (!con0) {
		if ((!con1) || (con1 && con2) || (con1 && !con2 && con3)) {
			if (!con7) {
				if (!con4 || (con4 && con10) || (con4 && !con10 && con8)) {
					if (con9) {
						path1();
					} else {
						path2();
					}
				}
				if (con4 && !con10 && !con8) {
					path4();
				}
			} else {
				path3(1);
			}
		}

		if (con1 && !con2 && !con3) {
			if (!con4) {
				if (!con7) {
					path3(1);
				} else {
					path4();
				}
			} else {
				if (!con10 && !con8) {
					path5();
				} else {
					path4();
				}
			}
		}
	} else {
		if (!con5) {
			if (!con10 && !con8) {
				path5();
			} else {
				path4();
			}
		} else {
			if (!con7) {
				path3(0);
			} else {
				path4();
			}
		}
	}

	if (x_exp < 0x40a) { // 0x40a == 1034
		// jump to 304
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