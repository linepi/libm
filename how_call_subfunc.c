#include <stdio.h>
#include <dlfcn.h>
#include <stdint.h>
#include <math.h>

int main() {
    void (*sincos_k64)(double, double *, double *);
    // 加载动态库
    void *handle = dlopen("/usr/lib64/libimf.so", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "%s\n", dlerror());
        return 1;
    }
    uint64_t __acosdq_off = 0x1e460; // __acosdq在动态库中的偏移量
    uint64_t __sincos_k64_off = 0x9c7c0; // __libm_sincos_k64在动态库中的偏移量
    sincos_k64 = (void (*)(double, double *, double *))((uint64_t)dlsym(handle, "__acosdq") + __sincos_k64_off - __acosdq_off);

    // 调用函数
    double angle = M_PI/2, sin_val, cos_val, a, b;
    sincos_k64(angle, &sin_val, &cos_val);

    // 使用返回的值...
    printf("sin(%f) = %f, cos(%f) = %f\n", angle, sin_val, angle, cos_val);

    // 清理
    dlclose(handle);
    return 0;
}
