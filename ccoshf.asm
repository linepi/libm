Dump of assembler code for function __libm_ccoshf_ex:
<+0>:	endbr64 
<+4>:	sub    rsp,0x18
<+8>:	cvtps2pd xmm1,xmm0
<+11>:	movaps xmm0,xmm1
<+14>:	unpckhpd xmm1,xmm1
<+18>:	call   0x21260 <__libm_ccosh>
<+23>:	unpcklpd xmm0,xmm1
<+27>:	cvtpd2ps xmm0,xmm0
<+31>:	movsd  QWORD PTR [rsp+0x4],xmm0
<+37>:	movzx  eax,WORD PTR [rsp+0x6]
<+42>:	test   eax,0x7f80
<+47>:	jne    0xc8e9b <__libm_ccoshf_ex+59>
<+49>:	test   DWORD PTR [rsp+0x4],0x7fffff
<+57>:	jne    0xc8eb1 <__libm_ccoshf_ex+81>
<+59>:	movzx  eax,WORD PTR [rsp+0xa]
<+64>:	test   eax,0x7f80
<+69>:	jne    0xc8ed1 <__libm_ccoshf_ex+113>
<+71>:	test   DWORD PTR [rsp+0x8],0x7fffff
<+79>:	je     0xc8ed1 <__libm_ccoshf_ex+113>
<+81>:	mov    DWORD PTR [rsp],0x800000
<+88>:	movss  xmm1,DWORD PTR [rsp]
<+93>:	movss  xmm0,DWORD PTR [rsp]
<+98>:	mulss  xmm1,xmm0
<+102>:	movsd  xmm0,QWORD PTR [rsp+0x4]
<+108>:	movss  DWORD PTR [rsp],xmm1
<+113>:	add    rsp,0x18
<+117>:	ret    
<+118>:	nop    DWORD PTR [rax]
<+121>:	nop    DWORD PTR [rax+0x0]
End of assembler dump.
