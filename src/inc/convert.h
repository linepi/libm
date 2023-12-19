#ifndef __CONVERT_H__
#define __CONVERT_H__
#include <stdint.h>
#include <stdlib.h>
typedef struct U128 {
    uint64_t low;
    uint64_t high;
} u128_t;

static inline u128_t Asuint128(long double ld)
{
    union {
        long double ld;
        u128_t u128;
    } u = {ld};
    return u.u128;
}
static inline long double Aslongdouble(u128_t i)
{
    union {
        u128_t i;
        long double ld;
    } u = {i};
    return u.ld;
}
static inline uint16_t GetLongDoubleExp(long double x)
{
    uint16_t expPart;
    u128_t ux = Asuint128(x);
    expPart = (uint16_t)(ux.high >> 0x30U) & 0x7fff;
    return expPart;
}
static inline long double SetLongDoubleSign(long double x, uint16_t sign)
{
    u128_t ux = Asuint128(x);
    ux.high = (ux.high & 0x7fffffffffffffffULL) | ((uint64_t)sign << 0x3fU);
    return Aslongdouble(ux);
}
static inline uint16_t GetLongDoubleSign(long double x)
{
    uint16_t signPart;
    u128_t ux = Asuint128(x);
    signPart = (uint16_t)(ux.high >> 0x3fU);
    return signPart;
}
static long double RT80NSubnormal(long double x)
{
    uint16_t xSign = GetLongDoubleSign(x);
    return SetLongDoubleSign(
        (SetLongDoubleSign(x, 0) + 0x1p-16333L) - 0x1p-16333L, xSign);
}

static inline long double
RT80N(long double x) // round 128 precision arm long double to 80 precision x86
                     // long double
{
    int exp = GetLongDoubleExp(x);
    if (exp < 1) {
        return RT80NSubnormal(x);
    }
    double scale1 = exp > 0x7F9B ? 0x1p-1000 : 0x1p0;
    double scale2 = exp > 0x7F9B ? 0x1p1000 : 0x1p0;
    u128_t ux = Asuint128(x * scale1);
    u128_t ut = {0, ux.high & 0xffff000000000000ULL};
    long double shift = Aslongdouble(ut) * 0x1.8p49L;
    return (exp == 0x7fff) ? x : (x * scale1 + shift - shift) * scale2;
}
static inline uint32_t Asuint(float f)
{
    union {
        float f;
        uint32_t i;
    } u = {f};
    return u.i;
}

static inline float Asfloat(uint32_t i)
{
    union {
        uint32_t i;
        float f;
    } u = {i};
    return u.f;
}

static inline uint64_t Asuint64(double f)
{
    union {
        double f;
        uint64_t i;
    } u = {f};
    return u.i;
}

static inline double Asdouble(uint64_t i)
{
    union {
        uint64_t i;
        double f;
    } u = {i};
    return u.f;
}

typedef struct {
    uint64_t manL;
    uint64_t manH : 48;
    uint64_t sign_exp : 16;
} uint128_t;

typedef struct {
    uint64_t man;
    uint64_t sign_exp : 16;
    uint64_t rev : 48;
} uint80_t;
static inline uint128_t AsU128F128(long double ld)
{
    union {
        long double ld;
        uint128_t u128;
    } u = {ld};
    return u.u128;
}

static inline long double AsF128U128(uint128_t i)
{
    union {
        uint128_t i;
        long double ld;
    } u = {i};
    return u.ld;
}

static inline long double AsF128U80(uint80_t i)
{
    union {
        uint80_t i;
        long double ld;
    } u = {i};
    return u.ld;
}

static inline uint80_t AsU80F128(long double i)
{
    union {
        long double ld;
        uint80_t i;
    } u = {i};
    u.i.rev = 0x0ULL;
    return u.i;
}

static inline uint80_t AsU80U128(uint128_t xi)
{
    uint128_t ti = {
        .manL = 0x0000000000000000ULL,
        .manH = 0x0ULL,
        .sign_exp = xi.sign_exp, // 0x1p(xExp)
    };
    long double shift = 0x1p-64L;
    if ((xi.sign_exp & 0x7fffULL) == 0) {
        ti.manH = 0x800000000000ULL; // 0x0.8p(xExp)
        shift = 0x1p-63L;
    }
    long double t = AsF128U128(ti);
    long double x = AsF128U128(xi);
    t = t * shift + x;
    ti = AsU128F128(t);
    uint80_t res = {
        .man = ((uint64_t)ti.manH << 15) | (ti.manL >> 49),
        .sign_exp = ti.sign_exp,
        .rev = 0x0ULL,
    };
    if ((res.sign_exp & 0x7fffULL) != 0) {
        res.man |= 0x8000000000000000ULL;
    }
    return res;
}

static inline uint128_t AsU128U80(uint80_t xi)
{
    uint128_t res = {
        .manL = (xi.man & 0x7fffULL) << 49,
        .manH = (xi.man & 0x7fffffffffff8000ULL) >> 15,
        .sign_exp = xi.sign_exp,
    };
    return res;
}
#endif