#include <complex.h>
#include <dlfcn.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "common.h"

#define DLL_FILE_NAME "/usr/lib64/libimf.so"

uint64_t mod = 0x100000000000;
uint64_t get_random_number()
{
    int32_t high = rand();
    int32_t low = rand();                                  // rand生成的随机数为32位
    uint64_t random_number = ((uint64_t)high << 32) | low; // 所以这里需要左移拼凑出64位的随机数

    return random_number;
}

double complex _ccosh(double complex in);

int main() {
	void *handle = dlopen(DLL_FILE_NAME, RTLD_NOW);
	double complex (*ccosh)(double complex x);
	ccosh = dlsym(handle, "ccosh");

  srand(4869U); // 使用固定值作为种子
  uint32_t n = 0xfffff;
  uint64_t step = 0x100000000000;
  uint64_t data = 0x0;
	int fail_cnt = 0;
	int suc_cnt = 0;

  while (n--) {
    data += step;
    uint64_t temp_real = data + get_random_number() % mod;
    uint64_t temp_imag = get_random_number();

		for (int i = 0; i < 2; i++) {
			if (i == 1) {
				uint64_t t = temp_real;
				temp_real = temp_imag;
				temp_imag = t;
			}
			// 过滤掉nan值，这种情况应当在边界值测试而非常规测试
			if ((!isnan(*((double *)(&temp_real)))) && (!isnan(*((double *)(&temp_imag))))) {
				double xreal = *((double *)(&temp_real));
				double ximag = *((double *)(&temp_imag));
				double complex input = __builtin_complex(xreal, ximag);
				double complex result = ccosh(input);
				double complex result2 = _ccosh(input);

				double a = creal(result);
				double a1 = cimag(result);
				double a2 = creal(result2);
				double a3 = cimag(result2);

				uint64_t rreal =  DOUBLE_UINT64(a);
				uint64_t rimag =  DOUBLE_UINT64(a1);
				uint64_t rreal2 = DOUBLE_UINT64(a2);
				uint64_t rimag2 = DOUBLE_UINT64(a3);

				if (rreal != rreal2 || rimag != rimag2) {
					fail_cnt++;
					printf("for 0x%lx + 0x%lxi: \nccosh = 0x%lx + 0x%lxi != \n_ccosh = 0x%lx + 0x%lxi\n", 
						temp_real, temp_imag, rreal, rimag, rreal2, rimag2);
					goto end;
				} else {
					suc_cnt++;
				}
			}
		}
  }

	printf("one hundred: success %d, fail %d\n", suc_cnt, fail_cnt);

	#define MAX_NUM_COSH 7.1047586007390e+2
	#define STEP_NUM_COSH 1e-11
	double xreal = MAX_NUM_COSH;
	double ximag = 0;
	double dstep = STEP_NUM_COSH;
	double result_real = 0;
	while (!isinf(result_real)) {
		double complex input = __builtin_complex(xreal, ximag);
		double complex result = ccosh(input);
		double complex result2 = _ccosh(input);

		result_real = creal(result);
		double a1 = cimag(result);
		double a2 = creal(result2);
		double a3 = cimag(result2);

		uint64_t rreal =  DOUBLE_UINT64(result_real);
		uint64_t rimag =  DOUBLE_UINT64(a1);
		uint64_t rreal2 = DOUBLE_UINT64(a2);
		uint64_t rimag2 = DOUBLE_UINT64(a3);

		if (rreal != rreal2 || rimag != rimag2) {
			fail_cnt++;
			printf("for 0x%lx + 0x%lxi: \nccosh = 0x%lx + 0x%lxi != \n_ccosh = 0x%lx + 0x%lxi\n", 
				DOUBLE_UINT64(xreal), DOUBLE_UINT64(ximag), rreal, rimag, rreal2, rimag2);
			goto end;
		} else {
			suc_cnt++;
		}
		xreal += dstep;
	}

end:
	printf("success %d, fail %d\n", suc_cnt, fail_cnt);
  dlclose(handle);
  return 0;
}