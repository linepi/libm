Dump of assembler code for function __libm_reduce_pio2d:
   0x0000000000099ef0 <+0>:     endbr64 
   0x0000000000099ef4 <+4>:     mov    r9,rdi
   0x0000000000099ef7 <+7>:     movsd  QWORD PTR [rsp-0x8],xmm0
   0x0000000000099efd <+13>:    movzx  eax,BYTE PTR [rsp-0x1]
   0x0000000000099f02 <+18>:    mov    r8d,eax
   0x0000000000099f05 <+21>:    and    eax,0x7f
   0x0000000000099f08 <+24>:    and    r8d,0x80
   0x0000000000099f0f <+31>:    mov    BYTE PTR [rsp-0x1],al
   0x0000000000099f13 <+35>:    movzx  ecx,WORD PTR [rsp-0x2]
   0x0000000000099f18 <+40>:    mov    edx,ecx
   0x0000000000099f1a <+42>:    and    edx,0x7ff0
   0x0000000000099f20 <+48>:    shr    edx,0x4
   0x0000000000099f23 <+51>:    shr    r8d,0x7
   0x0000000000099f27 <+55>:    cmp    edx,0x41d
   0x0000000000099f2d <+61>:    jge    0x9a0d1 <__libm_reduce_pio2d+481>
   0x0000000000099f33 <+67>:    movsd  xmm0,QWORD PTR [rsp-0x8]
   0x0000000000099f39 <+73>:    movsd  xmm1,QWORD PTR [rip+0x1b319f]        # 0x24d0e0 <_PI04_INV>
   0x0000000000099f41 <+81>:    mulsd  xmm1,xmm0
   0x0000000000099f45 <+85>:    movsd  QWORD PTR [rsp-0x10],xmm1
   0x0000000000099f4b <+91>:    movzx  ecx,WORD PTR [rsp-0xa]
   0x0000000000099f50 <+96>:    and    ecx,0x7ff0
   0x0000000000099f56 <+102>:   shr    ecx,0x4
   0x0000000000099f59 <+105>:   cmp    ecx,0x3ff
   0x0000000000099f5f <+111>:   jl     0x99f80 <__libm_reduce_pio2d+144>
   0x0000000000099f61 <+113>:   mov    esi,DWORD PTR [rsp-0xc]
   0x0000000000099f65 <+117>:   neg    ecx
   0x0000000000099f67 <+119>:   or     esi,0xfff00000
   0x0000000000099f6d <+125>:   add    ecx,0x1e
   0x0000000000099f70 <+128>:   mov    eax,DWORD PTR [rsp-0x10]
   0x0000000000099f74 <+132>:   shl    esi,0xb
   0x0000000000099f77 <+135>:   shr    eax,0x15
   0x0000000000099f7a <+138>:   or     esi,eax
   0x0000000000099f7c <+140>:   shr    esi,cl
   0x0000000000099f7e <+142>:   jmp    0x99f82 <__libm_reduce_pio2d+146>
   0x0000000000099f80 <+144>:   xor    esi,esi
   0x0000000000099f82 <+146>:   mov    ecx,esi
   0x0000000000099f84 <+148>:   lea    eax,[r8+r8*1]
   0x0000000000099f88 <+152>:   and    ecx,0x1
   0x0000000000099f8b <+155>:   neg    eax
   0x0000000000099f8d <+157>:   add    ecx,esi
   0x0000000000099f8f <+159>:   inc    esi
   0x0000000000099f91 <+161>:   shr    esi,1
   0x0000000000099f93 <+163>:   inc    eax
   0x0000000000099f95 <+165>:   imul   eax,esi
   0x0000000000099f98 <+168>:   pxor   xmm7,xmm7
   0x0000000000099f9c <+172>:   cvtsi2sd xmm7,ecx
   0x0000000000099fa0 <+176>:   and    eax,0x3
   0x0000000000099fa3 <+179>:   cmp    edx,0x416
   0x0000000000099fa9 <+185>:   jge    0x9a00a <__libm_reduce_pio2d+282>
   0x0000000000099fab <+187>:   movsd  xmm1,QWORD PTR [rip+0x1b313d]        # 0x24d0f0 <_PI04_29x4>
   0x0000000000099fb3 <+195>:   mulsd  xmm1,xmm7
   0x0000000000099fb7 <+199>:   movsd  xmm2,QWORD PTR [rip+0x1b3139]        # 0x24d0f8 <_PI04_29x4+8>
   0x0000000000099fbf <+207>:   subsd  xmm0,xmm1
   0x0000000000099fc3 <+211>:   mulsd  xmm2,xmm7
   0x0000000000099fc7 <+215>:   movaps xmm4,xmm0
   0x0000000000099fca <+218>:   movsd  xmm3,QWORD PTR [rip+0x1b312e]        # 0x24d100 <_PI04_29x4+16>
   0x0000000000099fd2 <+226>:   subsd  xmm4,xmm2
   0x0000000000099fd6 <+230>:   mulsd  xmm3,xmm7
   0x0000000000099fda <+234>:   subsd  xmm0,xmm4
   0x0000000000099fde <+238>:   movsd  xmm5,QWORD PTR [rip+0x1b3122]        # 0x24d108 <_PI04_29x4+24>
   0x0000000000099fe6 <+246>:   subsd  xmm0,xmm2
   0x0000000000099fea <+250>:   mulsd  xmm7,xmm5
   0x0000000000099fee <+254>:   movaps xmm2,xmm4
   0x0000000000099ff1 <+257>:   subsd  xmm2,xmm3
   0x0000000000099ff5 <+261>:   subsd  xmm4,xmm2
   0x0000000000099ff9 <+265>:   subsd  xmm4,xmm3
   0x0000000000099ffd <+269>:   addsd  xmm0,xmm4
   0x000000000009a001 <+273>:   subsd  xmm0,xmm7
   0x000000000009a005 <+277>:   jmp    0x9a09e <__libm_reduce_pio2d+430>
   0x000000000009a00a <+282>:   movsd  xmm1,QWORD PTR [rip+0x1b30fe]        # 0x24d110 <_PI04_21x5>
   0x000000000009a012 <+290>:   mulsd  xmm1,xmm7
   0x000000000009a016 <+294>:   movsd  xmm2,QWORD PTR [rip+0x1b30fa]        # 0x24d118 <_PI04_21x5+8>
   0x000000000009a01e <+302>:   subsd  xmm0,xmm1
   0x000000000009a022 <+306>:   mulsd  xmm2,xmm7
   0x000000000009a026 <+310>:   movaps xmm4,xmm0
   0x000000000009a029 <+313>:   movsd  xmm3,QWORD PTR [rip+0x1b30ef]        # 0x24d120 <_PI04_21x5+16>
   0x000000000009a031 <+321>:   subsd  xmm4,xmm2
   0x000000000009a035 <+325>:   mulsd  xmm3,xmm7
   0x000000000009a039 <+329>:   subsd  xmm0,xmm4
   0x000000000009a03d <+333>:   movaps xmm8,xmm4
   0x000000000009a041 <+337>:   subsd  xmm0,xmm2
   0x000000000009a045 <+341>:   subsd  xmm8,xmm3
   0x000000000009a04a <+346>:   movaps xmm5,xmm8
   0x000000000009a04e <+350>:   subsd  xmm4,xmm8
   0x000000000009a053 <+355>:   movsd  xmm6,QWORD PTR [rip+0x1b30d5]        # 0x24d130 <_PI04_21x5+32>
   0x000000000009a05b <+363>:   subsd  xmm4,xmm3
   0x000000000009a05f <+367>:   addsd  xmm0,xmm4
   0x000000000009a063 <+371>:   addsd  xmm5,xmm0
   0x000000000009a067 <+375>:   movaps xmm2,xmm5
   0x000000000009a06a <+378>:   subsd  xmm8,xmm5
   0x000000000009a06f <+383>:   addsd  xmm8,xmm0
   0x000000000009a074 <+388>:   movsd  xmm0,QWORD PTR [rip+0x1b30ac]        # 0x24d128 <_PI04_21x5+24>
   0x000000000009a07c <+396>:   mulsd  xmm0,xmm7
   0x000000000009a080 <+400>:   mulsd  xmm7,xmm6
   0x000000000009a084 <+404>:   subsd  xmm2,xmm0
   0x000000000009a088 <+408>:   subsd  xmm5,xmm2
   0x000000000009a08c <+412>:   subsd  xmm5,xmm0
   0x000000000009a090 <+416>:   addsd  xmm8,xmm5
   0x000000000009a095 <+421>:   subsd  xmm8,xmm7
   0x000000000009a09a <+426>:   movaps xmm0,xmm8
   0x000000000009a09e <+430>:   mov    r8d,r8d
   0x000000000009a0a1 <+433>:   lea    rdx,[rip+0x1b3098]        # 0x24d140 <_ones>
   0x000000000009a0a8 <+440>:   movsd  xmm1,QWORD PTR [rdx+r8*8]
   0x000000000009a0ae <+446>:   mulsd  xmm2,xmm1
   0x000000000009a0b2 <+450>:   mulsd  xmm0,xmm1
   0x000000000009a0b6 <+454>:   movaps xmm3,xmm2
   0x000000000009a0b9 <+457>:   addsd  xmm3,xmm0
   0x000000000009a0bd <+461>:   movsd  QWORD PTR [r9],xmm3
   0x000000000009a0c2 <+466>:   subsd  xmm2,xmm3
   0x000000000009a0c6 <+470>:   addsd  xmm2,xmm0
   0x000000000009a0ca <+474>:   movsd  QWORD PTR [r9+0x8],xmm2
   0x000000000009a0d0 <+480>:   ret    
   0x000000000009a0d1 <+481>:   and    ecx,0xffff800f
   0x000000000009a0d7 <+487>:   lea    r11d,[rdx-0x41c]
   0x000000000009a0de <+494>:   imul   edi,r11d,0x147ae
   0x000000000009a0e5 <+501>:   lea    eax,[rdx-0xc8]
   0x000000000009a0eb <+507>:   sar    edi,0x15
   0x000000000009a0ee <+510>:   and    eax,0x7ff
   0x000000000009a0f3 <+515>:   shl    eax,0x4
   0x000000000009a0f6 <+518>:   lea    r11,[rip+0x1b3053]        # 0x24d150 <_zero_none>
   0x000000000009a0fd <+525>:   movsxd rdi,edi
   0x000000000009a100 <+528>:   or     ecx,eax
   0x000000000009a102 <+530>:   imul   esi,edi,0xffffffe7
   0x000000000009a105 <+533>:   mov    WORD PTR [rsp-0x2],cx
   0x000000000009a10a <+538>:   lea    ecx,[rsi+rdx*1-0x41c]
   0x000000000009a111 <+545>:   movsd  xmm2,QWORD PTR [rsp-0x8]
   0x000000000009a117 <+551>:   lea    rsi,[rip+0x1b3042]        # 0x24d160 <_DP>
   0x000000000009a11e <+558>:   mov    r10d,DWORD PTR [rsp-0x8]
   0x000000000009a123 <+563>:   neg    ecx
   0x000000000009a125 <+565>:   movsd  QWORD PTR [rsp-0x18],xmm2
   0x000000000009a12b <+571>:   and    r10d,0xf8000000
   0x000000000009a132 <+578>:   mov    DWORD PTR [rsp-0x18],r10d
   0x000000000009a137 <+583>:   add    ecx,0x26
   0x000000000009a13a <+586>:   movsd  xmm1,QWORD PTR [rsp-0x18]
   0x000000000009a140 <+592>:   mov    rdx,0xffffffffffffffff
   0x000000000009a147 <+599>:   movsd  xmm0,QWORD PTR [rsi+rdi*8]
   0x000000000009a14c <+604>:   movaps xmm3,xmm1
   0x000000000009a14f <+607>:   movsd  xmm5,QWORD PTR [rsi+rdi*8+0x8]
   0x000000000009a155 <+613>:   movaps xmm7,xmm1
   0x000000000009a158 <+616>:   mulsd  xmm3,xmm5
   0x000000000009a15c <+620>:   subsd  xmm2,xmm1
   0x000000000009a160 <+624>:   mulsd  xmm0,xmm2
   0x000000000009a164 <+628>:   movaps xmm14,xmm1
   0x000000000009a168 <+632>:   mulsd  xmm5,xmm2
   0x000000000009a16c <+636>:   movaps xmm6,xmm0
   0x000000000009a16f <+639>:   shl    rdx,cl
   0x000000000009a172 <+642>:   addsd  xmm6,xmm3
   0x000000000009a176 <+646>:   movaps xmm4,xmm6
   0x000000000009a179 <+649>:   subsd  xmm0,xmm6
   0x000000000009a17d <+653>:   movsd  xmm12,QWORD PTR [rsi+rdi*8+0x10]
   0x000000000009a184 <+660>:   addsd  xmm0,xmm3
   0x000000000009a188 <+664>:   mulsd  xmm7,xmm12
   0x000000000009a18d <+669>:   mulsd  xmm12,xmm2
   0x000000000009a192 <+674>:   addsd  xmm4,xmm0
   0x000000000009a196 <+678>:   movq   rax,xmm4
   0x000000000009a19b <+683>:   movsd  xmm3,QWORD PTR [rsi+rdi*8+0x18]
   0x000000000009a1a1 <+689>:   mulsd  xmm14,xmm3
   0x000000000009a1a6 <+694>:   mulsd  xmm3,xmm2
   0x000000000009a1aa <+698>:   and    rax,rdx
   0x000000000009a1ad <+701>:   movabs rdx,0x10000000000000
   0x000000000009a1b7 <+711>:   mov    QWORD PTR [rsp-0x10],rax
   0x000000000009a1bc <+716>:   subsd  xmm6,QWORD PTR [rsp-0x10]
   0x000000000009a1c2 <+722>:   movaps xmm8,xmm6
   0x000000000009a1c6 <+726>:   addsd  xmm8,xmm5
   0x000000000009a1cb <+731>:   movaps xmm10,xmm8
   0x000000000009a1cf <+735>:   subsd  xmm6,xmm8
   0x000000000009a1d4 <+740>:   addsd  xmm10,xmm7
   0x000000000009a1d9 <+745>:   addsd  xmm6,xmm5
   0x000000000009a1dd <+749>:   subsd  xmm8,xmm10
   0x000000000009a1e2 <+754>:   addsd  xmm0,xmm6
   0x000000000009a1e6 <+758>:   addsd  xmm8,xmm7
   0x000000000009a1eb <+763>:   movaps xmm9,xmm10
   0x000000000009a1ef <+767>:   movaps xmm5,xmm1
   0x000000000009a1f2 <+770>:   movsd  xmm7,QWORD PTR [rsi+rdi*8+0x20]
   0x000000000009a1f8 <+776>:   addsd  xmm0,xmm8
   0x000000000009a1fd <+781>:   mulsd  xmm5,xmm7
   0x000000000009a201 <+785>:   mulsd  xmm7,xmm2
   0x000000000009a205 <+789>:   addsd  xmm9,xmm0
   0x000000000009a20a <+794>:   movaps xmm13,xmm0
   0x000000000009a20e <+798>:   addsd  xmm9,xmm12
   0x000000000009a213 <+803>:   addsd  xmm9,xmm14
   0x000000000009a218 <+808>:   movsd  QWORD PTR [rsp-0x10],xmm9
   0x000000000009a21f <+815>:   movzx  ecx,WORD PTR [rsp-0xa]
   0x000000000009a224 <+820>:   shr    ecx,0x4
   0x000000000009a227 <+823>:   movq   r10,xmm9
   0x000000000009a22c <+828>:   neg    ecx
   0x000000000009a22e <+830>:   movaps xmm9,xmm1
   0x000000000009a232 <+834>:   add    ecx,0x33
   0x000000000009a235 <+837>:   sar    r10,cl
   0x000000000009a238 <+840>:   sar    rdx,cl
   0x000000000009a23b <+843>:   or     rdx,r10
   0x000000000009a23e <+846>:   shl    r10,cl
   0x000000000009a241 <+849>:   mov    eax,edx
   0x000000000009a243 <+851>:   mov    QWORD PTR [rsp-0x10],r10
   0x000000000009a248 <+856>:   and    eax,0x1
   0x000000000009a24b <+859>:   movsd  xmm11,QWORD PTR [r11+rax*8]
   0x000000000009a251 <+865>:   inc    edx
   0x000000000009a253 <+867>:   shr    edx,1
   0x000000000009a255 <+869>:   lea    eax,[r8+r8*1]
   0x000000000009a259 <+873>:   neg    eax
   0x000000000009a25b <+875>:   subsd  xmm10,QWORD PTR [rsp-0x10]
   0x000000000009a262 <+882>:   inc    eax
   0x000000000009a264 <+884>:   addsd  xmm13,xmm10
   0x000000000009a269 <+889>:   imul   eax,edx
   0x000000000009a26c <+892>:   subsd  xmm10,xmm13
   0x000000000009a271 <+897>:   addsd  xmm13,xmm11
   0x000000000009a276 <+902>:   addsd  xmm0,xmm10
   0x000000000009a27b <+907>:   movaps xmm15,xmm13
   0x000000000009a27f <+911>:   movaps xmm11,xmm1
   0x000000000009a283 <+915>:   lea    rdx,[rip+0x1b2eb6]        # 0x24d140 <_ones>
   0x000000000009a28a <+922>:   and    eax,0x3
   0x000000000009a28d <+925>:   addsd  xmm15,xmm12
   0x000000000009a292 <+930>:   movaps xmm4,xmm15
   0x000000000009a296 <+934>:   subsd  xmm13,xmm15
   0x000000000009a29b <+939>:   addsd  xmm4,xmm14
   0x000000000009a2a0 <+944>:   addsd  xmm13,xmm12
   0x000000000009a2a5 <+949>:   subsd  xmm15,xmm4
   0x000000000009a2aa <+954>:   addsd  xmm0,xmm13
   0x000000000009a2af <+959>:   addsd  xmm15,xmm14
   0x000000000009a2b4 <+964>:   movaps xmm6,xmm4
   0x000000000009a2b7 <+967>:   movaps xmm14,xmm1
   0x000000000009a2bb <+971>:   movsd  xmm12,QWORD PTR [rsi+rdi*8+0x28]
   0x000000000009a2c2 <+978>:   addsd  xmm6,xmm3
   0x000000000009a2c6 <+982>:   mulsd  xmm9,xmm12
   0x000000000009a2cb <+987>:   addsd  xmm0,xmm15
   0x000000000009a2d0 <+992>:   mulsd  xmm12,xmm2
   0x000000000009a2d5 <+997>:   subsd  xmm4,xmm6
   0x000000000009a2d9 <+1001>:  movaps xmm8,xmm6
   0x000000000009a2dd <+1005>:  addsd  xmm4,xmm3
   0x000000000009a2e1 <+1009>:  addsd  xmm8,xmm5
   0x000000000009a2e6 <+1014>:  addsd  xmm0,xmm4
   0x000000000009a2ea <+1018>:  subsd  xmm6,xmm8
   0x000000000009a2ef <+1023>:  movaps xmm10,xmm8
   0x000000000009a2f3 <+1027>:  addsd  xmm6,xmm5
   0x000000000009a2f7 <+1031>:  addsd  xmm10,xmm7
   0x000000000009a2fc <+1036>:  addsd  xmm0,xmm6
   0x000000000009a300 <+1040>:  subsd  xmm8,xmm10
   0x000000000009a305 <+1045>:  movsd  xmm3,QWORD PTR [rsi+rdi*8+0x30]
   0x000000000009a30b <+1051>:  movaps xmm13,xmm10
   0x000000000009a30f <+1055>:  mulsd  xmm11,xmm3
   0x000000000009a314 <+1060>:  addsd  xmm13,xmm9
   0x000000000009a319 <+1065>:  addsd  xmm8,xmm7
   0x000000000009a31e <+1070>:  mulsd  xmm3,xmm2
   0x000000000009a322 <+1074>:  addsd  xmm12,xmm11
   0x000000000009a327 <+1079>:  subsd  xmm10,xmm13
   0x000000000009a32c <+1084>:  addsd  xmm0,xmm8
   0x000000000009a331 <+1089>:  addsd  xmm10,xmm9
   0x000000000009a336 <+1094>:  movsd  xmm15,QWORD PTR [rsi+rdi*8+0x38]
   0x000000000009a33d <+1101>:  movaps xmm4,xmm13
   0x000000000009a341 <+1105>:  mulsd  xmm14,xmm15
   0x000000000009a346 <+1110>:  addsd  xmm4,xmm12
   0x000000000009a34b <+1115>:  addsd  xmm0,xmm10
   0x000000000009a350 <+1120>:  mulsd  xmm2,xmm15
   0x000000000009a355 <+1125>:  addsd  xmm3,xmm14
   0x000000000009a35a <+1130>:  subsd  xmm13,xmm4
   0x000000000009a35f <+1135>:  movaps xmm5,xmm4
   0x000000000009a362 <+1138>:  addsd  xmm13,xmm12
   0x000000000009a367 <+1143>:  addsd  xmm5,xmm3
   0x000000000009a36b <+1147>:  addsd  xmm0,xmm13
   0x000000000009a370 <+1152>:  subsd  xmm4,xmm5
   0x000000000009a374 <+1156>:  addsd  xmm4,xmm3
   0x000000000009a378 <+1160>:  movsd  xmm3,QWORD PTR [rsi+rdi*8+0x40]
   0x000000000009a37e <+1166>:  mulsd  xmm1,xmm3
   0x000000000009a382 <+1170>:  addsd  xmm0,xmm4
   0x000000000009a386 <+1174>:  addsd  xmm2,xmm1
   0x000000000009a38a <+1178>:  movaps xmm3,xmm2
   0x000000000009a38d <+1181>:  movsd  xmm1,QWORD PTR [rip+0x1b2f5b]        # 0x24d2f0 <_TWO_26H>
   0x000000000009a395 <+1189>:  addsd  xmm3,xmm5
   0x000000000009a399 <+1193>:  mulsd  xmm1,xmm3
   0x000000000009a39d <+1197>:  addsd  xmm3,xmm1
   0x000000000009a3a1 <+1201>:  subsd  xmm3,xmm1
   0x000000000009a3a5 <+1205>:  subsd  xmm5,xmm3
   0x000000000009a3a9 <+1209>:  addsd  xmm5,xmm2
   0x000000000009a3ad <+1213>:  movsd  xmm2,QWORD PTR [rip+0x1b2f4b]        # 0x24d300 <_PI04_25x2>
   0x000000000009a3b5 <+1221>:  movaps xmm1,xmm2
   0x000000000009a3b8 <+1224>:  addsd  xmm0,xmm5
   0x000000000009a3bc <+1228>:  mulsd  xmm1,xmm0
   0x000000000009a3c0 <+1232>:  addsd  xmm0,xmm3
   0x000000000009a3c4 <+1236>:  mulsd  xmm3,xmm2
   0x000000000009a3c8 <+1240>:  mulsd  xmm0,QWORD PTR [rip+0x1b2f38]        # 0x24d308 <_PI04_25x2+8>
   0x000000000009a3d0 <+1248>:  addsd  xmm1,xmm0
   0x000000000009a3d4 <+1252>:  movaps xmm0,xmm1
   0x000000000009a3d7 <+1255>:  addsd  xmm0,xmm3
   0x000000000009a3db <+1259>:  subsd  xmm3,xmm0
   0x000000000009a3df <+1263>:  addsd  xmm3,xmm1
   0x000000000009a3e3 <+1267>:  movsd  xmm1,QWORD PTR [rdx+r8*8]
   0x000000000009a3e9 <+1273>:  mulsd  xmm0,xmm1
   0x000000000009a3ed <+1277>:  mulsd  xmm3,xmm1
   0x000000000009a3f1 <+1281>:  movsd  QWORD PTR [r9],xmm0
   0x000000000009a3f6 <+1286>:  movsd  QWORD PTR [r9+0x8],xmm3
   0x000000000009a3fc <+1292>:  ret    
   0x000000000009a3fd <+1293>:  nop    DWORD PTR [rax]
End of assembler dump.