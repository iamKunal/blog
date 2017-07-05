
auth:     file format elf32-i386


Disassembly of section .init:

08048488 <_init>:
 8048488:	53                   	push   ebx
 8048489:	83 ec 08             	sub    esp,0x8
 804848c:	e8 1f 01 00 00       	call   80485b0 <__x86.get_pc_thunk.bx>
 8048491:	81 c3 6f 1b 00 00    	add    ebx,0x1b6f
 8048497:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 804849d:	85 c0                	test   eax,eax
 804849f:	74 05                	je     80484a6 <_init+0x1e>
 80484a1:	e8 ca 00 00 00       	call   8048570 <.plt.got>
 80484a6:	83 c4 08             	add    esp,0x8
 80484a9:	5b                   	pop    ebx
 80484aa:	c3                   	ret    

Disassembly of section .plt:

080484b0 <.plt>:
 80484b0:	ff 35 04 a0 04 08    	push   DWORD PTR ds:0x804a004
 80484b6:	ff 25 08 a0 04 08    	jmp    DWORD PTR ds:0x804a008
 80484bc:	00 00                	add    BYTE PTR [eax],al
	...

080484c0 <setbuf@plt>:
 80484c0:	ff 25 0c a0 04 08    	jmp    DWORD PTR ds:0x804a00c
 80484c6:	68 00 00 00 00       	push   0x0
 80484cb:	e9 e0 ff ff ff       	jmp    80484b0 <.plt>

080484d0 <strcmp@plt>:
 80484d0:	ff 25 10 a0 04 08    	jmp    DWORD PTR ds:0x804a010
 80484d6:	68 08 00 00 00       	push   0x8
 80484db:	e9 d0 ff ff ff       	jmp    80484b0 <.plt>

080484e0 <__isoc99_fscanf@plt>:
 80484e0:	ff 25 14 a0 04 08    	jmp    DWORD PTR ds:0x804a014
 80484e6:	68 10 00 00 00       	push   0x10
 80484eb:	e9 c0 ff ff ff       	jmp    80484b0 <.plt>

080484f0 <__stack_chk_fail@plt>:
 80484f0:	ff 25 18 a0 04 08    	jmp    DWORD PTR ds:0x804a018
 80484f6:	68 18 00 00 00       	push   0x18
 80484fb:	e9 b0 ff ff ff       	jmp    80484b0 <.plt>

08048500 <fwrite@plt>:
 8048500:	ff 25 1c a0 04 08    	jmp    DWORD PTR ds:0x804a01c
 8048506:	68 20 00 00 00       	push   0x20
 804850b:	e9 a0 ff ff ff       	jmp    80484b0 <.plt>

08048510 <puts@plt>:
 8048510:	ff 25 20 a0 04 08    	jmp    DWORD PTR ds:0x804a020
 8048516:	68 28 00 00 00       	push   0x28
 804851b:	e9 90 ff ff ff       	jmp    80484b0 <.plt>

08048520 <exit@plt>:
 8048520:	ff 25 24 a0 04 08    	jmp    DWORD PTR ds:0x804a024
 8048526:	68 30 00 00 00       	push   0x30
 804852b:	e9 80 ff ff ff       	jmp    80484b0 <.plt>

08048530 <__libc_start_main@plt>:
 8048530:	ff 25 28 a0 04 08    	jmp    DWORD PTR ds:0x804a028
 8048536:	68 38 00 00 00       	push   0x38
 804853b:	e9 70 ff ff ff       	jmp    80484b0 <.plt>

08048540 <fopen@plt>:
 8048540:	ff 25 2c a0 04 08    	jmp    DWORD PTR ds:0x804a02c
 8048546:	68 40 00 00 00       	push   0x40
 804854b:	e9 60 ff ff ff       	jmp    80484b0 <.plt>

08048550 <snprintf@plt>:
 8048550:	ff 25 30 a0 04 08    	jmp    DWORD PTR ds:0x804a030
 8048556:	68 48 00 00 00       	push   0x48
 804855b:	e9 50 ff ff ff       	jmp    80484b0 <.plt>

08048560 <__isoc99_scanf@plt>:
 8048560:	ff 25 34 a0 04 08    	jmp    DWORD PTR ds:0x804a034
 8048566:	68 50 00 00 00       	push   0x50
 804856b:	e9 40 ff ff ff       	jmp    80484b0 <.plt>

Disassembly of section .plt.got:

08048570 <.plt.got>:
 8048570:	ff 25 fc 9f 04 08    	jmp    DWORD PTR ds:0x8049ffc
 8048576:	66 90                	xchg   ax,ax

Disassembly of section .text:

08048580 <_start>:
 8048580:	31 ed                	xor    ebp,ebp
 8048582:	5e                   	pop    esi
 8048583:	89 e1                	mov    ecx,esp
 8048585:	83 e4 f0             	and    esp,0xfffffff0
 8048588:	50                   	push   eax
 8048589:	54                   	push   esp
 804858a:	52                   	push   edx
 804858b:	68 e0 88 04 08       	push   0x80488e0
 8048590:	68 80 88 04 08       	push   0x8048880
 8048595:	51                   	push   ecx
 8048596:	56                   	push   esi
 8048597:	68 7b 86 04 08       	push   0x804867b
 804859c:	e8 8f ff ff ff       	call   8048530 <__libc_start_main@plt>
 80485a1:	f4                   	hlt    
 80485a2:	66 90                	xchg   ax,ax
 80485a4:	66 90                	xchg   ax,ax
 80485a6:	66 90                	xchg   ax,ax
 80485a8:	66 90                	xchg   ax,ax
 80485aa:	66 90                	xchg   ax,ax
 80485ac:	66 90                	xchg   ax,ax
 80485ae:	66 90                	xchg   ax,ax

080485b0 <__x86.get_pc_thunk.bx>:
 80485b0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 80485b3:	c3                   	ret    
 80485b4:	66 90                	xchg   ax,ax
 80485b6:	66 90                	xchg   ax,ax
 80485b8:	66 90                	xchg   ax,ax
 80485ba:	66 90                	xchg   ax,ax
 80485bc:	66 90                	xchg   ax,ax
 80485be:	66 90                	xchg   ax,ax

080485c0 <deregister_tm_clones>:
 80485c0:	b8 43 a0 04 08       	mov    eax,0x804a043
 80485c5:	2d 40 a0 04 08       	sub    eax,0x804a040
 80485ca:	83 f8 06             	cmp    eax,0x6
 80485cd:	76 1a                	jbe    80485e9 <deregister_tm_clones+0x29>
 80485cf:	b8 00 00 00 00       	mov    eax,0x0
 80485d4:	85 c0                	test   eax,eax
 80485d6:	74 11                	je     80485e9 <deregister_tm_clones+0x29>
 80485d8:	55                   	push   ebp
 80485d9:	89 e5                	mov    ebp,esp
 80485db:	83 ec 14             	sub    esp,0x14
 80485de:	68 40 a0 04 08       	push   0x804a040
 80485e3:	ff d0                	call   eax
 80485e5:	83 c4 10             	add    esp,0x10
 80485e8:	c9                   	leave  
 80485e9:	f3 c3                	repz ret 
 80485eb:	90                   	nop
 80485ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

080485f0 <register_tm_clones>:
 80485f0:	b8 40 a0 04 08       	mov    eax,0x804a040
 80485f5:	2d 40 a0 04 08       	sub    eax,0x804a040
 80485fa:	c1 f8 02             	sar    eax,0x2
 80485fd:	89 c2                	mov    edx,eax
 80485ff:	c1 ea 1f             	shr    edx,0x1f
 8048602:	01 d0                	add    eax,edx
 8048604:	d1 f8                	sar    eax,1
 8048606:	74 1b                	je     8048623 <register_tm_clones+0x33>
 8048608:	ba 00 00 00 00       	mov    edx,0x0
 804860d:	85 d2                	test   edx,edx
 804860f:	74 12                	je     8048623 <register_tm_clones+0x33>
 8048611:	55                   	push   ebp
 8048612:	89 e5                	mov    ebp,esp
 8048614:	83 ec 10             	sub    esp,0x10
 8048617:	50                   	push   eax
 8048618:	68 40 a0 04 08       	push   0x804a040
 804861d:	ff d2                	call   edx
 804861f:	83 c4 10             	add    esp,0x10
 8048622:	c9                   	leave  
 8048623:	f3 c3                	repz ret 
 8048625:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048629:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048630 <__do_global_dtors_aux>:
 8048630:	80 3d 48 a0 04 08 00 	cmp    BYTE PTR ds:0x804a048,0x0
 8048637:	75 13                	jne    804864c <__do_global_dtors_aux+0x1c>
 8048639:	55                   	push   ebp
 804863a:	89 e5                	mov    ebp,esp
 804863c:	83 ec 08             	sub    esp,0x8
 804863f:	e8 7c ff ff ff       	call   80485c0 <deregister_tm_clones>
 8048644:	c6 05 48 a0 04 08 01 	mov    BYTE PTR ds:0x804a048,0x1
 804864b:	c9                   	leave  
 804864c:	f3 c3                	repz ret 
 804864e:	66 90                	xchg   ax,ax

08048650 <frame_dummy>:
 8048650:	b8 10 9f 04 08       	mov    eax,0x8049f10
 8048655:	8b 10                	mov    edx,DWORD PTR [eax]
 8048657:	85 d2                	test   edx,edx
 8048659:	75 05                	jne    8048660 <frame_dummy+0x10>
 804865b:	eb 93                	jmp    80485f0 <register_tm_clones>
 804865d:	8d 76 00             	lea    esi,[esi+0x0]
 8048660:	ba 00 00 00 00       	mov    edx,0x0
 8048665:	85 d2                	test   edx,edx
 8048667:	74 f2                	je     804865b <frame_dummy+0xb>
 8048669:	55                   	push   ebp
 804866a:	89 e5                	mov    ebp,esp
 804866c:	83 ec 14             	sub    esp,0x14
 804866f:	50                   	push   eax
 8048670:	ff d2                	call   edx
 8048672:	83 c4 10             	add    esp,0x10
 8048675:	c9                   	leave  
 8048676:	e9 75 ff ff ff       	jmp    80485f0 <register_tm_clones>

0804867b <main>:
 804867b:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 804867f:	83 e4 f0             	and    esp,0xfffffff0
 8048682:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 8048685:	55                   	push   ebp
 8048686:	89 e5                	mov    ebp,esp
 8048688:	51                   	push   ecx
 8048689:	81 ec 84 01 00 00    	sub    esp,0x184
 804868f:	89 c8                	mov    eax,ecx
 8048691:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 8048694:	89 85 84 fe ff ff    	mov    DWORD PTR [ebp-0x17c],eax
 804869a:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 80486a0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80486a3:	31 c0                	xor    eax,eax
 80486a5:	c7 85 98 fe ff ff 00 	mov    DWORD PTR [ebp-0x168],0x0
 80486ac:	00 00 00 
 80486af:	a1 44 a0 04 08       	mov    eax,ds:0x804a044
 80486b4:	83 ec 08             	sub    esp,0x8
 80486b7:	6a 00                	push   0x0
 80486b9:	50                   	push   eax
 80486ba:	e8 01 fe ff ff       	call   80484c0 <setbuf@plt>
 80486bf:	83 c4 10             	add    esp,0x10
 80486c2:	83 ec 08             	sub    esp,0x8
 80486c5:	68 00 89 04 08       	push   0x8048900
 80486ca:	68 02 89 04 08       	push   0x8048902
 80486cf:	e8 6c fe ff ff       	call   8048540 <fopen@plt>
 80486d4:	83 c4 10             	add    esp,0x10
 80486d7:	89 85 9c fe ff ff    	mov    DWORD PTR [ebp-0x164],eax
 80486dd:	83 bd 9c fe ff ff 00 	cmp    DWORD PTR [ebp-0x164],0x0
 80486e4:	75 21                	jne    8048707 <main+0x8c>
 80486e6:	a1 40 a0 04 08       	mov    eax,ds:0x804a040
 80486eb:	50                   	push   eax
 80486ec:	6a 19                	push   0x19
 80486ee:	6a 01                	push   0x1
 80486f0:	68 0b 89 04 08       	push   0x804890b
 80486f5:	e8 06 fe ff ff       	call   8048500 <fwrite@plt>
 80486fa:	83 c4 10             	add    esp,0x10
 80486fd:	83 ec 0c             	sub    esp,0xc
 8048700:	6a 01                	push   0x1
 8048702:	e8 19 fe ff ff       	call   8048520 <exit@plt>
 8048707:	83 ec 04             	sub    esp,0x4
 804870a:	8d 85 a4 fe ff ff    	lea    eax,[ebp-0x15c]
 8048710:	50                   	push   eax
 8048711:	68 25 89 04 08       	push   0x8048925
 8048716:	ff b5 9c fe ff ff    	push   DWORD PTR [ebp-0x164]
 804871c:	e8 bf fd ff ff       	call   80484e0 <__isoc99_fscanf@plt>
 8048721:	83 c4 10             	add    esp,0x10
 8048724:	83 ec 0c             	sub    esp,0xc
 8048727:	68 2a 89 04 08       	push   0x804892a
 804872c:	e8 df fd ff ff       	call   8048510 <puts@plt>
 8048731:	83 c4 10             	add    esp,0x10
 8048734:	83 ec 08             	sub    esp,0x8
 8048737:	8d 85 cc fe ff ff    	lea    eax,[ebp-0x134]
 804873d:	50                   	push   eax
 804873e:	68 25 89 04 08       	push   0x8048925
 8048743:	e8 18 fe ff ff       	call   8048560 <__isoc99_scanf@plt>
 8048748:	83 c4 10             	add    esp,0x10
 804874b:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 8048751:	89 85 a0 fe ff ff    	mov    DWORD PTR [ebp-0x160],eax
 8048757:	8b 85 a0 fe ff ff    	mov    eax,DWORD PTR [ebp-0x160]
 804875d:	c7 00 59 6f 75 20    	mov    DWORD PTR [eax],0x20756f59
 8048763:	c7 40 04 73 61 69 64 	mov    DWORD PTR [eax+0x4],0x64696173
 804876a:	66 c7 40 08 20 00    	mov    WORD PTR [eax+0x8],0x20
 8048770:	83 85 98 fe ff ff 09 	add    DWORD PTR [ebp-0x168],0x9
 8048777:	b8 00 01 00 00       	mov    eax,0x100
 804877c:	2b 85 98 fe ff ff    	sub    eax,DWORD PTR [ebp-0x168]
 8048782:	8b 8d a0 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x160]
 8048788:	8b 95 98 fe ff ff    	mov    edx,DWORD PTR [ebp-0x168]
 804878e:	01 d1                	add    ecx,edx
 8048790:	83 ec 04             	sub    esp,0x4
 8048793:	8d 95 cc fe ff ff    	lea    edx,[ebp-0x134]
 8048799:	52                   	push   edx
 804879a:	50                   	push   eax
 804879b:	51                   	push   ecx
 804879c:	e8 af fd ff ff       	call   8048550 <snprintf@plt>
 80487a1:	83 c4 10             	add    esp,0x10
 80487a4:	89 85 94 fe ff ff    	mov    DWORD PTR [ebp-0x16c],eax
 80487aa:	b8 00 01 00 00       	mov    eax,0x100
 80487af:	2b 85 98 fe ff ff    	sub    eax,DWORD PTR [ebp-0x168]
 80487b5:	3b 85 94 fe ff ff    	cmp    eax,DWORD PTR [ebp-0x16c]
 80487bb:	73 11                	jae    80487ce <main+0x153>
 80487bd:	b8 ff 00 00 00       	mov    eax,0xff
 80487c2:	2b 85 98 fe ff ff    	sub    eax,DWORD PTR [ebp-0x168]
 80487c8:	89 85 94 fe ff ff    	mov    DWORD PTR [ebp-0x16c],eax
 80487ce:	8b 85 94 fe ff ff    	mov    eax,DWORD PTR [ebp-0x16c]
 80487d4:	01 85 98 fe ff ff    	add    DWORD PTR [ebp-0x168],eax
 80487da:	83 ec 08             	sub    esp,0x8
 80487dd:	8d 85 a4 fe ff ff    	lea    eax,[ebp-0x15c]
 80487e3:	50                   	push   eax
 80487e4:	8d 85 cc fe ff ff    	lea    eax,[ebp-0x134]
 80487ea:	50                   	push   eax
 80487eb:	e8 e0 fc ff ff       	call   80484d0 <strcmp@plt>
 80487f0:	83 c4 10             	add    esp,0x10
 80487f3:	85 c0                	test   eax,eax
 80487f5:	75 2d                	jne    8048824 <main+0x1a9>
 80487f7:	b8 00 01 00 00       	mov    eax,0x100
 80487fc:	2b 85 98 fe ff ff    	sub    eax,DWORD PTR [ebp-0x168]
 8048802:	8b 8d a0 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x160]
 8048808:	8b 95 98 fe ff ff    	mov    edx,DWORD PTR [ebp-0x168]
 804880e:	01 ca                	add    edx,ecx
 8048810:	83 ec 04             	sub    esp,0x4
 8048813:	68 3a 89 04 08       	push   0x804893a
 8048818:	50                   	push   eax
 8048819:	52                   	push   edx
 804881a:	e8 31 fd ff ff       	call   8048550 <snprintf@plt>
 804881f:	83 c4 10             	add    esp,0x10
 8048822:	eb 2b                	jmp    804884f <main+0x1d4>
 8048824:	b8 00 01 00 00       	mov    eax,0x100
 8048829:	2b 85 98 fe ff ff    	sub    eax,DWORD PTR [ebp-0x168]
 804882f:	8b 8d a0 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x160]
 8048835:	8b 95 98 fe ff ff    	mov    edx,DWORD PTR [ebp-0x168]
 804883b:	01 ca                	add    edx,ecx
 804883d:	83 ec 04             	sub    esp,0x4
 8048840:	68 4f 89 04 08       	push   0x804894f
 8048845:	50                   	push   eax
 8048846:	52                   	push   edx
 8048847:	e8 04 fd ff ff       	call   8048550 <snprintf@plt>
 804884c:	83 c4 10             	add    esp,0x10
 804884f:	83 ec 0c             	sub    esp,0xc
 8048852:	8d 85 f4 fe ff ff    	lea    eax,[ebp-0x10c]
 8048858:	50                   	push   eax
 8048859:	e8 b2 fc ff ff       	call   8048510 <puts@plt>
 804885e:	83 c4 10             	add    esp,0x10
 8048861:	b8 00 00 00 00       	mov    eax,0x0
 8048866:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 8048869:	65 33 0d 14 00 00 00 	xor    ecx,DWORD PTR gs:0x14
 8048870:	74 05                	je     8048877 <main+0x1fc>
 8048872:	e8 79 fc ff ff       	call   80484f0 <__stack_chk_fail@plt>
 8048877:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 804887a:	c9                   	leave  
 804887b:	8d 61 fc             	lea    esp,[ecx-0x4]
 804887e:	c3                   	ret    
 804887f:	90                   	nop

08048880 <__libc_csu_init>:
 8048880:	55                   	push   ebp
 8048881:	57                   	push   edi
 8048882:	56                   	push   esi
 8048883:	53                   	push   ebx
 8048884:	e8 27 fd ff ff       	call   80485b0 <__x86.get_pc_thunk.bx>
 8048889:	81 c3 77 17 00 00    	add    ebx,0x1777
 804888f:	83 ec 0c             	sub    esp,0xc
 8048892:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 8048896:	8d b3 0c ff ff ff    	lea    esi,[ebx-0xf4]
 804889c:	e8 e7 fb ff ff       	call   8048488 <_init>
 80488a1:	8d 83 08 ff ff ff    	lea    eax,[ebx-0xf8]
 80488a7:	29 c6                	sub    esi,eax
 80488a9:	c1 fe 02             	sar    esi,0x2
 80488ac:	85 f6                	test   esi,esi
 80488ae:	74 25                	je     80488d5 <__libc_csu_init+0x55>
 80488b0:	31 ff                	xor    edi,edi
 80488b2:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 80488b8:	83 ec 04             	sub    esp,0x4
 80488bb:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 80488bf:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 80488c3:	55                   	push   ebp
 80488c4:	ff 94 bb 08 ff ff ff 	call   DWORD PTR [ebx+edi*4-0xf8]
 80488cb:	83 c7 01             	add    edi,0x1
 80488ce:	83 c4 10             	add    esp,0x10
 80488d1:	39 f7                	cmp    edi,esi
 80488d3:	75 e3                	jne    80488b8 <__libc_csu_init+0x38>
 80488d5:	83 c4 0c             	add    esp,0xc
 80488d8:	5b                   	pop    ebx
 80488d9:	5e                   	pop    esi
 80488da:	5f                   	pop    edi
 80488db:	5d                   	pop    ebp
 80488dc:	c3                   	ret    
 80488dd:	8d 76 00             	lea    esi,[esi+0x0]

080488e0 <__libc_csu_fini>:
 80488e0:	f3 c3                	repz ret 

Disassembly of section .fini:

080488e4 <_fini>:
 80488e4:	53                   	push   ebx
 80488e5:	83 ec 08             	sub    esp,0x8
 80488e8:	e8 c3 fc ff ff       	call   80485b0 <__x86.get_pc_thunk.bx>
 80488ed:	81 c3 13 17 00 00    	add    ebx,0x1713
 80488f3:	83 c4 08             	add    esp,0x8
 80488f6:	5b                   	pop    ebx
 80488f7:	c3                   	ret    
