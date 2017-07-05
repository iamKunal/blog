
doge:     file format elf32-i386


Disassembly of section .init:

08048530 <_init>:
 8048530:	53                   	push   ebx
 8048531:	83 ec 08             	sub    esp,0x8
 8048534:	e8 87 01 00 00       	call   80486c0 <__x86.get_pc_thunk.bx>
 8048539:	81 c3 c7 2a 00 00    	add    ebx,0x2ac7
 804853f:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 8048545:	85 c0                	test   eax,eax
 8048547:	74 05                	je     804854e <_init+0x1e>
 8048549:	e8 32 01 00 00       	call   8048680 <.plt.got>
 804854e:	83 c4 08             	add    esp,0x8
 8048551:	5b                   	pop    ebx
 8048552:	c3                   	ret    

Disassembly of section .plt:

08048560 <.plt>:
 8048560:	ff 35 04 b0 04 08    	push   DWORD PTR ds:0x804b004
 8048566:	ff 25 08 b0 04 08    	jmp    DWORD PTR ds:0x804b008
 804856c:	00 00                	add    BYTE PTR [eax],al
	...

08048570 <setbuf@plt>:
 8048570:	ff 25 0c b0 04 08    	jmp    DWORD PTR ds:0x804b00c
 8048576:	68 00 00 00 00       	push   0x0
 804857b:	e9 e0 ff ff ff       	jmp    8048560 <.plt>

08048580 <printf@plt>:
 8048580:	ff 25 10 b0 04 08    	jmp    DWORD PTR ds:0x804b010
 8048586:	68 08 00 00 00       	push   0x8
 804858b:	e9 d0 ff ff ff       	jmp    8048560 <.plt>

08048590 <getchar@plt>:
 8048590:	ff 25 14 b0 04 08    	jmp    DWORD PTR ds:0x804b014
 8048596:	68 10 00 00 00       	push   0x10
 804859b:	e9 c0 ff ff ff       	jmp    8048560 <.plt>

080485a0 <fgets@plt>:
 80485a0:	ff 25 18 b0 04 08    	jmp    DWORD PTR ds:0x804b018
 80485a6:	68 18 00 00 00       	push   0x18
 80485ab:	e9 b0 ff ff ff       	jmp    8048560 <.plt>

080485b0 <tolower@plt>:
 80485b0:	ff 25 1c b0 04 08    	jmp    DWORD PTR ds:0x804b01c
 80485b6:	68 20 00 00 00       	push   0x20
 80485bb:	e9 a0 ff ff ff       	jmp    8048560 <.plt>

080485c0 <isspace@plt>:
 80485c0:	ff 25 20 b0 04 08    	jmp    DWORD PTR ds:0x804b020
 80485c6:	68 28 00 00 00       	push   0x28
 80485cb:	e9 90 ff ff ff       	jmp    8048560 <.plt>

080485d0 <__stack_chk_fail@plt>:
 80485d0:	ff 25 24 b0 04 08    	jmp    DWORD PTR ds:0x804b024
 80485d6:	68 30 00 00 00       	push   0x30
 80485db:	e9 80 ff ff ff       	jmp    8048560 <.plt>

080485e0 <fwrite@plt>:
 80485e0:	ff 25 28 b0 04 08    	jmp    DWORD PTR ds:0x804b028
 80485e6:	68 38 00 00 00       	push   0x38
 80485eb:	e9 70 ff ff ff       	jmp    8048560 <.plt>

080485f0 <puts@plt>:
 80485f0:	ff 25 2c b0 04 08    	jmp    DWORD PTR ds:0x804b02c
 80485f6:	68 40 00 00 00       	push   0x40
 80485fb:	e9 60 ff ff ff       	jmp    8048560 <.plt>

08048600 <system@plt>:
 8048600:	ff 25 30 b0 04 08    	jmp    DWORD PTR ds:0x804b030
 8048606:	68 48 00 00 00       	push   0x48
 804860b:	e9 50 ff ff ff       	jmp    8048560 <.plt>

08048610 <strlen@plt>:
 8048610:	ff 25 34 b0 04 08    	jmp    DWORD PTR ds:0x804b034
 8048616:	68 50 00 00 00       	push   0x50
 804861b:	e9 40 ff ff ff       	jmp    8048560 <.plt>

08048620 <__libc_start_main@plt>:
 8048620:	ff 25 38 b0 04 08    	jmp    DWORD PTR ds:0x804b038
 8048626:	68 58 00 00 00       	push   0x58
 804862b:	e9 30 ff ff ff       	jmp    8048560 <.plt>

08048630 <ungetc@plt>:
 8048630:	ff 25 3c b0 04 08    	jmp    DWORD PTR ds:0x804b03c
 8048636:	68 60 00 00 00       	push   0x60
 804863b:	e9 20 ff ff ff       	jmp    8048560 <.plt>

08048640 <isalpha@plt>:
 8048640:	ff 25 40 b0 04 08    	jmp    DWORD PTR ds:0x804b040
 8048646:	68 68 00 00 00       	push   0x68
 804864b:	e9 10 ff ff ff       	jmp    8048560 <.plt>

08048650 <toupper@plt>:
 8048650:	ff 25 44 b0 04 08    	jmp    DWORD PTR ds:0x804b044
 8048656:	68 70 00 00 00       	push   0x70
 804865b:	e9 00 ff ff ff       	jmp    8048560 <.plt>

08048660 <__isoc99_scanf@plt>:
 8048660:	ff 25 48 b0 04 08    	jmp    DWORD PTR ds:0x804b048
 8048666:	68 78 00 00 00       	push   0x78
 804866b:	e9 f0 fe ff ff       	jmp    8048560 <.plt>

08048670 <isupper@plt>:
 8048670:	ff 25 4c b0 04 08    	jmp    DWORD PTR ds:0x804b04c
 8048676:	68 80 00 00 00       	push   0x80
 804867b:	e9 e0 fe ff ff       	jmp    8048560 <.plt>

Disassembly of section .plt.got:

08048680 <.plt.got>:
 8048680:	ff 25 fc af 04 08    	jmp    DWORD PTR ds:0x804affc
 8048686:	66 90                	xchg   ax,ax

Disassembly of section .text:

08048690 <_start>:
 8048690:	31 ed                	xor    ebp,ebp
 8048692:	5e                   	pop    esi
 8048693:	89 e1                	mov    ecx,esp
 8048695:	83 e4 f0             	and    esp,0xfffffff0
 8048698:	50                   	push   eax
 8048699:	54                   	push   esp
 804869a:	52                   	push   edx
 804869b:	68 e0 8b 04 08       	push   0x8048be0
 80486a0:	68 80 8b 04 08       	push   0x8048b80
 80486a5:	51                   	push   ecx
 80486a6:	56                   	push   esi
 80486a7:	68 f0 8a 04 08       	push   0x8048af0
 80486ac:	e8 6f ff ff ff       	call   8048620 <__libc_start_main@plt>
 80486b1:	f4                   	hlt    
 80486b2:	66 90                	xchg   ax,ax
 80486b4:	66 90                	xchg   ax,ax
 80486b6:	66 90                	xchg   ax,ax
 80486b8:	66 90                	xchg   ax,ax
 80486ba:	66 90                	xchg   ax,ax
 80486bc:	66 90                	xchg   ax,ax
 80486be:	66 90                	xchg   ax,ax

080486c0 <__x86.get_pc_thunk.bx>:
 80486c0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 80486c3:	c3                   	ret    
 80486c4:	66 90                	xchg   ax,ax
 80486c6:	66 90                	xchg   ax,ax
 80486c8:	66 90                	xchg   ax,ax
 80486ca:	66 90                	xchg   ax,ax
 80486cc:	66 90                	xchg   ax,ax
 80486ce:	66 90                	xchg   ax,ax

080486d0 <deregister_tm_clones>:
 80486d0:	b8 5b b0 04 08       	mov    eax,0x804b05b
 80486d5:	2d 58 b0 04 08       	sub    eax,0x804b058
 80486da:	83 f8 06             	cmp    eax,0x6
 80486dd:	76 1a                	jbe    80486f9 <deregister_tm_clones+0x29>
 80486df:	b8 00 00 00 00       	mov    eax,0x0
 80486e4:	85 c0                	test   eax,eax
 80486e6:	74 11                	je     80486f9 <deregister_tm_clones+0x29>
 80486e8:	55                   	push   ebp
 80486e9:	89 e5                	mov    ebp,esp
 80486eb:	83 ec 14             	sub    esp,0x14
 80486ee:	68 58 b0 04 08       	push   0x804b058
 80486f3:	ff d0                	call   eax
 80486f5:	83 c4 10             	add    esp,0x10
 80486f8:	c9                   	leave  
 80486f9:	f3 c3                	repz ret 
 80486fb:	90                   	nop
 80486fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

08048700 <register_tm_clones>:
 8048700:	b8 58 b0 04 08       	mov    eax,0x804b058
 8048705:	2d 58 b0 04 08       	sub    eax,0x804b058
 804870a:	c1 f8 02             	sar    eax,0x2
 804870d:	89 c2                	mov    edx,eax
 804870f:	c1 ea 1f             	shr    edx,0x1f
 8048712:	01 d0                	add    eax,edx
 8048714:	d1 f8                	sar    eax,1
 8048716:	74 1b                	je     8048733 <register_tm_clones+0x33>
 8048718:	ba 00 00 00 00       	mov    edx,0x0
 804871d:	85 d2                	test   edx,edx
 804871f:	74 12                	je     8048733 <register_tm_clones+0x33>
 8048721:	55                   	push   ebp
 8048722:	89 e5                	mov    ebp,esp
 8048724:	83 ec 10             	sub    esp,0x10
 8048727:	50                   	push   eax
 8048728:	68 58 b0 04 08       	push   0x804b058
 804872d:	ff d2                	call   edx
 804872f:	83 c4 10             	add    esp,0x10
 8048732:	c9                   	leave  
 8048733:	f3 c3                	repz ret 
 8048735:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048739:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048740 <__do_global_dtors_aux>:
 8048740:	80 3d 68 b0 04 08 00 	cmp    BYTE PTR ds:0x804b068,0x0
 8048747:	75 13                	jne    804875c <__do_global_dtors_aux+0x1c>
 8048749:	55                   	push   ebp
 804874a:	89 e5                	mov    ebp,esp
 804874c:	83 ec 08             	sub    esp,0x8
 804874f:	e8 7c ff ff ff       	call   80486d0 <deregister_tm_clones>
 8048754:	c6 05 68 b0 04 08 01 	mov    BYTE PTR ds:0x804b068,0x1
 804875b:	c9                   	leave  
 804875c:	f3 c3                	repz ret 
 804875e:	66 90                	xchg   ax,ax

08048760 <frame_dummy>:
 8048760:	b8 10 af 04 08       	mov    eax,0x804af10
 8048765:	8b 10                	mov    edx,DWORD PTR [eax]
 8048767:	85 d2                	test   edx,edx
 8048769:	75 05                	jne    8048770 <frame_dummy+0x10>
 804876b:	eb 93                	jmp    8048700 <register_tm_clones>
 804876d:	8d 76 00             	lea    esi,[esi+0x0]
 8048770:	ba 00 00 00 00       	mov    edx,0x0
 8048775:	85 d2                	test   edx,edx
 8048777:	74 f2                	je     804876b <frame_dummy+0xb>
 8048779:	55                   	push   ebp
 804877a:	89 e5                	mov    ebp,esp
 804877c:	83 ec 14             	sub    esp,0x14
 804877f:	50                   	push   eax
 8048780:	ff d2                	call   edx
 8048782:	83 c4 10             	add    esp,0x10
 8048785:	c9                   	leave  
 8048786:	e9 75 ff ff ff       	jmp    8048700 <register_tm_clones>

0804878b <getFlag>:
 804878b:	55                   	push   ebp
 804878c:	89 e5                	mov    ebp,esp
 804878e:	83 ec 08             	sub    esp,0x8
 8048791:	83 ec 0c             	sub    esp,0xc
 8048794:	68 00 8c 04 08       	push   0x8048c00
 8048799:	e8 62 fe ff ff       	call   8048600 <system@plt>
 804879e:	83 c4 10             	add    esp,0x10
 80487a1:	90                   	nop
 80487a2:	c9                   	leave  
 80487a3:	c3                   	ret    

080487a4 <print_doge>:
 80487a4:	55                   	push   ebp
 80487a5:	89 e5                	mov    ebp,esp
 80487a7:	83 ec 08             	sub    esp,0x8
 80487aa:	83 ec 0c             	sub    esp,0xc
 80487ad:	68 14 8c 04 08       	push   0x8048c14
 80487b2:	e8 39 fe ff ff       	call   80485f0 <puts@plt>
 80487b7:	83 c4 10             	add    esp,0x10
 80487ba:	83 ec 0c             	sub    esp,0xc
 80487bd:	68 3c 8c 04 08       	push   0x8048c3c
 80487c2:	e8 29 fe ff ff       	call   80485f0 <puts@plt>
 80487c7:	83 c4 10             	add    esp,0x10
 80487ca:	83 ec 0c             	sub    esp,0xc
 80487cd:	68 70 8c 04 08       	push   0x8048c70
 80487d2:	e8 19 fe ff ff       	call   80485f0 <puts@plt>
 80487d7:	83 c4 10             	add    esp,0x10
 80487da:	83 ec 0c             	sub    esp,0xc
 80487dd:	68 ac 8c 04 08       	push   0x8048cac
 80487e2:	e8 09 fe ff ff       	call   80485f0 <puts@plt>
 80487e7:	83 c4 10             	add    esp,0x10
 80487ea:	83 ec 0c             	sub    esp,0xc
 80487ed:	68 f8 8c 04 08       	push   0x8048cf8
 80487f2:	e8 f9 fd ff ff       	call   80485f0 <puts@plt>
 80487f7:	83 c4 10             	add    esp,0x10
 80487fa:	83 ec 0c             	sub    esp,0xc
 80487fd:	68 48 8d 04 08       	push   0x8048d48
 8048802:	e8 e9 fd ff ff       	call   80485f0 <puts@plt>
 8048807:	83 c4 10             	add    esp,0x10
 804880a:	83 ec 0c             	sub    esp,0xc
 804880d:	68 9c 8d 04 08       	push   0x8048d9c
 8048812:	e8 d9 fd ff ff       	call   80485f0 <puts@plt>
 8048817:	83 c4 10             	add    esp,0x10
 804881a:	83 ec 0c             	sub    esp,0xc
 804881d:	68 f4 8d 04 08       	push   0x8048df4
 8048822:	e8 c9 fd ff ff       	call   80485f0 <puts@plt>
 8048827:	83 c4 10             	add    esp,0x10
 804882a:	83 ec 0c             	sub    esp,0xc
 804882d:	68 4c 8e 04 08       	push   0x8048e4c
 8048832:	e8 b9 fd ff ff       	call   80485f0 <puts@plt>
 8048837:	83 c4 10             	add    esp,0x10
 804883a:	83 ec 0c             	sub    esp,0xc
 804883d:	68 ac 8e 04 08       	push   0x8048eac
 8048842:	e8 a9 fd ff ff       	call   80485f0 <puts@plt>
 8048847:	83 c4 10             	add    esp,0x10
 804884a:	83 ec 0c             	sub    esp,0xc
 804884d:	68 0c 8f 04 08       	push   0x8048f0c
 8048852:	e8 99 fd ff ff       	call   80485f0 <puts@plt>
 8048857:	83 c4 10             	add    esp,0x10
 804885a:	83 ec 0c             	sub    esp,0xc
 804885d:	68 6c 8f 04 08       	push   0x8048f6c
 8048862:	e8 89 fd ff ff       	call   80485f0 <puts@plt>
 8048867:	83 c4 10             	add    esp,0x10
 804886a:	83 ec 0c             	sub    esp,0xc
 804886d:	68 d0 8f 04 08       	push   0x8048fd0
 8048872:	e8 79 fd ff ff       	call   80485f0 <puts@plt>
 8048877:	83 c4 10             	add    esp,0x10
 804887a:	83 ec 0c             	sub    esp,0xc
 804887d:	68 30 90 04 08       	push   0x8049030
 8048882:	e8 69 fd ff ff       	call   80485f0 <puts@plt>
 8048887:	83 c4 10             	add    esp,0x10
 804888a:	83 ec 0c             	sub    esp,0xc
 804888d:	68 90 90 04 08       	push   0x8049090
 8048892:	e8 59 fd ff ff       	call   80485f0 <puts@plt>
 8048897:	83 c4 10             	add    esp,0x10
 804889a:	83 ec 0c             	sub    esp,0xc
 804889d:	68 ec 90 04 08       	push   0x80490ec
 80488a2:	e8 49 fd ff ff       	call   80485f0 <puts@plt>
 80488a7:	83 c4 10             	add    esp,0x10
 80488aa:	83 ec 0c             	sub    esp,0xc
 80488ad:	68 44 91 04 08       	push   0x8049144
 80488b2:	e8 39 fd ff ff       	call   80485f0 <puts@plt>
 80488b7:	83 c4 10             	add    esp,0x10
 80488ba:	83 ec 0c             	sub    esp,0xc
 80488bd:	68 98 91 04 08       	push   0x8049198
 80488c2:	e8 29 fd ff ff       	call   80485f0 <puts@plt>
 80488c7:	83 c4 10             	add    esp,0x10
 80488ca:	83 ec 0c             	sub    esp,0xc
 80488cd:	68 e0 91 04 08       	push   0x80491e0
 80488d2:	e8 a9 fc ff ff       	call   8048580 <printf@plt>
 80488d7:	83 c4 10             	add    esp,0x10
 80488da:	83 ec 0c             	sub    esp,0xc
 80488dd:	68 08 92 04 08       	push   0x8049208
 80488e2:	e8 99 fc ff ff       	call   8048580 <printf@plt>
 80488e7:	83 c4 10             	add    esp,0x10
 80488ea:	90                   	nop
 80488eb:	c9                   	leave  
 80488ec:	c3                   	ret    

080488ed <hello_doge>:
 80488ed:	55                   	push   ebp
 80488ee:	89 e5                	mov    ebp,esp
 80488f0:	81 ec 18 01 00 00    	sub    esp,0x118
 80488f6:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 80488fc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80488ff:	31 c0                	xor    eax,eax
 8048901:	83 ec 0c             	sub    esp,0xc
 8048904:	68 30 92 04 08       	push   0x8049230
 8048909:	e8 72 fc ff ff       	call   8048580 <printf@plt>
 804890e:	83 c4 10             	add    esp,0x10
 8048911:	83 ec 08             	sub    esp,0x8
 8048914:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 804891a:	50                   	push   eax
 804891b:	68 59 92 04 08       	push   0x8049259
 8048920:	e8 3b fd ff ff       	call   8048660 <__isoc99_scanf@plt>
 8048925:	83 c4 10             	add    esp,0x10
 8048928:	8b 85 ec fe ff ff    	mov    eax,DWORD PTR [ebp-0x114]
 804892e:	83 f8 0a             	cmp    eax,0xa
 8048931:	7e 15                	jle    8048948 <hello_doge+0x5b>
 8048933:	83 ec 0c             	sub    esp,0xc
 8048936:	68 5c 92 04 08       	push   0x804925c
 804893b:	e8 40 fc ff ff       	call   8048580 <printf@plt>
 8048940:	83 c4 10             	add    esp,0x10
 8048943:	e9 95 01 00 00       	jmp    8048add <hello_doge+0x1f0>
 8048948:	e8 43 fc ff ff       	call   8048590 <getchar@plt>
 804894d:	88 85 eb fe ff ff    	mov    BYTE PTR [ebp-0x115],al
 8048953:	0f be 85 eb fe ff ff 	movsx  eax,BYTE PTR [ebp-0x115]
 804895a:	83 ec 0c             	sub    esp,0xc
 804895d:	50                   	push   eax
 804895e:	e8 5d fc ff ff       	call   80485c0 <isspace@plt>
 8048963:	83 c4 10             	add    esp,0x10
 8048966:	85 c0                	test   eax,eax
 8048968:	0f 85 58 01 00 00    	jne    8048ac6 <hello_doge+0x1d9>
 804896e:	8b 15 60 b0 04 08    	mov    edx,DWORD PTR ds:0x804b060
 8048974:	0f be 85 eb fe ff ff 	movsx  eax,BYTE PTR [ebp-0x115]
 804897b:	83 ec 08             	sub    esp,0x8
 804897e:	52                   	push   edx
 804897f:	50                   	push   eax
 8048980:	e8 ab fc ff ff       	call   8048630 <ungetc@plt>
 8048985:	83 c4 10             	add    esp,0x10
 8048988:	e9 39 01 00 00       	jmp    8048ac6 <hello_doge+0x1d9>
 804898d:	83 ec 0c             	sub    esp,0xc
 8048990:	68 82 92 04 08       	push   0x8049282
 8048995:	e8 e6 fb ff ff       	call   8048580 <printf@plt>
 804899a:	83 c4 10             	add    esp,0x10
 804899d:	a1 60 b0 04 08       	mov    eax,ds:0x804b060
 80489a2:	83 ec 04             	sub    esp,0x4
 80489a5:	50                   	push   eax
 80489a6:	68 00 01 00 00       	push   0x100
 80489ab:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 80489b1:	50                   	push   eax
 80489b2:	e8 e9 fb ff ff       	call   80485a0 <fgets@plt>
 80489b7:	83 c4 10             	add    esp,0x10
 80489ba:	c7 85 f0 fe ff ff 00 	mov    DWORD PTR [ebp-0x110],0x0
 80489c1:	00 00 00 
 80489c4:	e9 b9 00 00 00       	jmp    8048a82 <hello_doge+0x195>
 80489c9:	8d 95 f4 fe ff ff    	lea    edx,[ebp-0x10c]
 80489cf:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
 80489d5:	01 d0                	add    eax,edx
 80489d7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 80489da:	0f be c0             	movsx  eax,al
 80489dd:	83 ec 0c             	sub    esp,0xc
 80489e0:	50                   	push   eax
 80489e1:	e8 5a fc ff ff       	call   8048640 <isalpha@plt>
 80489e6:	83 c4 10             	add    esp,0x10
 80489e9:	85 c0                	test   eax,eax
 80489eb:	0f 84 8a 00 00 00    	je     8048a7b <hello_doge+0x18e>
 80489f1:	8d 95 f4 fe ff ff    	lea    edx,[ebp-0x10c]
 80489f7:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
 80489fd:	01 d0                	add    eax,edx
 80489ff:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 8048a02:	0f be c0             	movsx  eax,al
 8048a05:	83 ec 0c             	sub    esp,0xc
 8048a08:	50                   	push   eax
 8048a09:	e8 62 fc ff ff       	call   8048670 <isupper@plt>
 8048a0e:	83 c4 10             	add    esp,0x10
 8048a11:	85 c0                	test   eax,eax
 8048a13:	74 34                	je     8048a49 <hello_doge+0x15c>
 8048a15:	8d 95 f4 fe ff ff    	lea    edx,[ebp-0x10c]
 8048a1b:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
 8048a21:	01 d0                	add    eax,edx
 8048a23:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 8048a26:	0f be c0             	movsx  eax,al
 8048a29:	83 ec 0c             	sub    esp,0xc
 8048a2c:	50                   	push   eax
 8048a2d:	e8 7e fb ff ff       	call   80485b0 <tolower@plt>
 8048a32:	83 c4 10             	add    esp,0x10
 8048a35:	89 c1                	mov    ecx,eax
 8048a37:	8d 95 f4 fe ff ff    	lea    edx,[ebp-0x10c]
 8048a3d:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
 8048a43:	01 d0                	add    eax,edx
 8048a45:	88 08                	mov    BYTE PTR [eax],cl
 8048a47:	eb 32                	jmp    8048a7b <hello_doge+0x18e>
 8048a49:	8d 95 f4 fe ff ff    	lea    edx,[ebp-0x10c]
 8048a4f:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
 8048a55:	01 d0                	add    eax,edx
 8048a57:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 8048a5a:	0f be c0             	movsx  eax,al
 8048a5d:	83 ec 0c             	sub    esp,0xc
 8048a60:	50                   	push   eax
 8048a61:	e8 ea fb ff ff       	call   8048650 <toupper@plt>
 8048a66:	83 c4 10             	add    esp,0x10
 8048a69:	89 c1                	mov    ecx,eax
 8048a6b:	8d 95 f4 fe ff ff    	lea    edx,[ebp-0x10c]
 8048a71:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
 8048a77:	01 d0                	add    eax,edx
 8048a79:	88 08                	mov    BYTE PTR [eax],cl
 8048a7b:	83 85 f0 fe ff ff 01 	add    DWORD PTR [ebp-0x110],0x1
 8048a82:	83 ec 0c             	sub    esp,0xc
 8048a85:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 8048a8b:	50                   	push   eax
 8048a8c:	e8 7f fb ff ff       	call   8048610 <strlen@plt>
 8048a91:	83 c4 10             	add    esp,0x10
 8048a94:	89 c2                	mov    edx,eax
 8048a96:	8b 85 f0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x110]
 8048a9c:	39 c2                	cmp    edx,eax
 8048a9e:	0f 87 25 ff ff ff    	ja     80489c9 <hello_doge+0xdc>
 8048aa4:	83 ec 0c             	sub    esp,0xc
 8048aa7:	68 92 92 04 08       	push   0x8049292
 8048aac:	e8 cf fa ff ff       	call   8048580 <printf@plt>
 8048ab1:	83 c4 10             	add    esp,0x10
 8048ab4:	83 ec 0c             	sub    esp,0xc
 8048ab7:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 8048abd:	50                   	push   eax
 8048abe:	e8 bd fa ff ff       	call   8048580 <printf@plt>
 8048ac3:	83 c4 10             	add    esp,0x10
 8048ac6:	8b 85 ec fe ff ff    	mov    eax,DWORD PTR [ebp-0x114]
 8048acc:	8d 50 ff             	lea    edx,[eax-0x1]
 8048acf:	89 95 ec fe ff ff    	mov    DWORD PTR [ebp-0x114],edx
 8048ad5:	85 c0                	test   eax,eax
 8048ad7:	0f 8f b0 fe ff ff    	jg     804898d <hello_doge+0xa0>
 8048add:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 8048ae0:	65 33 05 14 00 00 00 	xor    eax,DWORD PTR gs:0x14
 8048ae7:	74 05                	je     8048aee <hello_doge+0x201>
 8048ae9:	e8 e2 fa ff ff       	call   80485d0 <__stack_chk_fail@plt>
 8048aee:	c9                   	leave  
 8048aef:	c3                   	ret    

08048af0 <main>:
 8048af0:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 8048af4:	83 e4 f0             	and    esp,0xfffffff0
 8048af7:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 8048afa:	55                   	push   ebp
 8048afb:	89 e5                	mov    ebp,esp
 8048afd:	51                   	push   ecx
 8048afe:	83 ec 34             	sub    esp,0x34
 8048b01:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 8048b07:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8048b0a:	31 c0                	xor    eax,eax
 8048b0c:	a1 64 b0 04 08       	mov    eax,ds:0x804b064
 8048b11:	83 ec 08             	sub    esp,0x8
 8048b14:	6a 00                	push   0x0
 8048b16:	50                   	push   eax
 8048b17:	e8 54 fa ff ff       	call   8048570 <setbuf@plt>
 8048b1c:	83 c4 10             	add    esp,0x10
 8048b1f:	e8 80 fc ff ff       	call   80487a4 <print_doge>
 8048b24:	a1 64 b0 04 08       	mov    eax,ds:0x804b064
 8048b29:	50                   	push   eax
 8048b2a:	6a 0d                	push   0xd
 8048b2c:	6a 01                	push   0x1
 8048b2e:	68 a5 92 04 08       	push   0x80492a5
 8048b33:	e8 a8 fa ff ff       	call   80485e0 <fwrite@plt>
 8048b38:	83 c4 10             	add    esp,0x10
 8048b3b:	a1 60 b0 04 08       	mov    eax,ds:0x804b060
 8048b40:	83 ec 04             	sub    esp,0x4
 8048b43:	50                   	push   eax
 8048b44:	6a 24                	push   0x24
 8048b46:	8d 45 d0             	lea    eax,[ebp-0x30]
 8048b49:	50                   	push   eax
 8048b4a:	e8 51 fa ff ff       	call   80485a0 <fgets@plt>
 8048b4f:	83 c4 1c             	add    esp,0x1c
 8048b52:	e8 96 fd ff ff       	call   80488ed <hello_doge>
 8048b57:	b8 00 00 00 00       	mov    eax,0x0
 8048b5c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 8048b5f:	65 33 15 14 00 00 00 	xor    edx,DWORD PTR gs:0x14
 8048b66:	74 05                	je     8048b6d <main+0x7d>
 8048b68:	e8 63 fa ff ff       	call   80485d0 <__stack_chk_fail@plt>
 8048b6d:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 8048b70:	c9                   	leave  
 8048b71:	8d 61 fc             	lea    esp,[ecx-0x4]
 8048b74:	c3                   	ret    
 8048b75:	66 90                	xchg   ax,ax
 8048b77:	66 90                	xchg   ax,ax
 8048b79:	66 90                	xchg   ax,ax
 8048b7b:	66 90                	xchg   ax,ax
 8048b7d:	66 90                	xchg   ax,ax
 8048b7f:	90                   	nop

08048b80 <__libc_csu_init>:
 8048b80:	55                   	push   ebp
 8048b81:	57                   	push   edi
 8048b82:	56                   	push   esi
 8048b83:	53                   	push   ebx
 8048b84:	e8 37 fb ff ff       	call   80486c0 <__x86.get_pc_thunk.bx>
 8048b89:	81 c3 77 24 00 00    	add    ebx,0x2477
 8048b8f:	83 ec 0c             	sub    esp,0xc
 8048b92:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 8048b96:	8d b3 0c ff ff ff    	lea    esi,[ebx-0xf4]
 8048b9c:	e8 8f f9 ff ff       	call   8048530 <_init>
 8048ba1:	8d 83 08 ff ff ff    	lea    eax,[ebx-0xf8]
 8048ba7:	29 c6                	sub    esi,eax
 8048ba9:	c1 fe 02             	sar    esi,0x2
 8048bac:	85 f6                	test   esi,esi
 8048bae:	74 25                	je     8048bd5 <__libc_csu_init+0x55>
 8048bb0:	31 ff                	xor    edi,edi
 8048bb2:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 8048bb8:	83 ec 04             	sub    esp,0x4
 8048bbb:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 8048bbf:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 8048bc3:	55                   	push   ebp
 8048bc4:	ff 94 bb 08 ff ff ff 	call   DWORD PTR [ebx+edi*4-0xf8]
 8048bcb:	83 c7 01             	add    edi,0x1
 8048bce:	83 c4 10             	add    esp,0x10
 8048bd1:	39 f7                	cmp    edi,esi
 8048bd3:	75 e3                	jne    8048bb8 <__libc_csu_init+0x38>
 8048bd5:	83 c4 0c             	add    esp,0xc
 8048bd8:	5b                   	pop    ebx
 8048bd9:	5e                   	pop    esi
 8048bda:	5f                   	pop    edi
 8048bdb:	5d                   	pop    ebp
 8048bdc:	c3                   	ret    
 8048bdd:	8d 76 00             	lea    esi,[esi+0x0]

08048be0 <__libc_csu_fini>:
 8048be0:	f3 c3                	repz ret 

Disassembly of section .fini:

08048be4 <_fini>:
 8048be4:	53                   	push   ebx
 8048be5:	83 ec 08             	sub    esp,0x8
 8048be8:	e8 d3 fa ff ff       	call   80486c0 <__x86.get_pc_thunk.bx>
 8048bed:	81 c3 13 24 00 00    	add    ebx,0x2413
 8048bf3:	83 c4 08             	add    esp,0x8
 8048bf6:	5b                   	pop    ebx
 8048bf7:	c3                   	ret    
