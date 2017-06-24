---
title: "[SecurtyMoocCTF] Baby-Steps (50 points)"
categories:
  - Write-ups
header:
  teaser: "https://i.imgur.com/bqFcAiS.png"
tags:
  - securitymooc
excerpt: ""
---
Here's the [file link](/assets/write-ups/securitymoocctf/baby_steps).

This is a very simple gdb exercise given to us.

```
I have lost my password, entering which to the program I will be able to enter a bank
account which has billion dollars. I assure you million dollars if you get the key for
me :) 
```
Let's run the file:

```console
$ ./baby_steps
Enter the password: Hello
Wrong password!!
```
Okay so it asks for a password and prints that it's wrong.
Let's disassemble the file and look at `main()` and see what we can infer:
{% highlight nasm%}
gdb-peda $ pdisas main
Dump of assembler code for function main:
   0x080485cb <+0>:	lea    ecx,[esp+0x4]
   0x080485cf <+4>:	and    esp,0xfffffff0
   0x080485d2 <+7>:	push   DWORD PTR [ecx-0x4]
   0x080485d5 <+10>:	push   ebp
   0x080485d6 <+11>:	mov    ebp,esp
   0x080485d8 <+13>:	push   ecx
   0x080485d9 <+14>:	sub    esp,0xd4
   0x080485df <+20>:	mov    eax,gs:0x14
   0x080485e5 <+26>:	mov    DWORD PTR [ebp-0xc],eax
   0x080485e8 <+29>:	xor    eax,eax
   0x080485ea <+31>:	sub    esp,0x8
   0x080485ed <+34>:	push   0x8048760
   0x080485f2 <+39>:	push   0x8048762
   0x080485f7 <+44>:	call   0x80484a0 <fopen@plt>          << Opens file [0x8048762]
   0x080485fc <+49>:	add    esp,0x10
   0x080485ff <+52>:	mov    DWORD PTR [ebp-0xd8],eax       << Bytes we get from the file
   0x08048605 <+58>:	sub    esp,0x4
   0x08048608 <+61>:	lea    eax,[ebp-0x70]
   0x0804860b <+64>:	push   eax
   0x0804860c <+65>:	push   0x804876f
   0x08048611 <+70>:	push   DWORD PTR [ebp-0xd8]     << fscanf(bytes,"%s",&input)
   0x08048617 <+76>:	call   0x8048450 <__isoc99_fscanf@plt>
   0x0804861c <+81>:	add    esp,0x10
   0x0804861f <+84>:	sub    esp,0xc
   0x08048622 <+87>:	push   DWORD PTR [ebp-0xd8]
   0x08048628 <+93>:	call   0x8048460 <fclose@plt>
   0x0804862d <+98>:	add    esp,0x10
   0x08048630 <+101>:	sub    esp,0xc
   0x08048633 <+104>:	push   0x8048774
   0x08048638 <+109>:	call   0x8048440 <printf@plt>
   0x0804863d <+114>:	add    esp,0x10
   0x08048640 <+117>:	sub    esp,0x8
   0x08048643 <+120>:	lea    eax,[ebp-0xd4]                    << Our input
   0x08048649 <+126>:	push   eax
   0x0804864a <+127>:	push   0x8048789
   0x0804864f <+132>:	call   0x80484b0 <__isoc99_scanf@plt>    << Like scanf("%s",&input)
   0x08048654 <+137>:	add    esp,0x10
   0x08048657 <+140>:	sub    esp,0x8
   0x0804865a <+143>:	lea    eax,[ebp-0x70]
   0x0804865d <+146>:	push   eax
   0x0804865e <+147>:	lea    eax,[ebp-0xd4]
   0x08048664 <+153>:	push   eax
   0x08048665 <+154>:	call   0x8048430 <strcmp@plt>   << Comparing our input with the key
   0x0804866a <+159>:	add    esp,0x10
   0x0804866d <+162>:	test   eax,eax                  << Checking for equality
   0x0804866f <+164>:	jne    0x80486a3 <main+216>     << & Jumping if not equal
   0x08048671 <+166>:	sub    esp,0xc
   0x08048674 <+169>:	push   0x8048790
   0x08048679 <+174>:	call   0x8048440 <printf@plt>   << If pass and key are equal
   0x0804867e <+179>:	add    esp,0x10
   0x08048681 <+182>:	sub    esp,0xc
   0x08048684 <+185>:	push   0x804ad60
   0x08048689 <+190>:	call   0x8048480 <puts@plt>
   0x0804868e <+195>:	add    esp,0x10
   0x08048691 <+198>:	sub    esp,0xc
   0x08048694 <+201>:	push   0x80487b5
   0x08048699 <+206>:	call   0x8048480 <puts@plt>
   0x0804869e <+211>:	add    esp,0x10
   0x080486a1 <+214>:	jmp    0x80486b3 <main+232>
   0x080486a3 <+216>:	sub    esp,0xc                   << Not equal leads to wrong pass
   0x080486a6 <+219>:	push   0x80487b8
   0x080486ab <+224>:	call   0x8048440 <printf@plt>
   0x080486b0 <+229>:	add    esp,0x10
   0x080486b3 <+232>:	mov    eax,0x0
   0x080486b8 <+237>:	mov    edx,DWORD PTR [ebp-0xc]
   0x080486bb <+240>:	xor    edx,DWORD PTR gs:0x14
   0x080486c2 <+247>:	je     0x80486c9 <main+254>
   0x080486c4 <+249>:	call   0x8048470 <__stack_chk_fail@plt>
   0x080486c9 <+254>:	mov    ecx,DWORD PTR [ebp-0x4]
   0x080486cc <+257>:	leave  
   0x080486cd <+258>:	lea    esp,[ecx-0x4]
   0x080486d0 <+261>:	ret    
{% endhighlight %}
Unfortunately, doing a quick `x/s 0x8048762` tells us that the program opens `/dev/urandom/` so our input is compared to random bytes.

Since we have the file locally (no server side), we can just simply issue a `goto 0x08048671` in `gdb` after running the program and setting a breakpoint at `0x0804866f <+164>:	jne    0x80486a3` (our comparison jump).

That subsequently leads to printing our flag:

```liquid
flag{kH9h9skyxrgSZeN3oaqGnNo4amNJvhOa}
```
