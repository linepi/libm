Dump of assembler code for function __libm_mul_k64:
   0x0000000000094820 <+0>:     endbr64 
   0x0000000000094824 <+4>:     movzx  r8d,WORD PTR [rsi+0x6]
   0x0000000000094829 <+9>:     and    r8d,0x7ff0
   0x0000000000094830 <+16>:    shr    r8d,0x4
   0x0000000000094834 <+20>:    movsd  xmm3,QWORD PTR [rsi]
   0x0000000000094838 <+24>:    movsd  xmm7,QWORD PTR [rsi+0x8]
   0x000000000009483d <+29>:    movsd  xmm2,QWORD PTR [rdx]
   0x0000000000094841 <+33>:    movsd  xmm4,QWORD PTR [rdx+0x8]
   0x0000000000094846 <+38>:    cmp    r8d,0x7ff
   0x000000000009484d <+45>:    je     0x94891 <__libm_mul_k64+113>
   0x000000000009484f <+47>:    test   r8d,r8d
   0x0000000000094852 <+50>:    jne    0x94862 <__libm_mul_k64+66>
   0x0000000000094854 <+52>:    test   DWORD PTR [rsi+0x4],0xfffff
   0x000000000009485b <+59>:    jne    0x94862 <__libm_mul_k64+66>
   0x000000000009485d <+61>:    cmp    DWORD PTR [rsi],0x0
   0x0000000000094860 <+64>:    je     0x94891 <__libm_mul_k64+113>
   0x0000000000094862 <+66>:    movsd  QWORD PTR [rsp-0x18],xmm2
   0x0000000000094868 <+72>:    movzx  eax,WORD PTR [rsp-0x12]
   0x000000000009486d <+77>:    and    eax,0x7ff0
   0x0000000000094872 <+82>:    shr    eax,0x4
   0x0000000000094875 <+85>:    cmp    eax,0x7ff
   0x000000000009487a <+90>:    je     0x94891 <__libm_mul_k64+113>
   0x000000000009487c <+92>:    test   eax,eax
   0x000000000009487e <+94>:    jne    0x9489a <__libm_mul_k64+122>
   0x0000000000094880 <+96>:    test   DWORD PTR [rsp-0x14],0xfffff
   0x0000000000094888 <+104>:   jne    0x9489a <__libm_mul_k64+122>
   0x000000000009488a <+106>:   cmp    DWORD PTR [rsp-0x18],0x0
   0x000000000009488f <+111>:   jne    0x9489a <__libm_mul_k64+122>
   0x0000000000094891 <+113>:   mulsd  xmm3,xmm2
   0x0000000000094895 <+117>:   movsd  QWORD PTR [rcx],xmm3
   0x0000000000094899 <+121>:   ret    
   0x000000000009489a <+122>:   test   r8d,r8d
   0x000000000009489d <+125>:   jne    0x948ba <__libm_mul_k64+154>
   0x000000000009489f <+127>:   movsd  xmm0,QWORD PTR [rip+0x1b8549]        # 0x24cdf0 <_CONSTANTS>
   0x00000000000948a7 <+135>:   add    edi,0xfffffc01
   0x00000000000948ad <+141>:   movaps xmm1,xmm0
   0x00000000000948b0 <+144>:   mulsd  xmm1,xmm3
   0x00000000000948b4 <+148>:   mulsd  xmm7,xmm0
   0x00000000000948b8 <+152>:   jmp    0x94904 <__libm_mul_k64+228>
   0x00000000000948ba <+154>:   mov    esi,r8d
   0x00000000000948bd <+157>:   movaps xmm1,xmm3
   0x00000000000948c0 <+160>:   neg    esi
   0x00000000000948c2 <+162>:   lea    edi,[rdi+r8*1-0x3ff]
   0x00000000000948ca <+170>:   mov    rdx,QWORD PTR [rip+0x1b853f]        # 0x24ce10 <_CONSTANTS+32>
   0x00000000000948d1 <+177>:   add    esi,0x7fe
   0x00000000000948d7 <+183>:   mov    QWORD PTR [rsp-0x18],rdx
   0x00000000000948dc <+188>:   and    esi,0x7ff
   0x00000000000948e2 <+194>:   shr    rdx,0x30
   0x00000000000948e6 <+198>:   shl    esi,0x4
   0x00000000000948e9 <+201>:   and    edx,0xffff800f
   0x00000000000948ef <+207>:   or     edx,esi
   0x00000000000948f1 <+209>:   mov    WORD PTR [rsp-0x12],dx
   0x00000000000948f6 <+214>:   movsd  xmm0,QWORD PTR [rsp-0x18]
   0x00000000000948fc <+220>:   mulsd  xmm1,xmm0
   0x0000000000094900 <+224>:   mulsd  xmm7,xmm0
   0x0000000000094904 <+228>:   test   eax,eax
   0x0000000000094906 <+230>:   jne    0x94925 <__libm_mul_k64+261>
   0x0000000000094908 <+232>:   movsd  xmm0,QWORD PTR [rip+0x1b84e0]        # 0x24cdf0 <_CONSTANTS>
   0x0000000000094910 <+240>:   add    edi,0xfffffc01
   0x0000000000094916 <+246>:   movaps xmm8,xmm0
   0x000000000009491a <+250>:   mulsd  xmm8,xmm2
   0x000000000009491f <+255>:   mulsd  xmm4,xmm0
   0x0000000000094923 <+259>:   jmp    0x9496f <__libm_mul_k64+335>
   0x0000000000094925 <+261>:   mov    esi,eax
   0x0000000000094927 <+263>:   movaps xmm8,xmm2
   0x000000000009492b <+267>:   neg    esi
   0x000000000009492d <+269>:   lea    edi,[rdi+rax*1-0x3ff]
   0x0000000000094934 <+276>:   mov    rdx,QWORD PTR [rip+0x1b84d5]        # 0x24ce10 <_CONSTANTS+32>
   0x000000000009493b <+283>:   add    esi,0x7fe
   0x0000000000094941 <+289>:   mov    QWORD PTR [rsp-0x18],rdx
   0x0000000000094946 <+294>:   and    esi,0x7ff
   0x000000000009494c <+300>:   shr    rdx,0x30
   0x0000000000094950 <+304>:   shl    esi,0x4
   0x0000000000094953 <+307>:   and    edx,0xffff800f
   0x0000000000094959 <+313>:   or     edx,esi
   0x000000000009495b <+315>:   mov    WORD PTR [rsp-0x12],dx
   0x0000000000094960 <+320>:   movsd  xmm0,QWORD PTR [rsp-0x18]
   0x0000000000094966 <+326>:   mulsd  xmm8,xmm0
   0x000000000009496b <+331>:   mulsd  xmm4,xmm0
   0x000000000009496f <+335>:   movaps xmm0,xmm7
   0x0000000000094972 <+338>:   movaps xmm10,xmm4
   0x0000000000094976 <+342>:   addsd  xmm0,xmm1
   0x000000000009497a <+346>:   addsd  xmm10,xmm8
   0x000000000009497f <+351>:   movaps xmm5,xmm0
   0x0000000000094982 <+354>:   movaps xmm11,xmm10
   0x0000000000094986 <+358>:   subsd  xmm5,xmm1
   0x000000000009498a <+362>:   movsd  xmm1,QWORD PTR [rip+0x1b846e]        # 0x24ce00 <_CONSTANTS+16>
   0x0000000000094992 <+370>:   mulsd  xmm11,xmm1
   0x0000000000094997 <+375>:   subsd  xmm7,xmm5
   0x000000000009499b <+379>:   movaps xmm9,xmm1
   0x000000000009499f <+383>:   mulsd  xmm9,xmm0
   0x00000000000949a4 <+388>:   movaps xmm6,xmm9
   0x00000000000949a8 <+392>:   subsd  xmm6,xmm0
   0x00000000000949ac <+396>:   subsd  xmm9,xmm6
   0x00000000000949b1 <+401>:   movaps xmm5,xmm9
   0x00000000000949b5 <+405>:   subsd  xmm0,xmm9
   0x00000000000949ba <+410>:   addsd  xmm0,xmm7
   0x00000000000949be <+414>:   movaps xmm7,xmm10
   0x00000000000949c2 <+418>:   subsd  xmm7,xmm8
   0x00000000000949c7 <+423>:   movaps xmm8,xmm11
   0x00000000000949cb <+427>:   movaps xmm6,xmm0
   0x00000000000949ce <+430>:   subsd  xmm8,xmm10
   0x00000000000949d3 <+435>:   subsd  xmm4,xmm7
   0x00000000000949d7 <+439>:   subsd  xmm11,xmm8
   0x00000000000949dc <+444>:   mulsd  xmm0,xmm11
   0x00000000000949e1 <+449>:   subsd  xmm10,xmm11
   0x00000000000949e6 <+454>:   mulsd  xmm5,xmm11
   0x00000000000949eb <+459>:   addsd  xmm10,xmm4
   0x00000000000949f0 <+464>:   mulsd  xmm6,xmm10
   0x00000000000949f5 <+469>:   movaps xmm4,xmm5
   0x00000000000949f8 <+472>:   mulsd  xmm10,xmm9
   0x00000000000949fd <+477>:   addsd  xmm6,xmm10
   0x0000000000094a02 <+482>:   addsd  xmm6,xmm0
   0x0000000000094a06 <+486>:   addsd  xmm4,xmm6
   0x0000000000094a0a <+490>:   movsd  QWORD PTR [rsp-0x10],xmm4
   0x0000000000094a10 <+496>:   movzx  edx,WORD PTR [rsp-0xa]
   0x0000000000094a15 <+501>:   mov    esi,edx
   0x0000000000094a17 <+503>:   and    esi,0x7ff0
   0x0000000000094a1d <+509>:   shr    esi,0x4
   0x0000000000094a20 <+512>:   lea    eax,[rdi+rsi*1]
   0x0000000000094a23 <+515>:   cmp    eax,0x7ff
   0x0000000000094a28 <+520>:   jl     0x94a43 <__libm_mul_k64+547>
   0x0000000000094a2a <+522>:   movsd  xmm0,QWORD PTR [rip+0x1b83be]        # 0x24cdf0 <_CONSTANTS>
   0x0000000000094a32 <+530>:   mulsd  xmm0,xmm0
   0x0000000000094a36 <+534>:   mulsd  xmm0,xmm3
   0x0000000000094a3a <+538>:   mulsd  xmm0,xmm2
   0x0000000000094a3e <+542>:   movsd  QWORD PTR [rcx],xmm0
   0x0000000000094a42 <+546>:   ret    
   0x0000000000094a43 <+547>:   test   eax,eax
   0x0000000000094a45 <+549>:   jle    0x94a65 <__libm_mul_k64+581>
   0x0000000000094a47 <+551>:   and    eax,0x7ff
   0x0000000000094a4c <+556>:   and    edx,0xffff800f
   0x0000000000094a52 <+562>:   shl    eax,0x4
   0x0000000000094a55 <+565>:   or     edx,eax
   0x0000000000094a57 <+567>:   mov    WORD PTR [rsp-0xa],dx
   0x0000000000094a5c <+572>:   mov    rax,QWORD PTR [rsp-0x10]
   0x0000000000094a61 <+577>:   mov    QWORD PTR [rcx],rax
   0x0000000000094a64 <+580>:   ret    
   0x0000000000094a65 <+581>:   cmp    eax,0xfffffff7
   0x0000000000094a68 <+584>:   jl     0x94af9 <__libm_mul_k64+729>
   0x0000000000094a6e <+590>:   movsd  xmm0,QWORD PTR [rip+0x1b8382]        # 0x24cdf8 <_CONSTANTS+8>
   0x0000000000094a76 <+598>:   movaps xmm4,xmm6
   0x0000000000094a79 <+601>:   mulsd  xmm0,xmm0
   0x0000000000094a7d <+605>:   add    edi,0x58f
   0x0000000000094a83 <+611>:   mov    rax,QWORD PTR [rip+0x1b8386]        # 0x24ce10 <_CONSTANTS+32>
   0x0000000000094a8a <+618>:   and    edi,0x7ff
   0x0000000000094a90 <+624>:   mov    QWORD PTR [rsp-0x18],rax
   0x0000000000094a95 <+629>:   addsd  xmm5,xmm0
   0x0000000000094a99 <+633>:   shr    rax,0x30
   0x0000000000094a9d <+637>:   addsd  xmm4,xmm5
   0x0000000000094aa1 <+641>:   mulsd  xmm1,xmm4
   0x0000000000094aa5 <+645>:   movaps xmm2,xmm4
   0x0000000000094aa8 <+648>:   subsd  xmm2,xmm5
   0x0000000000094aac <+652>:   movaps xmm5,xmm1
   0x0000000000094aaf <+655>:   and    eax,0xffff800f
   0x0000000000094ab4 <+660>:   shl    edi,0x4
   0x0000000000094ab7 <+663>:   subsd  xmm5,xmm4
   0x0000000000094abb <+667>:   subsd  xmm6,xmm2
   0x0000000000094abf <+671>:   subsd  xmm1,xmm5
   0x0000000000094ac3 <+675>:   or     eax,edi
   0x0000000000094ac5 <+677>:   subsd  xmm4,xmm1
   0x0000000000094ac9 <+681>:   mov    WORD PTR [rsp-0x12],ax
   0x0000000000094ace <+686>:   addsd  xmm4,xmm6
   0x0000000000094ad2 <+690>:   movsd  xmm6,QWORD PTR [rip+0x1b832e]        # 0x24ce08 <_CONSTANTS+24>
   0x0000000000094ada <+698>:   mulsd  xmm1,xmm6
   0x0000000000094ade <+702>:   mulsd  xmm4,xmm6
   0x0000000000094ae2 <+706>:   movsd  xmm3,QWORD PTR [rsp-0x18]
   0x0000000000094ae8 <+712>:   mulsd  xmm1,xmm3
   0x0000000000094aec <+716>:   mulsd  xmm4,xmm3
   0x0000000000094af0 <+720>:   addsd  xmm1,xmm4
   0x0000000000094af4 <+724>:   movsd  QWORD PTR [rcx],xmm1
   0x0000000000094af8 <+728>:   ret    
   0x0000000000094af9 <+729>:   cmp    eax,0xffffffc2
   0x0000000000094afc <+732>:   jle    0x94b65 <__libm_mul_k64+837>
   0x0000000000094afe <+734>:   movsd  xmm0,QWORD PTR [rip+0x1b82f2]        # 0x24cdf8 <_CONSTANTS+8>
   0x0000000000094b06 <+742>:   lea    esi,[rdi+rsi*1+0x3fe]
   0x0000000000094b0d <+749>:   mov    rax,QWORD PTR [rip+0x1b82fc]        # 0x24ce10 <_CONSTANTS+32>
   0x0000000000094b14 <+756>:   and    esi,0x7ff
   0x0000000000094b1a <+762>:   mulsd  xmm0,xmm0
   0x0000000000094b1e <+766>:   and    edx,0xffff800f
   0x0000000000094b24 <+772>:   mov    QWORD PTR [rsp-0x18],rax
   0x0000000000094b29 <+777>:   add    edx,0x10
   0x0000000000094b2c <+780>:   shr    rax,0x30
   0x0000000000094b30 <+784>:   shl    esi,0x4
   0x0000000000094b33 <+787>:   and    eax,0xffff800f
   0x0000000000094b38 <+792>:   or     eax,esi
   0x0000000000094b3a <+794>:   mov    WORD PTR [rsp-0x12],ax
   0x0000000000094b3f <+799>:   mov    WORD PTR [rsp-0xa],dx
   0x0000000000094b44 <+804>:   movsd  xmm1,QWORD PTR [rsp-0x10]
   0x0000000000094b4a <+810>:   addsd  xmm0,QWORD PTR [rsp-0x18]
   0x0000000000094b50 <+816>:   mulsd  xmm1,xmm0
   0x0000000000094b54 <+820>:   movsd  QWORD PTR [rsp-0x18],xmm0
   0x0000000000094b5a <+826>:   movsd  QWORD PTR [rsp-0x10],xmm1
   0x0000000000094b60 <+832>:   movsd  QWORD PTR [rcx],xmm1
   0x0000000000094b64 <+836>:   ret    
   0x0000000000094b65 <+837>:   movsd  xmm0,QWORD PTR [rip+0x1b828b]        # 0x24cdf8 <_CONSTANTS+8>
   0x0000000000094b6d <+845>:   mulsd  xmm0,xmm0
   0x0000000000094b71 <+849>:   mulsd  xmm0,xmm3
   0x0000000000094b75 <+853>:   mulsd  xmm0,xmm2
   0x0000000000094b79 <+857>:   movsd  QWORD PTR [rcx],xmm0
   0x0000000000094b7d <+861>:   ret    
   0x0000000000094b7e <+862>:   xchg   ax,ax
End of assembler dump.