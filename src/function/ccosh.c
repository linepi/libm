#include "macro.h"
#include <complex.h>
#include <dlfcn.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int __libm_cosh_k64(double input,double* result);
int __libm_sinh_k64(double input,double* result);
void  __libm_mul_k64(int a1, double* a2, double* a3, double* a4);

typedef void (*sincos_k64)(double in, double complex *sin, double complex *cos);
sincos_k64 _libm_sincos_k64 = NULL;

uint64_t ccosh_const0 = 0x41A0000002000000;
uint64_t ccosh_const1 = 0x4FF0000002000000;
uint64_t ccosh_const2 = 0x7FE0000000000000;
uint64_t ccosh_const3 = 0x1000000000000000;
uint64_t ccosh_const4 = 0x4FF0000000000000;

static inline void ccosh_path1(double complex in, double complex *res)
{
    double x = creal(in);
    double y = cimag(in);
    int y_nan_infinite = DOUBLE_EXP(y) == 0x7ff;
    double res_x, res_y;
    res_y = UINT64_TO_DOUBLE(ccosh_const2) * UINT64_TO_DOUBLE(ccosh_const2);
    res_x = cos(y) * res_y;
    res_y *= x;
    if (y_nan_infinite) {
        res_y *= y;
    } else {
        res_y *= sin(y);
    }
    *res = res_x + res_y * I;
}

static void ccosh_path2(double complex in, double complex *res)
{
    double x = creal(in);
    double y = cimag(in);
    double res_x, res_y;
    double t0, t1, t2, t3, t4, t5, t6;
    uint32_t x_exp = DOUBLE_EXP(x);
    uint32_t y_exp = DOUBLE_EXP(y);
    int ebp, ebx, cosh_ret;
    // stack variable
    double cosh_res[2];
    double sinh_res[2];
    double sincos_res[4];

    cosh_ret = __libm_cosh_k64(x, cosh_res);
    t0 = t5 = cosh_res[0];
    t4 = cosh_res[1];
    t5 += t4;
    t3 = t5 * UINT64_TO_DOUBLE(ccosh_const0);
    t1 = t5 - t0;
    t4 = t4 - t1;
    t2 = t3 - t5;
    t3 = t3 - t2;
    t5 = t5 - t3;
    cosh_res[0] = t3;
    t5 = t5 + t4;
    cosh_res[1] = t5;

    if (x_exp >= 0x337) {
        ebp = __libm_sinh_k64(x, sinh_res);
        t5 = sinh_res[1];
    } else {
        t0 = x * UINT64_TO_DOUBLE(ccosh_const4);
        uint32_t t0_exp = DOUBLE_EXP(t0);
        ebp = t0_exp;
        ebp += 0x0FFFFFB01;
        t0_exp &= 0x800;
        t0_exp += 0x3FF;
        uint64_t _t = COMBINE_EXP_FRAG(DOUBLE_SIGN(t0), t0_exp, DOUBLE_FRAG(t0));
        sinh_res[0] = UINT64_TO_DOUBLE(_t);
        t5 = 0;
    }

    t0 = sinh_res[0];
    t4 = t5 + t0;
    t3 = t4 * UINT64_TO_DOUBLE(ccosh_const0);
    t1 = t4 - t0;
    t2 = t3 - t4;
    t5 = t5 - t1;
    t3 = t3 - t2;
    sinh_res[0] = t3;
    t4 = t4 - t3;
    t5 += t4;
    sinh_res[1] = t5;
    _libm_sincos_k64(y, (double complex *)sincos_res,
                      (double complex *)(sincos_res + 2));
    t0 = sincos_res[2];
    t4 = sincos_res[3];
    t3 = t0 + t4;
    t6 = t3 * UINT64_TO_DOUBLE(ccosh_const0);
    t1 = t3 - t0;
    t4 = t4 - t1;
    t2 = t6 - t3;
    t5 = UINT64_TO_DOUBLE(ccosh_const3);
    t6 = t6 - t2;
    t3 = t3 - t6;
    t6 += t5;
    t4 += t3;
    sincos_res[3] = t4;
    sincos_res[2] = t6;

    if (y_exp < 0x337) {
        t0 = y * UINT64_TO_DOUBLE(ccosh_const4);
        uint32_t t0_exp = DOUBLE_EXP(t0);
        ebx = t0_exp;
        ebx += 0x0FFFFFB01;
        t0_exp &= 0x800;
        t0_exp += 0x3FF;
        uint64_t _t = COMBINE_EXP_FRAG(DOUBLE_SIGN(t0), t0_exp, DOUBLE_FRAG(t0));
        sincos_res[0] = UINT64_TO_DOUBLE(_t);
        t5 = 0;
    } else {
        ebx = 0;
        t5 = sincos_res[1];
    }

    t0 = sincos_res[0];
    t4 = t5;
    t3 = UINT64_TO_DOUBLE(ccosh_const0);
    t4 += t0;
    t3 *= t4;
    t1 = t4 - t0;
    t5 = t5 - t1;
    t2 = t3 - t4;
    t3 = t3 - t2;
    sincos_res[0] = t3;
    t4 = t4 - t3;
    t5 += t4;
    sincos_res[1] = t5;
    __libm_mul_k64(cosh_ret, cosh_res, sincos_res + 2, &res_x);
    __libm_mul_k64(ebp + ebx, sinh_res, sincos_res, &res_y);
    *res = res_x + res_y * I;
}

static void ccosh_path3(int iscos, double complex in, double complex *res)
{
    double x = creal(in);
    double y = cimag(in);
    int x_nan_infinite = DOUBLE_EXP(x) == 0x7ff;
    int con1 = DOUBLE_32to51(x) != 0;
    int con2 = DOUBLE_LOW32(x) != 0;
    int con3 = DOUBLE_32to51(y) != 0;
    int con4 = DOUBLE_LOW32(y) != 0;
    double t1, t2;
    if (iscos) {
        t1 = cos(y);
    } else {
        t1 = cosh(x);
    }

    if (x_nan_infinite && !con1 && !con2) {
        if (!con3 && !con4) {
            uint8_t al, dl;
            dl = DOUBLE_UINT64(x) & 0xff;
            al = DOUBLE_UINT64(y) & 0xff;
            dl &= 0x80;
            al &= 0x80;
            dl >>= 7;
            al >>= 7;
            dl ^= al;

            double t0 = 0.0;
            if (dl == 0) {
                t2 *= t0 * 1.0;
            } else {
                t2 *= t0 * -1.0;
            }
        } else {
            t2 = 0;
        }
    } else {
        t2 = sin(y);
    }
    *res = t1 + t2 * I;
}

static inline void ccosh_path4(double complex in, double complex *res)
{
    double x = creal(in);
    double y = cimag(in);
    int y_nan_infinite = DOUBLE_EXP(y) == 0x7ff;
    double t1, t2;
    t1 = cosh(x) * cos(y);
    if (y_nan_infinite) {
        t2 = sinh(x) * y;
    } else {
        t2 = sinh(x) * sin(y);
    }
    *res = t1 + t2 * I;
}

static void ccosh_path5(double complex in, double complex *res)
{
    double x = creal(in);
    double y = cimag(in);
    int x_nan_infinite = DOUBLE_EXP(x) == 0x7ff;
    int con1 = DOUBLE_32to51(x) != 0;
    int con2 = DOUBLE_LOW32(x) != 0;

    double t1, t2;
    t1 = cosh(x);
    t2 = y;
    if (!x_nan_infinite || (x_nan_infinite && !con1 && !con2)) {
        uint8_t al, dl, cl;
        dl = DOUBLE_UINT64(t2) & 0xff;
        al = DOUBLE_UINT64(t1) & 0xff;
        cl = dl;
        cl &= 0x7f;
        dl >>= 7;
        al >>= 7;
        dl ^= al;
        dl >>= 7;
        cl |= dl;
        t2 = (DOUBLE_UINT64(t2) & (0xffffffffffffff)) | cl;
    }
    *res = t1 + t2 * I;
}

int init = 0;
// in = x + iy
// cosh(x + yi) = cosh(x)cos(y) + isinh(x)sin(y)
double complex _ccosh(double complex in)
{
    if (!init) {
        void *handle = dlopen(DLL_FILE_NAME, RTLD_NOW);
        uint64_t acosdq_actual_off = (uint64_t)dlsym(handle, "__acosdq");
        uint64_t acosdq_off = 0x1e460; // __acosdq offset in libimf.so
        uint64_t sincos_k64_off = 0x9c7c0;
        _libm_sincos_k64 = (sincos_k64)(acosdq_actual_off + sincos_k64_off - acosdq_off);
        init = 1;
    }

    double complex res;   // off 0x40, 0x48
    double x = creal(in); // off 0x50
    double y = cimag(in); // off 0x58

    uint64_t x_exp = DOUBLE_EXP(x); // exponent
    uint64_t y_exp = DOUBLE_EXP(y);

    int con0 = x_exp == 0x7ff;
    int con1 = x_exp == 0;
    int con2 = DOUBLE_32to51(x) != 0;
    int con3 = DOUBLE_LOW32(x) != 0;
    int con9 = x_exp < 0x40a;

    int con4 = y_exp == 0;
    int con6 = y_exp == 0x7ff;
    int con8 = DOUBLE_LOW32(y) != 0;
    int con10 = DOUBLE_32to51(y) != 0;

    if (!con0) {
        if (con1 && !con2 && !con3) {
            if (!con4) {
                if (con6) {
                    ccosh_path3(1, in, &res);
                } else {
                    ccosh_path4(in, &res);
                }
            } else {
                if (!con10 && !con8) {
                    ccosh_path5(in, &res);
                } else {
                    ccosh_path4(in, &res);
                }
            }
        } else {
            if (!con6) {
                if (con4 && !con10 && !con8) {
                    ccosh_path4(in, &res);
                } else {
                    if (con9) {
                        ccosh_path2(in, &res);
                    } else {
                        ccosh_path1(in, &res);
                    }
                }
            } else {
                ccosh_path3(1, in, &res);
            }
        }
    } else {
        if (con4) {
            if (!con10 && !con8) {
                ccosh_path5(in, &res);
            } else {
                ccosh_path4(in, &res);
            }
        } else {
            if (con6) {
                ccosh_path3(0, in, &res);
            } else {
                ccosh_path4(in, &res);
            }
        }
    }
    return res;
}
