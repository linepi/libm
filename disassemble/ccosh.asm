Dump of assembler code for function __libm_ccoshf_ex:
<+0>:     endbr64 
<+4>:     push   r12
<+6>:     push   r13
<+8>:     push   rbx
<+9>:     push   rbp
<+10>:    sub    rsp,0x68
<+14>:    stmxcsr DWORD PTR [rsp+0x60]
<+19>:    unpcklpd xmm0,xmm1
<+23>:    movups XMMWORD PTR [rsp+0x50],xmm0
<+28>:    mov    eax,DWORD PTR [rsp+0x60]
<+32>:    mov    r13d,eax
<+35>:    and    r13d,0x6000
<+42>:    je     0xc88ca <__libm_ccosh_ex+58>
<+44>:    and    eax,0xffff9fff
<+49>:    mov    DWORD PTR [rsp+0x60],eax
<+53>:    ldmxcsr DWORD PTR [rsp+0x60]

<+58>:    movzx  edx,WORD PTR [rsp+0x56]
<+63>:    and    edx,0x7ff0
<+69>:    shr    edx,0x4
<+72>:    cmp    edx,0x7ff
<+78>:    jge    0xc8bff <__libm_ccosh_ex+879>
<+84>:    test   edx,edx
<+86>:    jle    0xc8d95 <__libm_ccosh_ex+1285>
<+92>:    movzx  eax,WORD PTR [rsp+0x5e]
<+97>:    and    eax,0x7ff0
<+102>:   shr    eax,0x4
<+105>:   cmp    eax,0x7ff
<+110>:   jge    0xc8c99 <__libm_ccosh_ex+1033>
<+116>:   test   eax,eax
<+118>:   jle    0xc8d6f <__libm_ccosh_ex+1247>
<+124>:   cmp    edx,0x40a
<+130>:   jl     0xc89c0 <__libm_ccosh_ex+304>
<+136>:   movsd  xmm1,QWORD PTR [rip+0x1c42b8]        # 0x28cbd8 <_CONSTANTS>
<+144>:   mulsd  xmm1,xmm1
<+148>:   movsd  xmm0,QWORD PTR [rsp+0x58]
<+154>:   movsd  QWORD PTR [rsp],xmm1
<+159>:   call   0x21950 <__libm_cos>
<+164>:   movsd  xmm1,QWORD PTR [rsp]
<+169>:   movaps xmm2,xmm0
<+172>:   movsd  xmm0,QWORD PTR [rsp+0x50]
<+178>:   mulsd  xmm2,xmm1
<+182>:   mulsd  xmm1,xmm0
<+186>:   unpcklpd xmm2,xmm1
<+190>:   movzx  eax,WORD PTR [rsp+0x5e]
<+195>:   movups XMMWORD PTR [rsp+0x40],xmm2
<+200>:   test   eax,0x7ff0
<+205>:   jle    0xc897c <__libm_ccosh_ex+236>
<+207>:   movsd  xmm0,QWORD PTR [rsp+0x58]
<+213>:   call   0x25940 <__libm_sin>
<+218>:   movsd  xmm1,QWORD PTR [rsp+0x48]
<+224>:   mulsd  xmm1,xmm0
<+228>:   movsd  QWORD PTR [rsp+0x48],xmm1
<+234>:   jmp    0xc898e <__libm_ccosh_ex+254>
<+236>:   movsd  xmm0,QWORD PTR [rsp+0x48]
<+242>:   mulsd  xmm0,QWORD PTR [rsp+0x58]
<+248>:   movsd  QWORD PTR [rsp+0x48],xmm0
<+254>:   test   r13d,r13d
<+257>:   je     0xc89a9 <__libm_ccosh_ex+281>
<+259>:   stmxcsr DWORD PTR [rsp+0x60]
<+264>:   mov    eax,DWORD PTR [rsp+0x60]
<+268>:   or     r13d,eax
<+271>:   mov    DWORD PTR [rsp+0x60],r13d
<+276>:   ldmxcsr DWORD PTR [rsp+0x60]
<+281>:   movups xmm0,XMMWORD PTR [rsp+0x40]
<+286>:   movaps xmm1,xmm0
<+289>:   unpckhpd xmm1,xmm0
<+293>:   add    rsp,0x68
<+297>:   pop    rbp
<+298>:   pop    rbx
<+299>:   pop    r13
<+301>:   pop    r12
<+303>:   ret    
<+304>:   movsd  xmm0,QWORD PTR [rsp+0x50]
<+310>:   lea    rdi,[rsp]
<+314>:   call   0x8fa30 <__libm_cosh_k64>
<+319>:   mov    r12d,eax
<+322>:   movsd  xmm0,QWORD PTR [rsp]
<+327>:   movsd  xmm4,QWORD PTR [rsp+0x8]
<+333>:   movaps xmm5,xmm0
<+336>:   movsd  xmm3,QWORD PTR [rip+0x1c41d8]        # 0x28cbc0
<+344>:   addsd  xmm5,xmm4
<+348>:   mulsd  xmm3,xmm5
<+352>:   movaps xmm1,xmm5
<+355>:   subsd  xmm1,xmm0
<+359>:   movaps xmm2,xmm3
<+362>:   subsd  xmm4,xmm1
<+366>:   subsd  xmm2,xmm5
<+370>:   movzx  eax,WORD PTR [rsp+0x56]
<+375>:   subsd  xmm3,xmm2
<+379>:   and    eax,0x7ff0
<+384>:   subsd  xmm5,xmm3
<+388>:   movsd  QWORD PTR [rsp],xmm3
<+393>:   addsd  xmm5,xmm4
<+397>:   movsd  QWORD PTR [rsp+0x8],xmm5
<+403>:   cmp    eax,0x3370
<+408>:   jge    0xc8a6b <__libm_ccosh_ex+475>
<+410>:   movsd  xmm0,QWORD PTR [rsp+0x50]
<+416>:   lea    rdx,[rsp+0x18]
<+421>:   mulsd  xmm0,QWORD PTR [rip+0x1c41ab]        # 0x28cbe8 <_CONSTANTS+16>
<+429>:   pxor   xmm5,xmm5
<+433>:   movsd  QWORD PTR [rdx-0x8],xmm0
<+438>:   movzx  eax,WORD PTR [rdx-0x2]
<+442>:   mov    ebp,eax
<+444>:   and    ebp,0x7ff0
<+450>:   and    eax,0xffff800f
<+455>:   shr    ebp,0x4
<+458>:   add    eax,0x3ff0
<+463>:   mov    WORD PTR [rdx-0x2],ax
<+467>:   add    ebp,0xfffffb01
<+473>:   jmp    0xc8a86 <__libm_ccosh_ex+502>
<+475>:   movsd  xmm0,QWORD PTR [rsp+0x50]
<+481>:   lea    rdi,[rsp+0x10]
<+486>:   call   0x8f600 <__libm_sinh_k64>
<+491>:   mov    ebp,eax
<+493>:   lea    rdx,[rsp+0x18]
<+498>:   movsd  xmm5,QWORD PTR [rdx]
<+502>:   movsd  xmm0,QWORD PTR [rsp+0x10]
<+508>:   movaps xmm4,xmm5
<+511>:   movsd  xmm3,QWORD PTR [rip+0x1c4129]        # 0x28cbc0
<+519>:   lea    rdi,[rsp+0x20]
<+524>:   addsd  xmm4,xmm0
<+528>:   mulsd  xmm3,xmm4
<+532>:   movaps xmm1,xmm4
<+535>:   subsd  xmm1,xmm0
<+539>:   movaps xmm2,xmm3
<+542>:   lea    rsi,[rsp+0x30]
<+547>:   movsd  xmm0,QWORD PTR [rsi+0x28]
<+552>:   subsd  xmm2,xmm4
<+556>:   subsd  xmm5,xmm1
<+560>:   subsd  xmm3,xmm2
<+564>:   movsd  QWORD PTR [rsi-0x20],xmm3
<+569>:   subsd  xmm4,xmm3
<+573>:   addsd  xmm5,xmm4
<+577>:   movsd  QWORD PTR [rdx],xmm5
<+581>:   call   0x9c7c0 <__libm_sincos_k64>
<+586>:   movsd  xmm0,QWORD PTR [rsp+0x30]
<+592>:   movsd  xmm4,QWORD PTR [rsp+0x38]
<+598>:   movaps xmm3,xmm0
<+601>:   movsd  xmm6,QWORD PTR [rip+0x1c40cf]        # 0x28cbc0
<+609>:   addsd  xmm3,xmm4
<+613>:   mulsd  xmm6,xmm3
<+617>:   movaps xmm1,xmm3
<+620>:   subsd  xmm1,xmm0
<+624>:   movaps xmm2,xmm6
<+627>:   subsd  xmm4,xmm1
<+631>:   subsd  xmm2,xmm3
<+635>:   movsd  xmm5,QWORD PTR [rip+0x1c40cd]        # 0x28cbe0 <_CONSTANTS+8>
<+643>:   subsd  xmm6,xmm2
<+647>:   movzx  eax,WORD PTR [rsp+0x5e]
<+652>:   subsd  xmm3,xmm6
<+656>:   addsd  xmm6,xmm5
<+660>:   addsd  xmm4,xmm3
<+664>:   and    eax,0x7ff0
<+669>:   movsd  QWORD PTR [rsp+0x38],xmm4
<+675>:   movsd  QWORD PTR [rsp+0x30],xmm6
<+681>:   cmp    eax,0x3370
<+686>:   jl     0xc8b4d <__libm_ccosh_ex+701>
<+688>:   xor    ebx,ebx
<+690>:   lea    rdx,[rsp+0x28]
<+695>:   movsd  xmm5,QWORD PTR [rdx]
<+699>:   jmp    0xc8b8c <__libm_ccosh_ex+764>
<+701>:   movsd  xmm0,QWORD PTR [rsp+0x58]
<+707>:   lea    rdx,[rsp+0x28]
<+712>:   mulsd  xmm0,QWORD PTR [rip+0x1c4088]        # 0x28cbe8 <_CONSTANTS+16>
<+720>:   pxor   xmm5,xmm5
<+724>:   movsd  QWORD PTR [rdx-0x8],xmm0
<+729>:   movzx  eax,WORD PTR [rdx-0x2]
<+733>:   mov    ebx,eax
<+735>:   and    ebx,0x7ff0
<+741>:   and    eax,0xffff800f
<+746>:   shr    ebx,0x4
<+749>:   add    eax,0x3ff0
<+754>:   mov    WORD PTR [rdx-0x2],ax
<+758>:   add    ebx,0xfffffb01
<+764>:   movsd  xmm0,QWORD PTR [rsp+0x20]
<+770>:   movaps xmm4,xmm5
<+773>:   movsd  xmm3,QWORD PTR [rip+0x1c4023]        # 0x28cbc0
<+781>:   lea    rsi,[rsp]
<+785>:   mov    edi,r12d
<+788>:   lea    rcx,[rsp+0x40]
<+793>:   addsd  xmm4,xmm0
<+797>:   mulsd  xmm3,xmm4
<+801>:   movaps xmm1,xmm4
<+804>:   subsd  xmm1,xmm0
<+808>:   movaps xmm2,xmm3
<+811>:   subsd  xmm5,xmm1
<+815>:   subsd  xmm2,xmm4
<+819>:   subsd  xmm3,xmm2
<+823>:   movsd  QWORD PTR [rcx-0x20],xmm3
<+828>:   subsd  xmm4,xmm3
<+832>:   addsd  xmm5,xmm4
<+836>:   movsd  QWORD PTR [rdx],xmm5
<+840>:   lea    rdx,[rsp+0x30]
<+845>:   call   0x94820 <__libm_mul_k64>
<+850>:   add    ebx,ebp
<+852>:   lea    rsi,[rsp+0x10]
<+857>:   mov    edi,ebx
<+859>:   lea    rdx,[rsp+0x20]
<+864>:   lea    rcx,[rsp+0x48]
<+869>:   call   0x94820 <__libm_mul_k64>
<+874>:   jmp    0xc8d3e <__libm_ccosh_ex+1198>
<+879>:   movzx  eax,WORD PTR [rsp+0x5e]
<+884>:   and    eax,0x7ff0
<+889>:   shr    eax,0x4
<+892>:   jne    0xc8c8a <__libm_ccosh_ex+1018>
<+894>:   test   DWORD PTR [rsp+0x5c],0xfffff
<+902>:   jne    0xc8cda <__libm_ccosh_ex+1098>
<+908>:   cmp    DWORD PTR [rsp+0x58],0x0
<+913>:   jne    0xc8cda <__libm_ccosh_ex+1098>
<+919>:   movsd  xmm0,QWORD PTR [rsp+0x50]
<+925>:   call   0x21c10 <__libm_cosh>
<+930>:   movzx  eax,WORD PTR [rsp+0x56]
<+935>:   and    eax,0x7ff0
<+940>:   movhpd xmm0,QWORD PTR [rsp+0x58]
<+946>:   movups XMMWORD PTR [rsp+0x40],xmm0
<+951>:   cmp    eax,0x7ff0
<+956>:   jl     0xc8c67 <__libm_ccosh_ex+983>
<+958>:   test   DWORD PTR [rsp+0x54],0xfffff
<+966>:   jne    0xc8d3e <__libm_ccosh_ex+1198>
<+972>:   cmp    DWORD PTR [rsp+0x50],0x0
<+977>:   jne    0xc8d3e <__libm_ccosh_ex+1198>
<+983>:   mov    dl,BYTE PTR [rsp+0x4f]
<+987>:   mov    cl,dl
<+989>:   mov    al,BYTE PTR [rsp+0x57]
<+993>:   and    cl,0x7f
<+996>:   shr    dl,0x7
<+999>:   shr    al,0x7
<+1002>:  xor    dl,al
<+1004>:  shl    dl,0x7
<+1007>:  or     cl,dl
<+1009>:  mov    BYTE PTR [rsp+0x4f],cl
<+1013>:  jmp    0xc8d3e <__libm_ccosh_ex+1198>
<+1018>:  cmp    eax,0x7ff
<+1023>:  jl     0xc8cda <__libm_ccosh_ex+1098>
<+1025>:  cmp    edx,0x7ff
<+1031>:  jge    0xc8ca6 <__libm_ccosh_ex+1046>
<+1033>:  movsd  xmm0,QWORD PTR [rsp+0x58]
<+1039>:  call   0x21950 <__libm_cos>
<+1044>:  jmp    0xc8cb1 <__libm_ccosh_ex+1057>
<+1046>:  movsd  xmm0,QWORD PTR [rsp+0x50]
<+1052>:  call   0x21c10 <__libm_cosh>
<+1057>:  movsd  QWORD PTR [rsp+0x40],xmm0
<+1063>:  movzx  eax,WORD PTR [rsp+0x56]
<+1068>:  test   eax,0x7ff0
<+1073>:  jle    0xc8dc6 <__libm_ccosh_ex+1334>
<+1079>:  movsd  xmm0,QWORD PTR [rsp+0x58]
<+1085>:  call   0x25940 <__libm_sin>
<+1090>:  movsd  QWORD PTR [rsp+0x48],xmm0
<+1096>:  jmp    0xc8d3e <__libm_ccosh_ex+1198>
<+1098>:  movsd  xmm0,QWORD PTR [rsp+0x50]
<+1104>:  call   0x21c10 <__libm_cosh>
<+1109>:  movsd  QWORD PTR [rsp],xmm0
<+1114>:  movsd  xmm0,QWORD PTR [rsp+0x58]
<+1120>:  call   0x21950 <__libm_cos>
<+1125>:  movsd  xmm1,QWORD PTR [rsp]
<+1130>:  mulsd  xmm1,xmm0
<+1134>:  movzx  eax,WORD PTR [rsp+0x5e]
<+1139>:  movsd  QWORD PTR [rsp+0x40],xmm1
<+1145>:  test   eax,0x7ff0
<+1150>:  jle    0xc8e31 <__libm_ccosh_ex+1441>
<+1156>:  movsd  xmm0,QWORD PTR [rsp+0x50]
<+1162>:  call   0x26160 <__libm_sinh>
<+1167>:  movsd  QWORD PTR [rsp],xmm0
<+1172>:  movsd  xmm0,QWORD PTR [rsp+0x58]
<+1178>:  call   0x25940 <__libm_sin>
<+1183>:  movsd  xmm1,QWORD PTR [rsp]
<+1188>:  mulsd  xmm1,xmm0
<+1192>:  movsd  QWORD PTR [rsp+0x48],xmm1
<+1198>:  test   r13d,r13d
<+1201>:  je     0xc8d58 <__libm_ccosh_ex+1224>
<+1203>:  stmxcsr DWORD PTR [rsp+0x60]
<+1208>:  mov    eax,DWORD PTR [rsp+0x60]
<+1212>:  or     eax,r13d
<+1215>:  mov    DWORD PTR [rsp+0x60],eax
<+1219>:  ldmxcsr DWORD PTR [rsp+0x60]
<+1224>:  movups xmm0,XMMWORD PTR [rsp+0x40]
<+1229>:  movaps xmm1,xmm0
<+1232>:  unpckhpd xmm1,xmm0
<+1236>:  add    rsp,0x68
<+1240>:  pop    rbp
<+1241>:  pop    rbx
<+1242>:  pop    r13
<+1244>:  pop    r12
<+1246>:  ret    
<+1247>:  test   DWORD PTR [rsp+0x5c],0xfffff
<+1255>:  jne    0xc890c <__libm_ccosh_ex+124>
<+1261>:  cmp    DWORD PTR [rsp+0x58],0x0
<+1266>:  jne    0xc890c <__libm_ccosh_ex+124>
<+1272>:  test   eax,eax
<+1274>:  je     0xc8c0e <__libm_ccosh_ex+894>
<+1280>:  jmp    0xc8cda <__libm_ccosh_ex+1098>
<+1285>:  test   DWORD PTR [rsp+0x54],0xfffff
<+1293>:  jne    0xc88ec <__libm_ccosh_ex+92>
<+1299>:  cmp    DWORD PTR [rsp+0x50],0x0
<+1304>:  jne    0xc88ec <__libm_ccosh_ex+92>
<+1310>:  movzx  eax,WORD PTR [rsp+0x5e]
<+1315>:  and    eax,0x7ff0
<+1320>:  shr    eax,0x4
<+1323>:  je     0xc8c0e <__libm_ccosh_ex+894>
<+1329>:  jmp    0xc8c8a <__libm_ccosh_ex+1018>
<+1334>:  test   DWORD PTR [rsp+0x54],0xfffff
<+1342>:  jne    0xc8cc7 <__libm_ccosh_ex+1079>
<+1348>:  cmp    DWORD PTR [rsp+0x50],0x0
<+1353>:  jne    0xc8cc7 <__libm_ccosh_ex+1079>
<+1359>:  test   DWORD PTR [rsp+0x5c],0xfffff
<+1367>:  jne    0xc8e23 <__libm_ccosh_ex+1427>
<+1369>:  cmp    DWORD PTR [rsp+0x58],0x0
<+1374>:  jne    0xc8e23 <__libm_ccosh_ex+1427>
<+1376>:  mov    dl,BYTE PTR [rsp+0x57]
<+1380>:  lea    rcx,[rip+0x1c3dcd]        # 0x28cbc8 <ones>
<+1387>:  mov    al,BYTE PTR [rsp+0x5f]
<+1391>:  and    dl,0x80
<+1394>:  and    al,0x80
<+1396>:  pxor   xmm0,xmm0
<+1400>:  shr    dl,0x7
<+1403>:  shr    al,0x7
<+1406>:  xor    dl,al
<+1408>:  movzx  ebx,dl
<+1411>:  mulsd  xmm0,QWORD PTR [rcx+rbx*8]
<+1416>:  movsd  QWORD PTR [rsp+0x48],xmm0
<+1422>:  jmp    0xc8d3e <__libm_ccosh_ex+1198>
<+1427>:  mov    QWORD PTR [rsp+0x48],0x0
<+1436>:  jmp    0xc8d3e <__libm_ccosh_ex+1198>
<+1441>:  movsd  xmm0,QWORD PTR [rsp+0x50]
<+1447>:  call   0x26160 <__libm_sinh>
<+1452>:  movaps xmm1,xmm0
<+1455>:  movsd  xmm0,QWORD PTR [rsp+0x58]
<+1461>:  mulsd  xmm1,xmm0
<+1465>:  movsd  QWORD PTR [rsp+0x48],xmm1
<+1471>:  jmp    0xc8d3e <__libm_ccosh_ex+1198>
<+1476>:  nop    DWORD PTR [rax+rax*1+0x0]
<+1481>:  nop    DWORD PTR [rax+0x0]
End of assembler dump.