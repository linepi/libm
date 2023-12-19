Dump of assembler code for function __libm_ccoshl_ex:
<+0>:	   endbr64 
<+4>:	   push   r12
<+6>:	   push   r13
<+8>:	   push   r14
<+10>:	push   r15
<+12>:	sub    rsp,0x118
<+19>:	xor    r15b,r15b
<+22>:	fld    TBYTE PTR [rip+0x1bda14]        # 0x291980
<+28>:	fstp   TBYTE PTR [rsp+0x100]
<+35>:	fld    TBYTE PTR [rsp+0x100]
<+42>:	fstp   TBYTE PTR [rsp+0xe0]
<+49>:	fld    TBYTE PTR [rsp+0xe0]
<+56>:	fstp   TBYTE PTR [rsp+0xf0]
<+63>:	fnstcw WORD PTR [rsp+0x112]
<+70>:	movzx  edx,WORD PTR [rsp+0x112]
<+78>:	mov    eax,edx
<+80>:	and    eax,0x300
<+85>:	cmp    eax,0x300
<+90>:	je     0xd3fc4 <__libm_ccoshl_ex+116>
<+92>:	or     edx,0xffff0300
<+98>:	mov    WORD PTR [rsp+0x110],dx
<+106>:	fldcw  WORD PTR [rsp+0x110]
<+113>:	mov    r15b,0x1
<+116>:	movzx  edx,WORD PTR [rsp+0x148]
<+124>:	and    edx,0x7fff
<+130>:	cmp    edx,0x7fff
<+136>:	jge    0xd4437 <__libm_ccoshl_ex+1255>
<+142>:	test   edx,edx
<+144>:	jle    0xd4627 <__libm_ccoshl_ex+1751>
<+150>:	movzx  eax,WORD PTR [rsp+0x158]
<+158>:	and    eax,0x7fff
<+163>:	cmp    eax,0x7fff
<+168>:	jge    0xd43fb <__libm_ccoshl_ex+1195>
<+174>:	test   eax,eax
<+176>:	jle    0xd4606 <__libm_ccoshl_ex+1718>
<+182>:	cmp    edx,0x400e
<+188>:	jl     0xd40c8 <__libm_ccoshl_ex+376>
<+194>:	fld    TBYTE PTR [rip+0x1bd998]        # 0x2919b0 <_CONSTANTS>
<+200>:	add    rsp,0xfffffffffffffff0
<+204>:	fld    TBYTE PTR [rsp+0x160]
<+211>:	fstp   TBYTE PTR [rsp]
<+214>:	fmul   st,st(0)
<+216>:	fstp   TBYTE PTR [rsp+0x10]
<+220>:	call   0x21d90 <__libm_cosl>
<+225>:	fld    TBYTE PTR [rsp+0x10]
<+229>:	add    rsp,0x10
<+233>:	fmul   st(1),st
<+235>:	fxch   st(1)
<+237>:	fstp   TBYTE PTR [rsp+0xe0]
<+244>:	fld    TBYTE PTR [rsp+0x140]
<+251>:	movzx  eax,WORD PTR [rsp+0x158]
<+259>:	fmulp  st(1),st
<+261>:	test   eax,0x7fff
<+266>:	jle    0xd408c <__libm_ccoshl_ex+316>
<+268>:	fstp   TBYTE PTR [rsp+0xf0]
<+275>:	add    rsp,0xfffffffffffffff0
<+279>:	fld    TBYTE PTR [rsp+0x160]
<+286>:	fstp   TBYTE PTR [rsp]
<+289>:	call   0x264c0 <__libm_sinl>
<+294>:	add    rsp,0x10
<+298>:	fld    TBYTE PTR [rsp+0xf0]
<+305>:	fmulp  st(1),st
<+307>:	fstp   TBYTE PTR [rsp+0xf0]
<+314>:	jmp    0xd409c <__libm_ccoshl_ex+332>
<+316>:	fld    TBYTE PTR [rsp+0x150]
<+323>:	fmulp  st(1),st
<+325>:	fstp   TBYTE PTR [rsp+0xf0]
<+332>:	test   r15b,r15b
<+335>:	je     0xd40a8 <__libm_ccoshl_ex+344>
<+337>:	fldcw  WORD PTR [rsp+0x112]
<+344>:	fld    TBYTE PTR [rsp+0xe0]
<+351>:	fld    TBYTE PTR [rsp+0xf0]
<+358>:	add    rsp,0x118
<+365>:	pop    r15
<+367>:	pop    r14
<+369>:	pop    r13
<+371>:	pop    r12
<+373>:	fxch   st(1)
<+375>:	ret    
<+376>:	add    rsp,0xfffffffffffffff0
<+380>:	fld    TBYTE PTR [rsp+0x150]
<+387>:	lea    rdi,[rsp+0x50]
<+392>:	fstp   TBYTE PTR [rsp]
<+395>:	call   0x8fdf0 <__libm_coshl_k80>
<+400>:	add    rsp,0x10
<+404>:	fld    TBYTE PTR [rip+0x1bd8f6]        # 0x2919e0 <_CONSTANTS+48>
<+410>:	movzx  eax,WORD PTR [rsp+0x148]
<+418>:	faddp  st(1),st
<+420>:	fstp   TBYTE PTR [rsp]
<+423>:	and    eax,0x7fff
<+428>:	fld    TBYTE PTR [rsp+0x40]
<+432>:	fld    st(0)
<+434>:	fld    TBYTE PTR [rsp+0x50]
<+438>:	mov    r14d,DWORD PTR [rsp]
<+442>:	fadd   st(1),st
<+444>:	fld    st(1)
<+446>:	fxch   st(2)
<+448>:	fsubr  st(3),st
<+450>:	fxch   st(3)
<+452>:	fsubp  st(1),st
<+454>:	fld    TBYTE PTR [rip+0x1bd874]        # 0x291990
<+460>:	fmul   st,st(3)
<+462>:	fsubr  st(2),st
<+464>:	fsubrp st(2),st
<+466>:	fxch   st(1)
<+468>:	fstp   TBYTE PTR [rsp+0xa0]
<+475>:	fld    TBYTE PTR [rsp+0xa0]
<+482>:	fsubp  st(2),st
<+484>:	faddp  st(1),st
<+486>:	cmp    eax,0x3f37
<+491>:	jge    0xd4181 <__libm_ccoshl_ex+561>
<+493>:	fld    TBYTE PTR [rsp+0x140]
<+500>:	lea    rdx,[rsp+0x70]
<+505>:	fld    TBYTE PTR [rip+0x1bd881]        # 0x2919d0 <_CONSTANTS+32>
<+511>:	fmulp  st(1),st
<+513>:	fstp   TBYTE PTR [rdx-0x10]
<+516>:	fld    TBYTE PTR [rdx+0x90]
<+522>:	movzx  eax,WORD PTR [rdx-0x8]
<+526>:	mov    r13d,eax
<+529>:	and    eax,0xffff8000
<+534>:	and    r13d,0x7fff
<+541>:	add    eax,0x3fff
<+546>:	add    r13d,0xffffbf01
<+553>:	fstp   TBYTE PTR [rdx]
<+555>:	mov    WORD PTR [rdx-0x8],ax
<+559>:	jmp    0xd41bd <__libm_ccoshl_ex+621>
<+561>:	add    rsp,0xfffffffffffffff0
<+565>:	fld    TBYTE PTR [rsp+0x150]
<+572>:	lea    rdi,[rsp+0x70]
<+577>:	fstp   TBYTE PTR [rsp]
<+580>:	fstp   TBYTE PTR [rdi+0x70]
<+583>:	call   0x9d570 <__libm_sinhl_k80>
<+588>:	fld    TBYTE PTR [rsp+0xe0]
<+595>:	add    rsp,0x10
<+599>:	fld    TBYTE PTR [rip+0x1bd833]        # 0x2919e0 <_CONSTANTS+48>
<+605>:	lea    rdx,[rsp+0x70]
<+610>:	faddp  st(2),st
<+612>:	fxch   st(1)
<+614>:	fstp   TBYTE PTR [rsp]
<+617>:	mov    r13d,DWORD PTR [rsp]
<+621>:	fld    TBYTE PTR [rsp+0x60]
<+625>:	fld    st(0)
<+627>:	fld    TBYTE PTR [rdx]
<+629>:	fadd   st(1),st
<+631>:	fld    st(1)
<+633>:	fxch   st(2)
<+635>:	fsubr  st(3),st
<+637>:	fxch   st(3)
<+639>:	fsubp  st(1),st
<+641>:	fld    TBYTE PTR [rip+0x1bd7b9]        # 0x291990
<+647>:	fmul   st,st(3)
<+649>:	fsubr  st(2),st
<+651>:	fsubrp st(2),st
<+653>:	fxch   st(1)
<+655>:	fstp   TBYTE PTR [rsp+0xb0]
<+662>:	fld    TBYTE PTR [rsp+0xb0]
<+669>:	add    rsp,0xfffffffffffffff0
<+673>:	fsubp  st(2),st
<+675>:	faddp  st(1),st
<+677>:	fld    TBYTE PTR [rsp+0x160]
<+684>:	fstp   TBYTE PTR [rsp]
<+687>:	lea    rdi,[rsp+0x90]
<+695>:	fxch   st(1)
<+697>:	fstp   TBYTE PTR [rdi+0x50]
<+700>:	fstp   TBYTE PTR [rdi+0x40]
<+703>:	call   0x90230 <__libm_cosl_k80>
<+708>:	fld    TBYTE PTR [rsp+0xd0]
<+715>:	fld    TBYTE PTR [rsp+0xe0]
<+722>:	add    rsp,0x10
<+726>:	fld    TBYTE PTR [rsp+0x80]
<+733>:	fld    st(0)
<+735>:	fld    TBYTE PTR [rsp+0x90]
<+742>:	movzx  eax,WORD PTR [rsp+0x158]
<+750>:	fadd   st(1),st
<+752>:	fld    st(1)
<+754>:	and    eax,0x7fff
<+759>:	fxch   st(2)
<+761>:	fsubr  st(3),st
<+763>:	fxch   st(3)
<+765>:	fsubp  st(1),st
<+767>:	fld    TBYTE PTR [rip+0x1bd73b]        # 0x291990
<+773>:	fmul   st,st(3)
<+775>:	fsubr  st(2),st
<+777>:	fsubrp st(2),st
<+779>:	fxch   st(1)
<+781>:	fsub   st(2),st
<+783>:	fxch   st(1)
<+785>:	faddp  st(2),st
<+787>:	fmul   st,st(4)
<+789>:	fxch   st(1)
<+791>:	fmulp  st(4),st
<+793>:	fld    TBYTE PTR [rip+0x1bd751]        # 0x2919c0 <_CONSTANTS+16>
<+799>:	faddp  st(1),st
<+801>:	cmp    eax,0x3f37
<+806>:	jge    0xd42c1 <__libm_ccoshl_ex+881>
<+808>:	fld    TBYTE PTR [rsp+0x150]
<+815>:	fld    TBYTE PTR [rip+0x1bd74b]        # 0x2919d0 <_CONSTANTS+32>
<+821>:	fmulp  st(1),st
<+823>:	fstp   TBYTE PTR [rsp+0x20]
<+827>:	fld    TBYTE PTR [rsp+0x100]
<+834>:	movzx  eax,WORD PTR [rsp+0x28]
<+839>:	mov    r12d,eax
<+842>:	and    eax,0xffff8000
<+847>:	and    r12d,0x7fff
<+854>:	add    eax,0x3fff
<+859>:	add    r12d,0xffffbf01
<+866>:	mov    WORD PTR [rsp+0x28],ax
<+871>:	fstp   TBYTE PTR [rsp+0x30]
<+875>:	fld    TBYTE PTR [rsp+0x20]
<+879>:	jmp    0xd433d <__libm_ccoshl_ex+1005>
<+881>:	add    rsp,0xfffffffffffffff0
<+885>:	fld    TBYTE PTR [rsp+0x160]
<+892>:	lea    rdi,[rsp+0x30]
<+897>:	fstp   TBYTE PTR [rsp]
<+900>:	fxch   st(3)
<+902>:	fstp   TBYTE PTR [rsp+0x10]
<+906>:	fstp   TBYTE PTR [rdi+0xb0]
<+912>:	fxch   st(1)
<+914>:	fstp   TBYTE PTR [rdi-0x10]
<+917>:	fstp   TBYTE PTR [rdi+0xa0]
<+923>:	call   0x9d9b0 <__libm_sinl_k80>
<+928>:	fld    TBYTE PTR [rsp+0xd0]
<+935>:	fld    TBYTE PTR [rsp+0x20]
<+939>:	fld    TBYTE PTR [rsp+0xe0]
<+946>:	fld    TBYTE PTR [rsp+0x10]
<+950>:	add    rsp,0x10
<+954>:	fld    TBYTE PTR [rsp+0x20]
<+958>:	xor    r12d,r12d
<+961>:	fmul   st,st(5)
<+963>:	fstp   TBYTE PTR [rsp+0x20]
<+967>:	fld    TBYTE PTR [rsp+0x20]
<+971>:	fld    TBYTE PTR [rsp+0x30]
<+975>:	fmulp  st(6),st
<+977>:	fxch   st(5)
<+979>:	fstp   TBYTE PTR [rsp+0x100]
<+986>:	fld    TBYTE PTR [rsp+0x100]
<+993>:	fstp   TBYTE PTR [rsp+0x30]
<+997>:	fxch   st(4)
<+999>:	fxch   st(2)
<+1001>:	fxch   st(1)
<+1003>:	fxch   st(2)
<+1005>:	fld    TBYTE PTR [rsp+0x100]
<+1012>:	fld    st(1)
<+1014>:	mov    edi,r14d
<+1017>:	fadd   st,st(1)
<+1019>:	fsubr  st(2),st
<+1021>:	fxch   st(2)
<+1023>:	fsubp  st(1),st
<+1025>:	fld    st(1)
<+1027>:	fld    TBYTE PTR [rip+0x1bd637]        # 0x291990
<+1033>:	fmul   st,st(3)
<+1035>:	fsubr  st(1),st
<+1037>:	fsubrp st(1),st
<+1039>:	fstp   TBYTE PTR [rsp]
<+1042>:	fld    TBYTE PTR [rsp]
<+1045>:	fsubp  st(2),st
<+1047>:	faddp  st(1),st
<+1049>:	fld    st(2)
<+1051>:	fmul   st,st(5)
<+1053>:	fld    TBYTE PTR [rsp+0xa0]
<+1060>:	add    rsp,0xffffffffffffffe0
<+1064>:	fld    st(0)
<+1066>:	fmul   st,st(4)
<+1068>:	fstp   TBYTE PTR [rsp]
<+1071>:	fmulp  st(6),st
<+1073>:	faddp  st(5),st
<+1075>:	fxch   st(2)
<+1077>:	fmulp  st(1),st
<+1079>:	faddp  st(3),st
<+1081>:	fxch   st(2)
<+1083>:	fstp   TBYTE PTR [rsp+0x10]
<+1087>:	fxch   st(1)
<+1089>:	fstp   TBYTE PTR [rsp+0x30]
<+1093>:	fstp   TBYTE PTR [rsp+0xe0]
<+1100>:	call   0x9bda0 <__libm_scalbl_k80>
<+1105>:	fld    TBYTE PTR [rsp+0xe0]
<+1112>:	fld    TBYTE PTR [rsp+0x30]
<+1116>:	add    rsp,0x20
<+1120>:	fld    TBYTE PTR [rsp]
<+1123>:	fld    st(2)
<+1125>:	fmul   st,st(2)
<+1127>:	add    r13d,r12d
<+1130>:	fxch   st(4)
<+1132>:	fstp   TBYTE PTR [rsp+0xe0]
<+1139>:	mov    edi,r13d
<+1142>:	fld    TBYTE PTR [rsp+0xb0]
<+1149>:	add    rsp,0xffffffffffffffe0
<+1153>:	fld    st(0)
<+1155>:	fmul   st,st(2)
<+1157>:	fstp   TBYTE PTR [rsp]
<+1160>:	fmulp  st(2),st
<+1162>:	fxch   st(1)
<+1164>:	faddp  st(3),st
<+1166>:	fmulp  st(1),st
<+1168>:	faddp  st(1),st
<+1170>:	fstp   TBYTE PTR [rsp+0x10]
<+1174>:	call   0x9bda0 <__libm_scalbl_k80>
<+1179>:	add    rsp,0x20
<+1183>:	fstp   TBYTE PTR [rsp+0xf0]
<+1190>:	jmp    0xd45da <__libm_ccoshl_ex+1674>
<+1195>:	cmp    QWORD PTR [rsp+0x150],0x0
<+1204>:	je     0xd455f <__libm_ccoshl_ex+1551>
<+1210>:	movzx  eax,WORD PTR [rsp+0x158]
<+1218>:	and    eax,0x7fff
<+1223>:	cmp    eax,0x7fff
<+1228>:	jl     0xd44de <__libm_ccoshl_ex+1422>
<+1234>:	add    rsp,0xfffffffffffffff0
<+1238>:	fld    TBYTE PTR [rsp+0x160]
<+1245>:	fstp   TBYTE PTR [rsp]
<+1248>:	call   0x21d90 <__libm_cosl>
<+1253>:	jmp    0xd4471 <__libm_ccoshl_ex+1313>
<+1255>:	cmp    QWORD PTR [rsp+0x150],0x0
<+1264>:	je     0xd455f <__libm_ccoshl_ex+1551>
<+1270>:	movzx  eax,WORD PTR [rsp+0x158]
<+1278>:	and    eax,0x7fff
<+1283>:	cmp    eax,0x7fff
<+1288>:	jl     0xd44de <__libm_ccoshl_ex+1422>
<+1294>:	add    rsp,0xfffffffffffffff0
<+1298>:	fld    TBYTE PTR [rsp+0x150]
<+1305>:	fstp   TBYTE PTR [rsp]
<+1308>:	call   0x21d50 <__libm_coshl>
<+1313>:	add    rsp,0x10
<+1317>:	fstp   TBYTE PTR [rsp+0xe0]
<+1324>:	cmp    DWORD PTR [rsp+0x144],0x0
<+1332>:	jne    0xd44bb <__libm_ccoshl_ex+1387>
<+1334>:	cmp    DWORD PTR [rsp+0x140],0x0
<+1342>:	jne    0xd44bb <__libm_ccoshl_ex+1387>
<+1344>:	movabs rax,0x8000000000000000
<+1354>:	cmp    rax,QWORD PTR [rsp+0x150]
<+1362>:	je     0xd4648 <__libm_ccoshl_ex+1784>
<+1368>:	fld    TBYTE PTR [rsp+0x100]
<+1375>:	fstp   TBYTE PTR [rsp+0xf0]
<+1382>:	jmp    0xd45da <__libm_ccoshl_ex+1674>
<+1387>:	add    rsp,0xfffffffffffffff0
<+1391>:	fld    TBYTE PTR [rsp+0x160]
<+1398>:	fstp   TBYTE PTR [rsp]
<+1401>:	call   0x264c0 <__libm_sinl>
<+1406>:	add    rsp,0x10
<+1410>:	fstp   TBYTE PTR [rsp+0xf0]
<+1417>:	jmp    0xd45da <__libm_ccoshl_ex+1674>
<+1422>:	add    rsp,0xfffffffffffffff0
<+1426>:	fld    TBYTE PTR [rsp+0x150]
<+1433>:	fstp   TBYTE PTR [rsp]
<+1436>:	call   0x21d50 <__libm_coshl>
<+1441>:	fstp   TBYTE PTR [rsp+0x10]
<+1445>:	fld    TBYTE PTR [rsp+0x160]
<+1452>:	fstp   TBYTE PTR [rsp]
<+1455>:	call   0x21d90 <__libm_cosl>
<+1460>:	add    rsp,0x10
<+1464>:	fld    TBYTE PTR [rsp]
<+1467>:	fmulp  st(1),st
<+1469>:	movzx  eax,WORD PTR [rsp+0x158]
<+1477>:	fstp   TBYTE PTR [rsp+0xe0]
<+1484>:	test   eax,0x7fff
<+1489>:	jle    0xd468a <__libm_ccoshl_ex+1850>
<+1495>:	add    rsp,0xfffffffffffffff0
<+1499>:	fld    TBYTE PTR [rsp+0x150]
<+1506>:	fstp   TBYTE PTR [rsp]
<+1509>:	call   0x26480 <__libm_sinhl>
<+1514>:	fstp   TBYTE PTR [rsp+0x10]
<+1518>:	fld    TBYTE PTR [rsp+0x160]
<+1525>:	fstp   TBYTE PTR [rsp]
<+1528>:	call   0x264c0 <__libm_sinl>
<+1533>:	add    rsp,0x10
<+1537>:	fld    TBYTE PTR [rsp]
<+1540>:	fmulp  st(1),st
<+1542>:	fstp   TBYTE PTR [rsp+0xf0]
<+1549>:	jmp    0xd45da <__libm_ccoshl_ex+1674>
<+1551>:	add    rsp,0xfffffffffffffff0
<+1555>:	fld    TBYTE PTR [rsp+0x150]
<+1562>:	fstp   TBYTE PTR [rsp]
<+1565>:	call   0x21d50 <__libm_coshl>
<+1570>:	add    rsp,0x10
<+1574>:	movzx  eax,WORD PTR [rsp+0x148]
<+1582>:	fstp   TBYTE PTR [rsp+0xe0]
<+1589>:	and    eax,0x7fff
<+1594>:	fld    TBYTE PTR [rsp+0x150]
<+1601>:	fstp   TBYTE PTR [rsp+0xf0]
<+1608>:	cmp    eax,0x7fff
<+1613>:	jl     0xd45b3 <__libm_ccoshl_ex+1635>
<+1615>:	movabs rax,0x8000000000000000
<+1625>:	cmp    rax,QWORD PTR [rsp+0x140]
<+1633>:	jne    0xd45da <__libm_ccoshl_ex+1674>
<+1635>:	mov    dl,BYTE PTR [rsp+0xf9]
<+1642>:	mov    cl,dl
<+1644>:	mov    al,BYTE PTR [rsp+0x149]
<+1651>:	and    cl,0x7f
<+1654>:	shr    dl,0x7
<+1657>:	shr    al,0x7
<+1660>:	xor    dl,al
<+1662>:	shl    dl,0x7
<+1665>:	or     cl,dl
<+1667>:	mov    BYTE PTR [rsp+0xf9],cl
<+1674>:	test   r15b,r15b
<+1677>:	je     0xd45e6 <__libm_ccoshl_ex+1686>
<+1679>:	fldcw  WORD PTR [rsp+0x112]
<+1686>:	fld    TBYTE PTR [rsp+0xe0]
<+1693>:	fld    TBYTE PTR [rsp+0xf0]
<+1700>:	add    rsp,0x118
<+1707>:	pop    r15
<+1709>:	pop    r14
<+1711>:	pop    r13
<+1713>:	pop    r12
<+1715>:	fxch   st(1)
<+1717>:	ret    
<+1718>:	cmp    DWORD PTR [rsp+0x154],0x0
<+1726>:	jne    0xd4006 <__libm_ccoshl_ex+182>
<+1732>:	cmp    DWORD PTR [rsp+0x150],0x0
<+1740>:	jne    0xd4006 <__libm_ccoshl_ex+182>
<+1746>:	jmp    0xd43fb <__libm_ccoshl_ex+1195>
<+1751>:	cmp    DWORD PTR [rsp+0x144],0x0
<+1759>:	jne    0xd3fe6 <__libm_ccoshl_ex+150>
<+1765>:	cmp    DWORD PTR [rsp+0x140],0x0
<+1773>:	jne    0xd3fe6 <__libm_ccoshl_ex+150>
<+1779>:	jmp    0xd43fb <__libm_ccoshl_ex+1195>
<+1784>:	mov    dl,BYTE PTR [rsp+0x149]
<+1791>:	lea    rcx,[rip+0x1bd34a]        # 0x2919a0 <ones>
<+1798>:	mov    al,BYTE PTR [rsp+0x159]
<+1805>:	and    dl,0x80
<+1808>:	and    al,0x80
<+1810>:	pxor   xmm0,xmm0
<+1814>:	shr    dl,0x7
<+1817>:	shr    al,0x7
<+1820>:	xor    dl,al
<+1822>:	movzx  esi,dl
<+1825>:	mulsd  xmm0,QWORD PTR [rcx+rsi*8]
<+1830>:	movsd  QWORD PTR [rsp],xmm0
<+1835>:	fld    QWORD PTR [rsp]
<+1838>:	fstp   TBYTE PTR [rsp+0xf0]
<+1845>:	jmp    0xd45da <__libm_ccoshl_ex+1674>
<+1850>:	add    rsp,0xfffffffffffffff0
<+1854>:	fld    TBYTE PTR [rsp+0x150]
<+1861>:	fstp   TBYTE PTR [rsp]
<+1864>:	call   0x26480 <__libm_sinhl>
<+1869>:	add    rsp,0x10
<+1873>:	fld    TBYTE PTR [rsp+0x150]
<+1880>:	fmulp  st(1),st
<+1882>:	fstp   TBYTE PTR [rsp+0xf0]
<+1889>:	jmp    0xd45da <__libm_ccoshl_ex+1674>
<+1894>:	nop    DWORD PTR [rax]
<+1897>:	nop    DWORD PTR [rax+0x0]
End of assembler dump.
