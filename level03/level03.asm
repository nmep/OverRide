decrypt:
      <+0>:	      push   ebp
      <+1>:	      mov    ebp,esp
      <+3>:	      push   edi
      <+4>:	      push   esi
      <+5>:	      sub    esp,0x40
      <+8>:	      mov    eax,gs:0x14
      <+14>:	mov    DWORD PTR [ebp-0xc],eax
      <+17>:	xor    eax,eax
      <+19>:	mov    DWORD PTR [ebp-0x1d],0x757c7d51
      <+26>:	mov    DWORD PTR [ebp-0x19],0x67667360
      <+33>:	mov    DWORD PTR [ebp-0x15],0x7b66737e
      <+40>:	mov    DWORD PTR [ebp-0x11],0x33617c7d
      <+47>:	mov    BYTE PTR [ebp-0xd],0x0
      <+51>:	push   eax  
      <+52>:	xor    eax, eax
      <+54>:	je     0x804869b <decrypt+59>
      <+56>:	add    esp, 0x4
      <+59>:	pop    eax
      <+60>:	lea    eax,[ebp-0x1d]
      <+63>:	mov    DWORD PTR [ebp-0x2c],0xffffffff
      <+70>:	mov    edx,eax
      <+72>:	mov    eax,0x0
      <+77>:	mov    ecx,DWORD PTR [ebp-0x2c]
      <+80>:	mov    edi,edx
      <+82>:	repnz scas al,BYTE PTR es:[edi]
      <+84>:	mov    eax,ecx
      <+86>:	not    eax
      <+88>:	sub    eax,0x1
      <+91>:	mov    DWORD PTR [ebp-0x24],eax
      <+94>:	mov    DWORD PTR [ebp-0x28],0x0
      <+101>:	jmp    0x80486e5 <decrypt+133>
      <+103>:	lea    eax,[ebp-0x1d]
      <+106>:	add    eax,DWORD PTR [ebp-0x28]
      <+109>:	movzx  eax,BYTE PTR [eax]
      <+112>:	mov    edx,eax
      <+114>:	mov    eax,DWORD PTR [ebp+0x8]
      <+117>:	xor    eax,edx
      <+119>:	mov    edx,eax
      <+121>:	lea    eax,[ebp-0x1d]
      <+124>:	add    eax,DWORD PTR [ebp-0x28]
      <+127>:	mov    BYTE PTR [eax],dl
      <+129>:	add    DWORD PTR [ebp-0x28],0x1
      <+133>:	mov    eax,DWORD PTR [ebp-0x28]
      <+136>:	cmp    eax,DWORD PTR [ebp-0x24]
      <+139>:	jb     0x80486c7 <decrypt+103>
      <+141>:	lea    eax,[ebp-0x1d]
      <+144>:	mov    edx,eax
      <+146>:	mov    eax,0x80489c3
      <+151>:	mov    ecx,0x11
      <+156>:	mov    esi,edx
      <+158>:	mov    edi,eax
      <+160>:	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
      <+162>:	seta   dl
      <+165>:	setb   al
      <+168>:	mov    ecx,edx
      <+170>:	sub    cl,al
      <+172>:	mov    eax,ecx
      <+174>:	movsx  eax,al
      <+177>:	test   eax,eax
      <+179>:	jne    0x8048723 <decrypt+195>
      <+181>:	mov    DWORD PTR [esp],0x80489d4
      <+188>:	call   0x80484e0 <system@plt>
      <+193>:	jmp    0x804872f <decrypt+207>
      <+195>:	mov    DWORD PTR [esp],0x80489dc
      <+202>:	call   0x80484d0 <puts@plt>
      <+207>:	mov    esi,DWORD PTR [ebp-0xc]
      <+210>:	xor    esi,DWORD PTR gs:0x14
      <+217>:	je     0x8048740 <decrypt+224>
      <+219>:	call   0x80484c0 <__stack_chk_fail@plt>
      <+224>:	add    esp,0x40
      <+227>:	pop    esi
      <+228>:	pop    edi
      <+229>:	pop    ebp
      <+230>:	ret  


test:
	<+0>:	      push   ebp
      <+1>:	      mov    ebp,esp
      <+3>:	      sub    esp,0x28

      <+6>:	      mov    eax,DWORD PTR [ebp+0x8]; variable
      <+9>:	      mov    edx,DWORD PTR [ebp+0xc]; 0x1337d00d
      <+12>:	mov    ecx,edx
      <+14>:	sub    ecx,eax; 0x1337d00d - variable
      <+16>:	mov    eax,ecx
      <+18>:	mov    DWORD PTR [ebp-0xc],eax; res = 0x1337d00d - variable

      <+21>:	cmp    DWORD PTR [ebp-0xc], 0x15
      <+25>:	ja     0x804884a <test+259>

      <+31>:	mov    eax,DWORD PTR [ebp-0xc]
      <+34>:	shl    eax,0x2; res << 2
      <+37>:	add    eax,0x80489f0; res + 0x80489f0
      <+42>:	mov    eax,DWORD PTR [eax]; *0x80489f0
      <+44>:	jmp    eax; jmp dans la fonction voir avec gdb
      <+46>:	mov    eax,DWORD PTR [ebp-0xc]; res
      <+49>:	mov    DWORD PTR [esp],eax
      <+52>:	call   0x8048660 <decrypt>; decrypt(res)

      <+57>:	jmp    0x8048858 <test+273>
      <+62>:	mov    eax,DWORD PTR [ebp-0xc]
      <+65>:	mov    DWORD PTR [esp],eax
      <+68>:	call   0x8048660 <decrypt>

      <+73>:	jmp    0x8048858 <test+273>
      <+78>:	mov    eax,DWORD PTR [ebp-0xc]
      <+81>:	mov    DWORD PTR [esp],eax
      <+84>:	call   0x8048660 <decrypt>

      <+89>:	jmp    0x8048858 <test+273>
      <+94>:	mov    eax,DWORD PTR [ebp-0xc]
      <+97>:	mov    DWORD PTR [esp],eax
      <+100>:	call   0x8048660 <decrypt>

      <+105>:	jmp    0x8048858 <test+273>
      <+110>:	mov    eax,DWORD PTR [ebp-0xc]
      <+113>:	mov    DWORD PTR [esp],eax
      <+116>:	call   0x8048660 <decrypt>

      <+121>:	jmp    0x8048858 <test+273>
      <+126>:	mov    eax,DWORD PTR [ebp-0xc]
      <+129>:	mov    DWORD PTR [esp],eax
      <+132>:	call   0x8048660 <decrypt>

      <+137>:	jmp    0x8048858 <test+273>
      <+142>:	mov    eax,DWORD PTR [ebp-0xc]
      <+145>:	mov    DWORD PTR [esp],eax
      <+148>:	call   0x8048660 <decrypt>

      <+153>:	jmp    0x8048858 <test+273>
      <+155>:	mov    eax,DWORD PTR [ebp-0xc]
      <+158>:	mov    DWORD PTR [esp],eax
      <+161>:	call   0x8048660 <decrypt>

      <+166>:	jmp    0x8048858 <test+273>
      <+168>:	mov    eax,DWORD PTR [ebp-0xc]
      <+171>:	mov    DWORD PTR [esp],eax
      <+174>:	call   0x8048660 <decrypt>

      <+179>:	jmp    0x8048858 <test+273>
      <+181>:	mov    eax,DWORD PTR [ebp-0xc]
      <+184>:	mov    DWORD PTR [esp],eax
      <+187>:	call   0x8048660 <decrypt>

      <+192>:	jmp    0x8048858 <test+273>
      <+194>:	mov    eax,DWORD PTR [ebp-0xc]
      <+197>:	mov    DWORD PTR [esp],eax
      <+200>:	call   0x8048660 <decrypt>

      <+205>:	jmp    0x8048858 <test+273>
      <+207>:	mov    eax,DWORD PTR [ebp-0xc]
      <+210>:	mov    DWORD PTR [esp],eax
      <+213>:	call   0x8048660 <decrypt>

      <+218>:	jmp    0x8048858 <test+273>
      <+220>:	mov    eax,DWORD PTR [ebp-0xc]
      <+223>:	mov    DWORD PTR [esp],eax
      <+226>:	call   0x8048660 <decrypt>

      <+231>:	jmp    0x8048858 <test+273>
      <+233>:	mov    eax,DWORD PTR [ebp-0xc]
      <+236>:	mov    DWORD PTR [esp],eax
      <+239>:	call   0x8048660 <decrypt>

      <+244>:	jmp    0x8048858 <test+273>
      <+246>:	mov    eax,DWORD PTR [ebp-0xc]
      <+249>:	mov    DWORD PTR [esp],eax
      <+252>:	call   0x8048660 <decrypt>

      <+257>:	jmp    0x8048858 <test+273>
      <+259>:	call   0x8048520 <rand@plt>

      <+264>:	mov    DWORD PTR [esp],eax
      <+267>:	call   0x8048660 <decrypt>

      <+272>:	nop
      <+273>:	leave  
      <+274>:	ret  


main:
      <+0>:	      push   ebp
      <+1>:	      mov    ebp,esp
      <+3>:	      and    esp,0xfffffff0
      <+6>:	      sub    esp,0x20
      <+9>:	      push   eax

      <+10>:	xor    eax,eax
      <+12>:	je     0x804886b <main+17>
      <+14>:	add    esp,0x4
      <+17>:	pop    eax
      <+18>:	mov    DWORD PTR [esp],0x0
      <+25>:	call   0x80484b0 <time@plt>
      <+30>:	mov    DWORD PTR [esp],eax
      <+33>:	call   0x8048500 <srand@plt>; srand(time(0))

      <+38>:	mov    DWORD PTR [esp],0x8048a48
      <+45>:	call   0x80484d0 <puts@plt>; puts("*" * 35)

      <+50>:	mov    DWORD PTR [esp],0x8048a6c
      <+57>:	call   0x80484d0 <puts@plt>; puts("*\t\tlevel03\t\t**")

      <+62>:	mov    DWORD PTR [esp],0x8048a48
      <+69>:	call   0x80484d0 <puts@plt>; puts("*" * 35)

      <+74>:	mov    eax,0x8048a7b
      <+79>:	mov    DWORD PTR [esp],eax
      <+82>:	call   0x8048480 <printf@plt>; puts("Password:")

      <+87>:	mov    eax,0x8048a85; "%d"
      <+92>:	lea    edx,[esp+0x1c]; variable[28]
      <+96>:	mov    DWORD PTR [esp+0x4],edx;
      <+100>:	mov    DWORD PTR [esp],eax; "%d"
      <+103>:	call   0x8048530 <__isoc99_scanf@plt>; scanf(variable, "%d")

      <+108>:	mov    eax,DWORD PTR [esp+0x1c]
      <+112>:	mov    DWORD PTR [esp+0x4],0x1337d00d
      <+120>:	mov    DWORD PTR [esp],eax
      <+123>:	call   0x8048747 <test>; test(variable, 0x1337d00d);

      <+128>:	mov    eax,0x0
      <+133>:	leave
      <+134>:	ret
