#include <complex.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include "macro.h"

uint32_t mod = 0x1000;

uint32_t get_random_number() { return rand() % mod; }
float complex _ccoshf(float complex in);

int main()
{
	void *handle = dlopen(DLL_FILE_NAME, RTLD_NOW);
	float complex (*ccoshf)(float complex x);
	ccoshf = dlsym(handle, "ccoshf");

    int seed = 456; // 使用固定种子值
    srand(seed);

    uint32_t n = 0xfffff;
    uint32_t step = 0x1000;
    uint32_t data = 0x0;
    uint32_t plus = 0xffff;
	int fail_cnt = 0;
	int suc_cnt = 0;
    while (n--) {
        data += step;
        uint32_t temp_real = data + get_random_number();
        uint64_t temp_imag = temp_real + plus;
		for (int i = 0; i < 2; i++) {
			if (i == 1) {
				uint32_t t = temp_real;
				temp_real = temp_imag;
				temp_imag = t;
			}
			float real = *((float *)(&temp_real));
			float imag = *((float *)(&temp_imag));
			float complex z = __builtin_complex(real, imag);
			float complex result = ccoshf(z);
			float complex result2 = _ccoshf(z);

			float a = creal(result);
			float a1 = cimag(result);
			float a2 = creal(result2);
			float a3 = cimag(result2);

			uint32_t rreal =  FLOAT_UINT32(a);
			uint32_t rimag =  FLOAT_UINT32(a1);
			uint32_t rreal2 = FLOAT_UINT32(a2);
			uint32_t rimag2 = FLOAT_UINT32(a3);

			if (rreal != rreal2 || rimag != rimag2) {
				fail_cnt++;
				// printf("for 0x%x + 0x%xi: \nccosh = 0x%x + 0x%xi != \n_ccosh = 0x%x + 0x%xi\n", 
				// 	temp_real, temp_imag, rreal, rimag, rreal2, rimag2);
				// break;
			} else {
				suc_cnt++;
			}
		}
    }
	printf("\033[32mccoshf one hundred test: success %d, fail %d\033[0m\n", suc_cnt, fail_cnt);
	dlclose(handle);
    return 0;
}
