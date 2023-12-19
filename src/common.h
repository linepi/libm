#define DLL_FILE_NAME "/usr/lib64/libimf.so"

#define DOUBLE_SIGN(d) (DOUBLE_UINT64(d) >> 63U)
#define DOUBLE_EXP(d) ((DOUBLE_UINT64(d) >> 52U) & 0x7ff)
#define DOUBLE_FRAG(d) (DOUBLE_UINT64(d) & 0xfffffffffffff)
#define COMBINE_EXP_FRAG(flag, exp, frag) ((((uint64_t)(flag)) << 63U) | (((uint64_t)(exp)) << 52U) | (frag))

#define DOUBLE_LOW32(d) (DOUBLE_UINT64(d) & 0xffffffff)
#define DOUBLE_32to51(d) ((DOUBLE_UINT64(d) >> (32U)) & 0xfffff)
#define UINT64_TO_DOUBLE(u) (*(double *)(&(u)))
#define DOUBLE_UINT64(d) (*(uint64_t *)(&(d)))