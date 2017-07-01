Dump of assembler code for function main:
   0x0804859b <+0>:	lea    ecx,[esp+0x4]
   0x0804859f <+4>:	and    esp,0xfffffff0
   0x080485a2 <+7>:	push   DWORD PTR [ecx-0x4]
   0x080485a5 <+10>:	push   ebp
   0x080485a6 <+11>:	mov    ebp,esp
   0x080485a8 <+13>:	push   edi
   0x080485a9 <+14>:	push   ecx
   0x080485aa <+15>:	add    esp,0xffffff80
   0x080485ad <+18>:	mov    eax,gs:0x14
   0x080485b3 <+24>:	mov    DWORD PTR [ebp-0xc],eax
   0x080485b6 <+27>:	xor    eax,eax
   0x080485b8 <+29>:	lea    eax,[ebp-0x70]
   0x080485bb <+32>:	mov    DWORD PTR [ebp-0x84],eax
   0x080485c1 <+38>:	mov    eax,ds:0x804a034
   0x080485c6 <+43>:	sub    esp,0x8
   0x080485c9 <+46>:	push   0x0
   0x080485cb <+48>:	push   eax
   0x080485cc <+49>:	call   0x8048410 <setbuf@plt>
   0x080485d1 <+54>:	add    esp,0x10
   0x080485d4 <+57>:	lea    eax,[ebp-0x70]
   0x080485d7 <+60>:	mov    DWORD PTR [eax],0x6e69622f
   0x080485dd <+66>:	mov    DWORD PTR [eax+0x4],0x20736c2f
   0x080485e4 <+73>:	mov    BYTE PTR [eax+0x8],0x0
   0x080485e8 <+77>:	sub    esp,0xc
   0x080485eb <+80>:	push   0x8048840
   0x080485f0 <+85>:	call   0x8048440 <puts@plt>
   0x080485f5 <+90>:	add    esp,0x10
   0x080485f8 <+93>:	sub    esp,0xc
   0x080485fb <+96>:	push   0x8048880
   0x08048600 <+101>:	call   0x8048440 <puts@plt>
   0x08048605 <+106>:	add    esp,0x10
   0x08048608 <+109>:	sub    esp,0xc
   0x0804860b <+112>:	push   0x8048840
   0x08048610 <+117>:	call   0x8048440 <puts@plt>
   0x08048615 <+122>:	add    esp,0x10
   0x08048618 <+125>:	sub    esp,0xc
   0x0804861b <+128>:	push   0x80488a7
   0x08048620 <+133>:	call   0x8048420 <printf@plt>
   0x08048625 <+138>:	add    esp,0x10
   0x08048628 <+141>:	sub    esp,0x8
   0x0804862b <+144>:	lea    eax,[ebp-0x80]
   0x0804862e <+147>:	push   eax
   0x0804862f <+148>:	push   0x80488b4
   0x08048634 <+153>:	call   0x8048480 <__isoc99_scanf@plt>
   0x08048639 <+158>:	add    esp,0x10
   0x0804863c <+161>:	sub    esp,0xc
   0x0804863f <+164>:	lea    eax,[ebp-0x70]
   0x08048642 <+167>:	push   eax
   0x08048643 <+168>:	call   0x8048460 <strlen@plt>
   0x08048648 <+173>:	add    esp,0x10
   0x0804864b <+176>:	add    DWORD PTR [ebp-0x84],eax
   0x08048651 <+182>:	mov    DWORD PTR [ebp-0x88],0x0
   0x0804865b <+192>:	jmp    0x8048728 <main+397>
   0x08048660 <+197>:	lea    edx,[ebp-0x80]
   0x08048663 <+200>:	mov    eax,DWORD PTR [ebp-0x88]
   0x08048669 <+206>:	add    eax,edx
   0x0804866b <+208>:	movzx  eax,BYTE PTR [eax]
   0x0804866e <+211>:	cmp    al,0x27
   0x08048670 <+213>:	je     0x80486f0 <main+341>
   0x08048672 <+215>:	lea    edx,[ebp-0x80]
   0x08048675 <+218>:	mov    eax,DWORD PTR [ebp-0x88]
   0x0804867b <+224>:	add    eax,edx
   0x0804867d <+226>:	movzx  eax,BYTE PTR [eax]
   0x08048680 <+229>:	cmp    al,0x22
   0x08048682 <+231>:	je     0x80486f0 <main+341>
   0x08048684 <+233>:	lea    edx,[ebp-0x80]
   0x08048687 <+236>:	mov    eax,DWORD PTR [ebp-0x88]
   0x0804868d <+242>:	add    eax,edx
   0x0804868f <+244>:	movzx  eax,BYTE PTR [eax]
   0x08048692 <+247>:	cmp    al,0x60
   0x08048694 <+249>:	je     0x80486f0 <main+341>
   0x08048696 <+251>:	lea    edx,[ebp-0x80]
   0x08048699 <+254>:	mov    eax,DWORD PTR [ebp-0x88]
   0x0804869f <+260>:	add    eax,edx
   0x080486a1 <+262>:	movzx  eax,BYTE PTR [eax]
   0x080486a4 <+265>:	cmp    al,0x24
   0x080486a6 <+267>:	je     0x80486f0 <main+341>
   0x080486a8 <+269>:	lea    edx,[ebp-0x80]
   0x080486ab <+272>:	mov    eax,DWORD PTR [ebp-0x88]
   0x080486b1 <+278>:	add    eax,edx
   0x080486b3 <+280>:	movzx  eax,BYTE PTR [eax]
   0x080486b6 <+283>:	cmp    al,0x3b
   0x080486b8 <+285>:	je     0x80486f0 <main+341>
   0x080486ba <+287>:	lea    edx,[ebp-0x80]
   0x080486bd <+290>:	mov    eax,DWORD PTR [ebp-0x88]
   0x080486c3 <+296>:	add    eax,edx
   0x080486c5 <+298>:	movzx  eax,BYTE PTR [eax]
   0x080486c8 <+301>:	cmp    al,0x7c
   0x080486ca <+303>:	je     0x80486f0 <main+341>
   0x080486cc <+305>:	lea    edx,[ebp-0x80]
   0x080486cf <+308>:	mov    eax,DWORD PTR [ebp-0x88]
   0x080486d5 <+314>:	add    eax,edx
   0x080486d7 <+316>:	movzx  eax,BYTE PTR [eax]
   0x080486da <+319>:	cmp    al,0x3c
   0x080486dc <+321>:	je     0x80486f0 <main+341>
   0x080486de <+323>:	lea    edx,[ebp-0x80]
   0x080486e1 <+326>:	mov    eax,DWORD PTR [ebp-0x88]
   0x080486e7 <+332>:	add    eax,edx
   0x080486e9 <+334>:	movzx  eax,BYTE PTR [eax]
   0x080486ec <+337>:	cmp    al,0x3e
   0x080486ee <+339>:	jne    0x8048702 <main+359>
   0x080486f0 <+341>:	mov    eax,DWORD PTR [ebp-0x84]
   0x080486f6 <+347>:	lea    edx,[eax+0x1]
   0x080486f9 <+350>:	mov    DWORD PTR [ebp-0x84],edx
   0x080486ff <+356>:	mov    BYTE PTR [eax],0x5c
   0x08048702 <+359>:	mov    eax,DWORD PTR [ebp-0x84]
   0x08048708 <+365>:	lea    edx,[eax+0x1]
   0x0804870b <+368>:	mov    DWORD PTR [ebp-0x84],edx
   0x08048711 <+374>:	lea    ecx,[ebp-0x80]
   0x08048714 <+377>:	mov    edx,DWORD PTR [ebp-0x88]
   0x0804871a <+383>:	add    edx,ecx
   0x0804871c <+385>:	movzx  edx,BYTE PTR [edx]
   0x0804871f <+388>:	mov    BYTE PTR [eax],dl
   0x08048721 <+390>:	add    DWORD PTR [ebp-0x88],0x1
   0x08048728 <+397>:	mov    eax,DWORD PTR [ebp-0x88]
   0x0804872e <+403>:	cmp    eax,0xf
   0x08048731 <+406>:	ja     0x8048749 <main+430>
   0x08048733 <+408>:	lea    edx,[ebp-0x80]
   0x08048736 <+411>:	mov    eax,DWORD PTR [ebp-0x88]
   0x0804873c <+417>:	add    eax,edx
   0x0804873e <+419>:	movzx  eax,BYTE PTR [eax]
   0x08048741 <+422>:	test   al,al
   0x08048743 <+424>:	jne    0x8048660 <main+197>
   0x08048749 <+430>:	mov    eax,DWORD PTR [ebp-0x84]
   0x0804874f <+436>:	mov    BYTE PTR [eax],0x0
   0x08048752 <+439>:	lea    eax,[ebp-0x70]
   0x08048755 <+442>:	mov    ecx,0xffffffff
   0x0804875a <+447>:	mov    edx,eax
   0x0804875c <+449>:	mov    eax,0x0
   0x08048761 <+454>:	mov    edi,edx
   0x08048763 <+456>:	repnz scas al,BYTE PTR es:[edi]
   0x08048765 <+458>:	mov    eax,ecx
   0x08048767 <+460>:	not    eax
   0x08048769 <+462>:	lea    edx,[eax-0x1]
   0x0804876c <+465>:	lea    eax,[ebp-0x70]
   0x0804876f <+468>:	add    eax,edx
   0x08048771 <+470>:	mov    DWORD PTR [eax],0x203e3220
   0x08048777 <+476>:	mov    DWORD PTR [eax+0x4],0x7665642f
   0x0804877e <+483>:	mov    DWORD PTR [eax+0x8],0x6c756e2f
   0x08048785 <+490>:	mov    WORD PTR [eax+0xc],0x6c
   0x0804878b <+496>:	sub    esp,0xc
   0x0804878e <+499>:	lea    eax,[ebp-0x70]
   0x08048791 <+502>:	push   eax
   0x08048792 <+503>:	call   0x8048450 <system@plt>
   0x08048797 <+508>:	add    esp,0x10
   0x0804879a <+511>:	mov    eax,0x0
   0x0804879f <+516>:	mov    edi,DWORD PTR [ebp-0xc]
   0x080487a2 <+519>:	xor    edi,DWORD PTR gs:0x14
   0x080487a9 <+526>:	je     0x80487b0 <main+533>
   0x080487ab <+528>:	call   0x8048430 <__stack_chk_fail@plt>
   0x080487b0 <+533>:	lea    esp,[ebp-0x8]
   0x080487b3 <+536>:	pop    ecx
   0x080487b4 <+537>:	pop    edi
   0x080487b5 <+538>:	pop    ebp
   0x080487b6 <+539>:	lea    esp,[ecx-0x4]
   0x080487b9 <+542>:	ret    
End of assembler dump.
