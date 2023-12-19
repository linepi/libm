char _libm_ccosh_ex(__m128d a1, __m128d a2)
{
  int v2; // eax
  int v3; // er13
  signed int v4; // edx
  signed int v5; // eax
  __m128d v6; // xmm1
  int v7; // eax
  int v8; // et0
  unsigned int v9; // er12
  double v10; // xmm4_8
  double v11; // xmm5_8
  double v12; // xmm5_8
  unsigned int v13; // ebp
  int v14; // ebp
  double v15; // xmm4_8
  double v16; // xmm1_8
  double v17; // xmm6_8
  int v18; // ebx
  double v19; // xmm5_8
  unsigned int v20; // ebx
  double v21; // xmm4_8
  double v22; // xmm1_8
  signed int v23; // eax
  __m128d v24; // xmm0
  double v25; // xmm0_8
  int v26; // et0
  double v28; // [rsp+0h] [rbp-88h]
  double v29; // [rsp+8h] [rbp-80h]
  double v30; // [rsp+10h] [rbp-78h]
  double v31; // [rsp+18h] [rbp-70h]
  double v32; // [rsp+20h] [rbp-68h]
  double v33; // [rsp+28h] [rbp-60h]
  double v34; // [rsp+30h] [rbp-58h]
  double v35; // [rsp+38h] [rbp-50h]
  __m128d v36; // [rsp+40h] [rbp-48h]
  __m128d v37; // [rsp+50h] [rbp-38h]
  int v38; // [rsp+60h] [rbp-28h]

  __asm { endbr64 }
  v38 = _mm_getcsr();
  v37 = _mm_unpckl_pd(a1, a2);
  v2 = v38;
  v3 = v38 & 0x6000;
  if ( v38 & 0x6000 )
  {
    v38 &= 0xFFFF9FFF;
    _mm_setcsr(v2 & 0xFFFF9FFF);
  }
  v4 = (HIWORD(v37.m128d_f64[0]) & 0x7FF0u) >> 4;
  if ( v4 >= 2047 )
  {
    v23 = (HIWORD(v37.m128d_f64[1]) & 0x7FF0u) >> 4;
    if ( v23 )
      goto LABEL_27;
    goto LABEL_21;
  }
  if ( v4 <= 0 && !(HIDWORD(v37.m128d_f64[0]) & 0xFFFFF) && !LODWORD(v37.m128d_f64[0]) )
  {
    v23 = (HIWORD(v37.m128d_f64[1]) & 0x7FF0u) >> 4;
    if ( v23 )
    {
LABEL_27:
      if ( v23 >= 2047 )
      {
        if ( v4 >= 2047 )
        {
          v25 = v37.m128d_f64[0];
          _libm_cosh();
          goto LABEL_31;
        }
LABEL_29:
        v25 = v37.m128d_f64[1];
        _libm_cos();
LABEL_31:
        v36.m128d_f64[0] = v25;
        LOBYTE(v7) = BYTE6(v37.m128d_f64[0]);
        if ( (HIWORD(v37.m128d_f64[0]) & 0x7FF0) > 0 || HIDWORD(v37.m128d_f64[0]) & 0xFFFFF || LODWORD(v37.m128d_f64[0]) )
        {
          LOBYTE(v7) = _libm_sin();
          v36.m128d_f64[1] = v37.m128d_f64[1];
        }
        else if ( HIDWORD(v37.m128d_f64[1]) & 0xFFFFF || LODWORD(v37.m128d_f64[1]) )
        {
          v36.m128d_f64[1] = 0.0;
        }
        else
        {
          LOBYTE(v7) = (unsigned __int8)(HIBYTE(v37.m128d_f64[1]) & 0x80) >> 7;
          v36.m128d_f64[1] = 0.0
                           * ones_56[(unsigned __int8)(v7 ^ ((unsigned __int8)(HIBYTE(v37.m128d_f64[0]) & 0x80) >> 7))];
        }
LABEL_36:
        if ( v3 )
        {
          v26 = _mm_getcsr();
          LOBYTE(v7) = v3 | v26;
          v38 = v3 | v26;
          _mm_setcsr(v3 | v26);
        }
        return v7;
      }
LABEL_33:
      _libm_cosh();
      _libm_cos();
      v36.m128d_f64[0] = v37.m128d_f64[0] * v37.m128d_f64[1];
      if ( (HIWORD(v37.m128d_f64[1]) & 0x7FF0) <= 0 )
      {
        LOBYTE(v7) = _libm_sinh();
      }
      else
      {
        _libm_sinh();
        LOBYTE(v7) = _libm_sin();
      }
      v36.m128d_f64[1] = v37.m128d_f64[0] * v37.m128d_f64[1];
      goto LABEL_36;
    }
LABEL_21:
    if ( !(HIDWORD(v37.m128d_f64[1]) & 0xFFFFF) && !LODWORD(v37.m128d_f64[1]) )
    {
      v24.m128d_f64[0] = v37.m128d_f64[0];
      _libm_cosh();
      v7 = HIWORD(v37.m128d_f64[0]) & 0x7FF0;
      v24.m128d_f64[1] = v37.m128d_f64[1];
      v36 = v24;
      if ( v7 < 32752 || !(HIDWORD(v37.m128d_f64[0]) & 0xFFFFF) && !LODWORD(v37.m128d_f64[0]) )
      {
        LOBYTE(v7) = HIBYTE(v37.m128d_f64[0]) >> 7;
        HIBYTE(v36.m128d_f64[1]) = (((unsigned __int8)(HIBYTE(v37.m128d_f64[0]) >> 7) ^ (unsigned __int8)(HIBYTE(v36.m128d_f64[1]) >> 7)) << 7) | HIBYTE(v36.m128d_f64[1]) & 0x7F;
      }
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  v5 = (HIWORD(v37.m128d_f64[1]) & 0x7FF0u) >> 4;
  if ( v5 >= 2047 )
    goto LABEL_29;
  if ( v5 <= 0 && !(HIDWORD(v37.m128d_f64[1]) & 0xFFFFF) && !LODWORD(v37.m128d_f64[1]) )
  {
    if ( v5 )
      goto LABEL_33;
    goto LABEL_21;
  }
  if ( v4 < 1034 )
  {
    v9 = _libm_cosh_k64(&v28);
    v10 = v29 - (v28 + v29 - v28);
    v11 = v28 + v29 - (134217729.0 * (v28 + v29) - (134217729.0 * (v28 + v29) - (v28 + v29)));
    v28 = 134217729.0 * (v28 + v29) - (134217729.0 * (v28 + v29) - (v28 + v29));
    v29 = v11 + v10;
    if ( (HIWORD(v37.m128d_f64[0]) & 0x7FF0) >= 13168 )
    {
      v14 = _libm_sinh_k64(&v30);
      v12 = v31;
    }
    else
    {
      v12 = 0.0;
      v30 = v37.m128d_f64[0] * 1.157920892373162e77;
      v13 = (HIWORD(v30) & 0x7FF0u) >> 4;
      HIWORD(v30) = (HIWORD(v30) & 0x800F) + 16368;
      v14 = v13 - 1279;
    }
    v15 = v12 + v30;
    v16 = v12 + v30 - v30;
    v30 = 134217729.0 * (v12 + v30) - (134217729.0 * (v12 + v30) - (v12 + v30));
    v31 = v12 - v16 + v15 - v30;
    _libm_sincos_k64(&v32);
    v17 = 134217729.0 * (v34 + v35) - (134217729.0 * (v34 + v35) - (v34 + v35));
    v35 = v35 - (v34 + v35 - v34) + v34 + v35 - v17;
    v34 = v17 + 2.225073858507201e-308;
    if ( (HIWORD(v37.m128d_f64[1]) & 0x7FF0) < 13168 )
    {
      v19 = 0.0;
      v32 = v37.m128d_f64[1] * 1.157920892373162e77;
      v20 = (HIWORD(v32) & 0x7FF0u) >> 4;
      HIWORD(v32) = (HIWORD(v32) & 0x800F) + 16368;
      v18 = v20 - 1279;
    }
    else
    {
      v18 = 0;
      v19 = v33;
    }
    v21 = v19 + v32;
    v22 = v19 + v32 - v32;
    v32 = 134217729.0 * (v19 + v32) - (134217729.0 * (v19 + v32) - (v19 + v32));
    v33 = v19 - v22 + v21 - v32;
    _libm_mul_k64(v9, &v28, &v34);
    LOBYTE(v7) = _libm_mul_k64((unsigned int)(v14 + v18), &v30, &v32);
    goto LABEL_36;
  }
  _libm_cos();
  v6 = (__m128d)COERCE_UNSIGNED_INT64(8.98846567431158e307 * 8.98846567431158e307);
  v6.m128d_f64[0] = 8.98846567431158e307 * 8.98846567431158e307 * v37.m128d_f64[0];
  LOBYTE(v7) = BYTE6(v37.m128d_f64[1]);
  v36 = _mm_unpckl_pd(
          (__m128d)COERCE_UNSIGNED_INT64(v37.m128d_f64[1] * (8.98846567431158e307 * 8.98846567431158e307)),
          v6);
  if ( (HIWORD(v37.m128d_f64[1]) & 0x7FF0) > 0 )
    LOBYTE(v7) = _libm_sin();
  v36.m128d_f64[1] = v36.m128d_f64[1] * v37.m128d_f64[1];
  if ( v3 )
  {
    v8 = _mm_getcsr();
    LOBYTE(v7) = v8;
    _mm_setcsr(v8 | v3);
  }
  return v7;
}