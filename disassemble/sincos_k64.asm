Dump of assembler code for function __libm_sincos_k64:
   0x000000000009c7c0 <+0>:     endbr64 
   0x000000000009c7c4 <+4>:     push   rbx
   0x000000000009c7c5 <+5>:     push   rbp
   0x000000000009c7c6 <+6>:     sub    rsp,0x38
   0x000000000009c7ca <+10>:    mov    rbp,rsi
   0x000000000009c7cd <+13>:    movsd  QWORD PTR [rsp],xmm0
   0x000000000009c7d2 <+18>:    mov    rbx,rdi
   0x000000000009c7d5 <+21>:    movzx  eax,WORD PTR [rsp+0x6]
   0x000000000009c7da <+26>:    and    eax,0x7ff0
   0x000000000009c7df <+31>:    mov    dl,BYTE PTR [rsp+0x7]
   0x000000000009c7e3 <+35>:    and    dl,0x7f
   0x000000000009c7e6 <+38>:    movsd  QWORD PTR [rsp+0x8],xmm0
   0x000000000009c7ec <+44>:    cmp    eax,0x7ff0
   0x000000000009c7f1 <+49>:    je     0x9caa0 <__libm_sincos_k64+736>
   0x000000000009c7f7 <+55>:    mov    BYTE PTR [rsp+0xf],dl
   0x000000000009c7fb <+59>:    movzx  eax,WORD PTR [rsp+0xe]
   0x000000000009c800 <+64>:    and    eax,0x7ff0
   0x000000000009c805 <+69>:    shr    eax,0x4
   0x000000000009c808 <+72>:    cmp    eax,0x303
   0x000000000009c80d <+77>:    jl     0x9ca7d <__libm_sincos_k64+701>
   0x000000000009c813 <+83>:    cmp    eax,0x410
   0x000000000009c818 <+88>:    jge    0x9c82c <__libm_sincos_k64+108>
   0x000000000009c81a <+90>:    movsd  xmm1,QWORD PTR [rip+0x1b836e]        # 0x254b90 <sincos_table+2176>
   0x000000000009c822 <+98>:    xor    edx,edx
   0x000000000009c824 <+100>:   movsd  QWORD PTR [rsp+0x8],xmm1
   0x000000000009c82a <+106>:   jmp    0x9c842 <__libm_sincos_k64+130>
   0x000000000009c82c <+108>:   lea    rdi,[rsp]
   0x000000000009c830 <+112>:   call   0x99ef0 <__libm_reduce_pio2d>
   0x000000000009c835 <+117>:   mov    edx,eax
   0x000000000009c837 <+119>:   movsd  xmm0,QWORD PTR [rsp]
   0x000000000009c83c <+124>:   movsd  xmm1,QWORD PTR [rsp+0x8]
   0x000000000009c842 <+130>:   movsd  xmm14,QWORD PTR [rip+0x1b82c5]        # 0x254b10 <sincos_table+2048>
   0x000000000009c84b <+139>:   lea    rsi,[rip+0x1b7abe]        # 0x254310 <sincos_table>
   0x000000000009c852 <+146>:   mulsd  xmm14,xmm0
   0x000000000009c857 <+151>:   movsd  xmm11,QWORD PTR [rip+0x1b82b8]        # 0x254b18 <sincos_table+2056>
   0x000000000009c860 <+160>:   movsd  xmm12,QWORD PTR [rip+0x1b82b7]        # 0x254b20 <sincos_table+2064>
   0x000000000009c869 <+169>:   addsd  xmm14,xmm11
   0x000000000009c86e <+174>:   movsd  QWORD PTR [rsp+0x10],xmm14
   0x000000000009c875 <+181>:   subsd  xmm14,xmm11
   0x000000000009c87a <+186>:   mulsd  xmm12,xmm14
   0x000000000009c87f <+191>:   movsd  xmm13,QWORD PTR [rip+0x1b82a0]        # 0x254b28 <sincos_table+2072>
   0x000000000009c888 <+200>:   subsd  xmm0,xmm12
   0x000000000009c88d <+205>:   mulsd  xmm13,xmm14
   0x000000000009c892 <+210>:   mulsd  xmm14,QWORD PTR [rip+0x1b8295]        # 0x254b30 <sincos_table+2080>
   0x000000000009c89b <+219>:   movaps xmm10,xmm0
   0x000000000009c89f <+223>:   movsd  xmm2,QWORD PTR [rip+0x1b82a9]        # 0x254b50 <sincos_table+2112>
   0x000000000009c8a7 <+231>:   subsd  xmm10,xmm13
   0x000000000009c8ac <+236>:   movaps xmm15,xmm10
   0x000000000009c8b0 <+240>:   movaps xmm12,xmm10
   0x000000000009c8b4 <+244>:   mulsd  xmm15,xmm10
   0x000000000009c8b9 <+249>:   subsd  xmm0,xmm10
   0x000000000009c8be <+254>:   mulsd  xmm2,xmm15
   0x000000000009c8c3 <+259>:   subsd  xmm0,xmm13
   0x000000000009c8c8 <+264>:   movsd  xmm11,QWORD PTR [rip+0x1b829f]        # 0x254b70 <sincos_table+2144>
   0x000000000009c8d1 <+273>:   subsd  xmm0,xmm14
   0x000000000009c8d6 <+278>:   mulsd  xmm11,xmm15
   0x000000000009c8db <+283>:   addsd  xmm2,QWORD PTR [rip+0x1b8265]        # 0x254b48 <sincos_table+2104>
   0x000000000009c8e3 <+291>:   addsd  xmm0,xmm1
   0x000000000009c8e7 <+295>:   mulsd  xmm2,xmm15
   0x000000000009c8ec <+300>:   addsd  xmm11,QWORD PTR [rip+0x1b8273]        # 0x254b68 <sincos_table+2136>
   0x000000000009c8f5 <+309>:   mulsd  xmm11,xmm15
   0x000000000009c8fa <+314>:   addsd  xmm2,QWORD PTR [rip+0x1b823e]        # 0x254b40 <sincos_table+2096>
   0x000000000009c902 <+322>:   mulsd  xmm2,xmm15
   0x000000000009c907 <+327>:   addsd  xmm11,QWORD PTR [rip+0x1b8250]        # 0x254b60 <sincos_table+2128>
   0x000000000009c910 <+336>:   shl    edx,0x4
   0x000000000009c913 <+339>:   addsd  xmm2,QWORD PTR [rip+0x1b821d]        # 0x254b38 <sincos_table+2088>
   0x000000000009c91b <+347>:   mulsd  xmm11,xmm15
   0x000000000009c920 <+352>:   mulsd  xmm2,xmm15
   0x000000000009c925 <+357>:   addsd  xmm11,QWORD PTR [rip+0x1b822a]        # 0x254b58 <sincos_table+2120>
   0x000000000009c92e <+366>:   mulsd  xmm2,xmm10
   0x000000000009c933 <+371>:   mulsd  xmm11,xmm15
   0x000000000009c938 <+376>:   mov    eax,DWORD PTR [rsp+0x10]
   0x000000000009c93c <+380>:   lea    ecx,[rax+rdx*1]
   0x000000000009c93f <+383>:   and    ecx,0x3f
   0x000000000009c942 <+386>:   lea    edx,[rax+rdx*1+0x10]
   0x000000000009c946 <+390>:   shl    ecx,0x2
   0x000000000009c949 <+393>:   and    edx,0x3f
   0x000000000009c94c <+396>:   shl    edx,0x2
   0x000000000009c94f <+399>:   movsd  xmm9,QWORD PTR [rsi+rcx*8]
   0x000000000009c955 <+405>:   movsd  xmm4,QWORD PTR [rsi+rcx*8+0x18]
   0x000000000009c95b <+411>:   movaps xmm8,xmm9
   0x000000000009c95f <+415>:   movsd  xmm6,QWORD PTR [rsi+rdx*8]
   0x000000000009c964 <+420>:   addsd  xmm8,xmm4
   0x000000000009c969 <+425>:   mulsd  xmm4,xmm10
   0x000000000009c96e <+430>:   mulsd  xmm9,xmm10
   0x000000000009c973 <+435>:   movsd  xmm5,QWORD PTR [rsi+rdx*8+0x18]
   0x000000000009c979 <+441>:   movaps xmm3,xmm6
   0x000000000009c97c <+444>:   movaps xmm7,xmm8
   0x000000000009c980 <+448>:   movaps xmm13,xmm4
   0x000000000009c984 <+452>:   mulsd  xmm7,xmm2
   0x000000000009c988 <+456>:   addsd  xmm3,xmm5
   0x000000000009c98c <+460>:   mulsd  xmm5,xmm10
   0x000000000009c991 <+465>:   mulsd  xmm6,xmm10
   0x000000000009c996 <+470>:   mulsd  xmm2,xmm3
   0x000000000009c99a <+474>:   movsd  QWORD PTR [rsp+0x18],xmm2
   0x000000000009c9a0 <+480>:   movaps xmm14,xmm5
   0x000000000009c9a4 <+484>:   movsd  xmm2,QWORD PTR [rsi+rcx*8+0x8]
   0x000000000009c9aa <+490>:   movaps xmm1,xmm2
   0x000000000009c9ad <+493>:   addsd  xmm13,xmm2
   0x000000000009c9b2 <+498>:   mulsd  xmm1,xmm11
   0x000000000009c9b7 <+503>:   mulsd  xmm12,xmm2
   0x000000000009c9bc <+508>:   subsd  xmm2,xmm13
   0x000000000009c9c1 <+513>:   subsd  xmm8,xmm12
   0x000000000009c9c6 <+518>:   addsd  xmm2,xmm4
   0x000000000009c9ca <+522>:   mulsd  xmm8,xmm0
   0x000000000009c9cf <+527>:   movsd  QWORD PTR [rsp+0x20],xmm1
   0x000000000009c9d5 <+533>:   movsd  xmm1,QWORD PTR [rsi+rdx*8+0x8]
   0x000000000009c9db <+539>:   mulsd  xmm10,xmm1
   0x000000000009c9e0 <+544>:   addsd  xmm14,xmm1
   0x000000000009c9e5 <+549>:   addsd  xmm8,QWORD PTR [rsi+rcx*8+0x10]
   0x000000000009c9ec <+556>:   mulsd  xmm11,xmm1
   0x000000000009c9f1 <+561>:   subsd  xmm3,xmm10
   0x000000000009c9f6 <+566>:   subsd  xmm1,xmm14
   0x000000000009c9fb <+571>:   addsd  xmm8,xmm2
   0x000000000009ca00 <+576>:   mulsd  xmm0,xmm3
   0x000000000009ca04 <+580>:   addsd  xmm1,xmm5
   0x000000000009ca08 <+584>:   addsd  xmm0,QWORD PTR [rsi+rdx*8+0x10]
   0x000000000009ca0e <+590>:   movsd  QWORD PTR [rsp+0x28],xmm11
   0x000000000009ca15 <+597>:   movaps xmm11,xmm13
   0x000000000009ca19 <+601>:   movaps xmm15,xmm14
   0x000000000009ca1d <+605>:   addsd  xmm11,xmm9
   0x000000000009ca22 <+610>:   addsd  xmm15,xmm6
   0x000000000009ca27 <+615>:   addsd  xmm0,xmm1
   0x000000000009ca2b <+619>:   subsd  xmm13,xmm11
   0x000000000009ca30 <+624>:   subsd  xmm14,xmm15
   0x000000000009ca35 <+629>:   addsd  xmm9,xmm13
   0x000000000009ca3a <+634>:   addsd  xmm6,xmm14
   0x000000000009ca3f <+639>:   addsd  xmm8,xmm9
   0x000000000009ca44 <+644>:   addsd  xmm0,xmm6
   0x000000000009ca48 <+648>:   addsd  xmm8,xmm7
   0x000000000009ca4d <+653>:   addsd  xmm0,QWORD PTR [rsp+0x18]
   0x000000000009ca53 <+659>:   addsd  xmm8,QWORD PTR [rsp+0x20]
   0x000000000009ca5a <+666>:   addsd  xmm0,QWORD PTR [rsp+0x28]
   0x000000000009ca60 <+672>:   movsd  QWORD PTR [rbx],xmm11
   0x000000000009ca65 <+677>:   movsd  QWORD PTR [rbx+0x8],xmm8
   0x000000000009ca6b <+683>:   movsd  QWORD PTR [rbp+0x0],xmm15
   0x000000000009ca71 <+689>:   movsd  QWORD PTR [rbp+0x8],xmm0
   0x000000000009ca76 <+694>:   add    rsp,0x38
   0x000000000009ca7a <+698>:   pop    rbp
   0x000000000009ca7b <+699>:   pop    rbx
   0x000000000009ca7c <+700>:   ret    
   0x000000000009ca7d <+701>:   xor    eax,eax
   0x000000000009ca7f <+703>:   movsd  QWORD PTR [rbx],xmm0
   0x000000000009ca83 <+707>:   mov    QWORD PTR [rbx+0x8],rax
   0x000000000009ca87 <+711>:   movabs rbx,0x3ff0000000000000
   0x000000000009ca91 <+721>:   mov    QWORD PTR [rbp+0x0],rbx
   0x000000000009ca95 <+725>:   mov    QWORD PTR [rbp+0x8],rax
   0x000000000009ca99 <+729>:   add    rsp,0x38
   0x000000000009ca9d <+733>:   pop    rbp
   0x000000000009ca9e <+734>:   pop    rbx
   0x000000000009ca9f <+735>:   ret    
   0x000000000009caa0 <+736>:   mulsd  xmm0,QWORD PTR [rip+0x1b80e8]        # 0x254b90 <sincos_table+2176>
   0x000000000009caa8 <+744>:   xor    eax,eax
   0x000000000009caaa <+746>:   movsd  QWORD PTR [rbx],xmm0
   0x000000000009caae <+750>:   mov    QWORD PTR [rbx+0x8],rax
   0x000000000009cab2 <+754>:   movsd  QWORD PTR [rbp+0x0],xmm0
   0x000000000009cab7 <+759>:   mov    QWORD PTR [rbp+0x8],rax
   0x000000000009cabb <+763>:   add    rsp,0x38
   0x000000000009cabf <+767>:   pop    rbp
   0x000000000009cac0 <+768>:   pop    rbx
   0x000000000009cac1 <+769>:   ret    
   0x000000000009cac2 <+770>:   nop    DWORD PTR [rax+0x0]
   0x000000000009cac9 <+777>:   nop    DWORD PTR [rax+0x0]
End of assembler dump.