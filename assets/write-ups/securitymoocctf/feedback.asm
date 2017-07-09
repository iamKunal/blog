
feedback:     file format elf32-i386


Disassembly of section .init:

080483d8 <_init>:
 80483d8:	53                   	push   ebx
 80483d9:	83 ec 08             	sub    esp,0x8
 80483dc:	e8 ef 00 00 00       	call   80484d0 <__x86.get_pc_thunk.bx>
 80483e1:	81 c3 1f 1c 00 00    	add    ebx,0x1c1f
 80483e7:	8b 83 fc ff ff ff    	mov    eax,DWORD PTR [ebx-0x4]
 80483ed:	85 c0                	test   eax,eax
 80483ef:	74 05                	je     80483f6 <_init+0x1e>
 80483f1:	e8 9a 00 00 00       	call   8048490 <.plt.got>
 80483f6:	83 c4 08             	add    esp,0x8
 80483f9:	5b                   	pop    ebx
 80483fa:	c3                   	ret    

Disassembly of section .plt:

08048400 <.plt>:
 8048400:	ff 35 04 a0 04 08    	push   DWORD PTR ds:0x804a004
 8048406:	ff 25 08 a0 04 08    	jmp    DWORD PTR ds:0x804a008
 804840c:	00 00                	add    BYTE PTR [eax],al
	...

08048410 <setbuf@plt>:
 8048410:	ff 25 0c a0 04 08    	jmp    DWORD PTR ds:0x804a00c
 8048416:	68 00 00 00 00       	push   0x0
 804841b:	e9 e0 ff ff ff       	jmp    8048400 <.plt>

08048420 <read@plt>:
 8048420:	ff 25 10 a0 04 08    	jmp    DWORD PTR ds:0x804a010
 8048426:	68 08 00 00 00       	push   0x8
 804842b:	e9 d0 ff ff ff       	jmp    8048400 <.plt>

08048430 <printf@plt>:
 8048430:	ff 25 14 a0 04 08    	jmp    DWORD PTR ds:0x804a014
 8048436:	68 10 00 00 00       	push   0x10
 804843b:	e9 c0 ff ff ff       	jmp    8048400 <.plt>

08048440 <__stack_chk_fail@plt>:
 8048440:	ff 25 18 a0 04 08    	jmp    DWORD PTR ds:0x804a018
 8048446:	68 18 00 00 00       	push   0x18
 804844b:	e9 b0 ff ff ff       	jmp    8048400 <.plt>

08048450 <puts@plt>:
 8048450:	ff 25 1c a0 04 08    	jmp    DWORD PTR ds:0x804a01c
 8048456:	68 20 00 00 00       	push   0x20
 804845b:	e9 a0 ff ff ff       	jmp    8048400 <.plt>

08048460 <__libc_start_main@plt>:
 8048460:	ff 25 20 a0 04 08    	jmp    DWORD PTR ds:0x804a020
 8048466:	68 28 00 00 00       	push   0x28
 804846b:	e9 90 ff ff ff       	jmp    8048400 <.plt>

08048470 <putchar@plt>:
 8048470:	ff 25 24 a0 04 08    	jmp    DWORD PTR ds:0x804a024
 8048476:	68 30 00 00 00       	push   0x30
 804847b:	e9 80 ff ff ff       	jmp    8048400 <.plt>

08048480 <__isoc99_scanf@plt>:
 8048480:	ff 25 28 a0 04 08    	jmp    DWORD PTR ds:0x804a028
 8048486:	68 38 00 00 00       	push   0x38
 804848b:	e9 70 ff ff ff       	jmp    8048400 <.plt>

Disassembly of section .plt.got:

08048490 <.plt.got>:
 8048490:	ff 25 fc 9f 04 08    	jmp    DWORD PTR ds:0x8049ffc
 8048496:	66 90                	xchg   ax,ax

Disassembly of section .text:

080484a0 <_start>:
 80484a0:	31 ed                	xor    ebp,ebp
 80484a2:	5e                   	pop    esi
 80484a3:	89 e1                	mov    ecx,esp
 80484a5:	83 e4 f0             	and    esp,0xfffffff0
 80484a8:	50                   	push   eax
 80484a9:	54                   	push   esp
 80484aa:	52                   	push   edx
 80484ab:	68 10 87 04 08       	push   0x8048710
 80484b0:	68 b0 86 04 08       	push   0x80486b0
 80484b5:	51                   	push   ecx
 80484b6:	56                   	push   esi
 80484b7:	68 71 86 04 08       	push   0x8048671
 80484bc:	e8 9f ff ff ff       	call   8048460 <__libc_start_main@plt>
 80484c1:	f4                   	hlt    
 80484c2:	66 90                	xchg   ax,ax
 80484c4:	66 90                	xchg   ax,ax
 80484c6:	66 90                	xchg   ax,ax
 80484c8:	66 90                	xchg   ax,ax
 80484ca:	66 90                	xchg   ax,ax
 80484cc:	66 90                	xchg   ax,ax
 80484ce:	66 90                	xchg   ax,ax

080484d0 <__x86.get_pc_thunk.bx>:
 80484d0:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 80484d3:	c3                   	ret    
 80484d4:	66 90                	xchg   ax,ax
 80484d6:	66 90                	xchg   ax,ax
 80484d8:	66 90                	xchg   ax,ax
 80484da:	66 90                	xchg   ax,ax
 80484dc:	66 90                	xchg   ax,ax
 80484de:	66 90                	xchg   ax,ax

080484e0 <deregister_tm_clones>:
 80484e0:	b8 37 a0 04 08       	mov    eax,0x804a037
 80484e5:	2d 34 a0 04 08       	sub    eax,0x804a034
 80484ea:	83 f8 06             	cmp    eax,0x6
 80484ed:	76 1a                	jbe    8048509 <deregister_tm_clones+0x29>
 80484ef:	b8 00 00 00 00       	mov    eax,0x0
 80484f4:	85 c0                	test   eax,eax
 80484f6:	74 11                	je     8048509 <deregister_tm_clones+0x29>
 80484f8:	55                   	push   ebp
 80484f9:	89 e5                	mov    ebp,esp
 80484fb:	83 ec 14             	sub    esp,0x14
 80484fe:	68 34 a0 04 08       	push   0x804a034
 8048503:	ff d0                	call   eax
 8048505:	83 c4 10             	add    esp,0x10
 8048508:	c9                   	leave  
 8048509:	f3 c3                	repz ret 
 804850b:	90                   	nop
 804850c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

08048510 <register_tm_clones>:
 8048510:	b8 34 a0 04 08       	mov    eax,0x804a034
 8048515:	2d 34 a0 04 08       	sub    eax,0x804a034
 804851a:	c1 f8 02             	sar    eax,0x2
 804851d:	89 c2                	mov    edx,eax
 804851f:	c1 ea 1f             	shr    edx,0x1f
 8048522:	01 d0                	add    eax,edx
 8048524:	d1 f8                	sar    eax,1
 8048526:	74 1b                	je     8048543 <register_tm_clones+0x33>
 8048528:	ba 00 00 00 00       	mov    edx,0x0
 804852d:	85 d2                	test   edx,edx
 804852f:	74 12                	je     8048543 <register_tm_clones+0x33>
 8048531:	55                   	push   ebp
 8048532:	89 e5                	mov    ebp,esp
 8048534:	83 ec 10             	sub    esp,0x10
 8048537:	50                   	push   eax
 8048538:	68 34 a0 04 08       	push   0x804a034
 804853d:	ff d2                	call   edx
 804853f:	83 c4 10             	add    esp,0x10
 8048542:	c9                   	leave  
 8048543:	f3 c3                	repz ret 
 8048545:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
 8048549:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

08048550 <__do_global_dtors_aux>:
 8048550:	80 3d 38 a0 04 08 00 	cmp    BYTE PTR ds:0x804a038,0x0
 8048557:	75 13                	jne    804856c <__do_global_dtors_aux+0x1c>
 8048559:	55                   	push   ebp
 804855a:	89 e5                	mov    ebp,esp
 804855c:	83 ec 08             	sub    esp,0x8
 804855f:	e8 7c ff ff ff       	call   80484e0 <deregister_tm_clones>
 8048564:	c6 05 38 a0 04 08 01 	mov    BYTE PTR ds:0x804a038,0x1
 804856b:	c9                   	leave  
 804856c:	f3 c3                	repz ret 
 804856e:	66 90                	xchg   ax,ax

08048570 <frame_dummy>:
 8048570:	b8 10 9f 04 08       	mov    eax,0x8049f10
 8048575:	8b 10                	mov    edx,DWORD PTR [eax]
 8048577:	85 d2                	test   edx,edx
 8048579:	75 05                	jne    8048580 <frame_dummy+0x10>
 804857b:	eb 93                	jmp    8048510 <register_tm_clones>
 804857d:	8d 76 00             	lea    esi,[esi+0x0]
 8048580:	ba 00 00 00 00       	mov    edx,0x0
 8048585:	85 d2                	test   edx,edx
 8048587:	74 f2                	je     804857b <frame_dummy+0xb>
 8048589:	55                   	push   ebp
 804858a:	89 e5                	mov    ebp,esp
 804858c:	83 ec 14             	sub    esp,0x14
 804858f:	50                   	push   eax
 8048590:	ff d2                	call   edx
 8048592:	83 c4 10             	add    esp,0x10
 8048595:	c9                   	leave  
 8048596:	e9 75 ff ff ff       	jmp    8048510 <register_tm_clones>

0804859b <getName>:
 804859b:	55                   	push   ebp
 804859c:	89 e5                	mov    ebp,esp
 804859e:	83 ec 78             	sub    esp,0x78
 80485a1:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 80485a7:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 80485aa:	31 c0                	xor    eax,eax
 80485ac:	83 ec 0c             	sub    esp,0xc
 80485af:	68 30 87 04 08       	push   0x8048730
 80485b4:	e8 77 fe ff ff       	call   8048430 <printf@plt>
 80485b9:	83 c4 10             	add    esp,0x10
 80485bc:	83 ec 08             	sub    esp,0x8
 80485bf:	8d 45 90             	lea    eax,[ebp-0x70]
 80485c2:	50                   	push   eax
 80485c3:	68 47 87 04 08       	push   0x8048747
 80485c8:	e8 b3 fe ff ff       	call   8048480 <__isoc99_scanf@plt>
 80485cd:	83 c4 10             	add    esp,0x10
 80485d0:	83 ec 0c             	sub    esp,0xc
 80485d3:	68 4c 87 04 08       	push   0x804874c
 80485d8:	e8 53 fe ff ff       	call   8048430 <printf@plt>
 80485dd:	83 c4 10             	add    esp,0x10
 80485e0:	83 ec 0c             	sub    esp,0xc
 80485e3:	8d 45 90             	lea    eax,[ebp-0x70]
 80485e6:	50                   	push   eax
 80485e7:	e8 44 fe ff ff       	call   8048430 <printf@plt>
 80485ec:	83 c4 10             	add    esp,0x10
 80485ef:	83 ec 0c             	sub    esp,0xc
 80485f2:	6a 0a                	push   0xa
 80485f4:	e8 77 fe ff ff       	call   8048470 <putchar@plt>
 80485f9:	83 c4 10             	add    esp,0x10
 80485fc:	90                   	nop
 80485fd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 8048600:	65 33 05 14 00 00 00 	xor    eax,DWORD PTR gs:0x14
 8048607:	74 05                	je     804860e <getName+0x73>
 8048609:	e8 32 fe ff ff       	call   8048440 <__stack_chk_fail@plt>
 804860e:	c9                   	leave  
 804860f:	c3                   	ret    

08048610 <submitFeedback>:
 8048610:	55                   	push   ebp
 8048611:	89 e5                	mov    ebp,esp
 8048613:	81 ec 28 02 00 00    	sub    esp,0x228
 8048619:	65 a1 14 00 00 00    	mov    eax,gs:0x14
 804861f:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
 8048622:	31 c0                	xor    eax,eax
 8048624:	83 ec 0c             	sub    esp,0xc
 8048627:	68 73 87 04 08       	push   0x8048773
 804862c:	e8 ff fd ff ff       	call   8048430 <printf@plt>
 8048631:	83 c4 10             	add    esp,0x10
 8048634:	83 ec 04             	sub    esp,0x4
 8048637:	68 46 02 00 00       	push   0x246
 804863c:	8d 85 e4 fd ff ff    	lea    eax,[ebp-0x21c]
 8048642:	50                   	push   eax
 8048643:	6a 00                	push   0x0
 8048645:	e8 d6 fd ff ff       	call   8048420 <read@plt>
 804864a:	83 c4 10             	add    esp,0x10
 804864d:	83 ec 0c             	sub    esp,0xc
 8048650:	68 8e 87 04 08       	push   0x804878e
 8048655:	e8 f6 fd ff ff       	call   8048450 <puts@plt>
 804865a:	83 c4 10             	add    esp,0x10
 804865d:	90                   	nop
 804865e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 8048661:	65 33 05 14 00 00 00 	xor    eax,DWORD PTR gs:0x14
 8048668:	74 05                	je     804866f <submitFeedback+0x5f>
 804866a:	e8 d1 fd ff ff       	call   8048440 <__stack_chk_fail@plt>
 804866f:	c9                   	leave  
 8048670:	c3                   	ret    

08048671 <main>:
 8048671:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 8048675:	83 e4 f0             	and    esp,0xfffffff0
 8048678:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 804867b:	55                   	push   ebp
 804867c:	89 e5                	mov    ebp,esp
 804867e:	51                   	push   ecx
 804867f:	83 ec 04             	sub    esp,0x4
 8048682:	a1 34 a0 04 08       	mov    eax,ds:0x804a034
 8048687:	83 ec 08             	sub    esp,0x8
 804868a:	6a 00                	push   0x0
 804868c:	50                   	push   eax
 804868d:	e8 7e fd ff ff       	call   8048410 <setbuf@plt>
 8048692:	83 c4 10             	add    esp,0x10
 8048695:	e8 01 ff ff ff       	call   804859b <getName>
 804869a:	e8 71 ff ff ff       	call   8048610 <submitFeedback>
 804869f:	b8 00 00 00 00       	mov    eax,0x0
 80486a4:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 80486a7:	c9                   	leave  
 80486a8:	8d 61 fc             	lea    esp,[ecx-0x4]
 80486ab:	c3                   	ret    
 80486ac:	66 90                	xchg   ax,ax
 80486ae:	66 90                	xchg   ax,ax

080486b0 <__libc_csu_init>:
 80486b0:	55                   	push   ebp
 80486b1:	57                   	push   edi
 80486b2:	56                   	push   esi
 80486b3:	53                   	push   ebx
 80486b4:	e8 17 fe ff ff       	call   80484d0 <__x86.get_pc_thunk.bx>
 80486b9:	81 c3 47 19 00 00    	add    ebx,0x1947
 80486bf:	83 ec 0c             	sub    esp,0xc
 80486c2:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 80486c6:	8d b3 0c ff ff ff    	lea    esi,[ebx-0xf4]
 80486cc:	e8 07 fd ff ff       	call   80483d8 <_init>
 80486d1:	8d 83 08 ff ff ff    	lea    eax,[ebx-0xf8]
 80486d7:	29 c6                	sub    esi,eax
 80486d9:	c1 fe 02             	sar    esi,0x2
 80486dc:	85 f6                	test   esi,esi
 80486de:	74 25                	je     8048705 <__libc_csu_init+0x55>
 80486e0:	31 ff                	xor    edi,edi
 80486e2:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
 80486e8:	83 ec 04             	sub    esp,0x4
 80486eb:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 80486ef:	ff 74 24 2c          	push   DWORD PTR [esp+0x2c]
 80486f3:	55                   	push   ebp
 80486f4:	ff 94 bb 08 ff ff ff 	call   DWORD PTR [ebx+edi*4-0xf8]
 80486fb:	83 c7 01             	add    edi,0x1
 80486fe:	83 c4 10             	add    esp,0x10
 8048701:	39 f7                	cmp    edi,esi
 8048703:	75 e3                	jne    80486e8 <__libc_csu_init+0x38>
 8048705:	83 c4 0c             	add    esp,0xc
 8048708:	5b                   	pop    ebx
 8048709:	5e                   	pop    esi
 804870a:	5f                   	pop    edi
 804870b:	5d                   	pop    ebp
 804870c:	c3                   	ret    
 804870d:	8d 76 00             	lea    esi,[esi+0x0]

08048710 <__libc_csu_fini>:
 8048710:	f3 c3                	repz ret 

Disassembly of section .fini:

08048714 <_fini>:
 8048714:	53                   	push   ebx
 8048715:	83 ec 08             	sub    esp,0x8
 8048718:	e8 b3 fd ff ff       	call   80484d0 <__x86.get_pc_thunk.bx>
 804871d:	81 c3 e3 18 00 00    	add    ebx,0x18e3
 8048723:	83 c4 08             	add    esp,0x8
 8048726:	5b                   	pop    ebx
 8048727:	c3                   	ret    
