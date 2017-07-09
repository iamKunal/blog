---
title: "Baby-Steps (50 points) [Security Mooc CTF]"
date: 2017-07-06 00:00:01 +0530
categories:
  - Write-ups
header:
  teaser: "https://i.imgur.com/bqFcAiS.png"
tags:
  - securitymooc
excerpt: ""
---
> This was part of a CTF conducted as an exercise during the [SecurityMooc](https://www.securitymooc.in) course organised by IIT Kanpur.

Here's the [file link](/assets/write-ups/securitymoocctf/baby_steps).

This is a very simple gdb exercise given to us.

```
I have lost my password, entering which to the program I will be able to enter a bank
account which has billion dollars. I assure you million dollars if you get the key for
me :) 
```
Let's run the file using `ltrace`:

```console
$ ltrace ./baby_steps 
__libc_start_main(0x80485cb, 1, 0xffbc6ca4, 0x80486e0 <unfinished ...>
fopen("/dev/urandom", "r")                       = 0x9a2c008
__isoc99_fscanf(0x9a2c008, 0x804876f, 0xffbc6b88, 0xf7739c08) = 1
fclose(0x9a2c008)                                = 0
printf("Enter the password: ")                   = 20
__isoc99_scanf(0x8048789, 0xffbc6b24, 0xffbc6b88, 0xf7739c08Enter the password: ABCD
) = 1
strcmp("ABCD", "\352\272y\231$\320\277O\3262\247,\331/y\365\254j\274\255") = -1
printf("Wrong password!!")                       = 16
Wrong password!!+++ exited (status 0) +++

```
The binary asks for a password and after our input, prints that it's wrong.
Let's disassemble `main()` and see what we can infer (`key` is correct password, `input` is our input):
{% highlight nasm%}
gdb-peda $ pdisas main
Dump of assembler code for function main:
   0x080485cb <+0>:	lea    ecx,[esp+0x4]
                 ..........
   0x080485ed <+34>:	push   0x8048760
   0x080485f2 <+39>:	push   0x8048762
   0x080485f7 <+44>:	call   0x80484a0 <fopen@plt>         "fopen("/dev/urandom", "r")  "
   0x080485fc <+49>:	add    esp,0x10
   0x080485ff <+52>:	mov    DWORD PTR [ebp-0xd8],eax      "bytes we get from urandom"
   0x08048605 <+58>:	sub    esp,0x4
   0x08048608 <+61>:	lea    eax,[ebp-0x70]
   0x0804860b <+64>:	push   eax
   0x0804860c <+65>:	push   0x804876f
   0x08048611 <+70>:	push   DWORD PTR [ebp-0xd8]
   0x08048617 <+76>:	call   0x8048450 <__isoc99_fscanf@plt>   "fscanf(bytes,"%s",&key)"
                 ..........
   0x08048643 <+120>:	lea    eax,[ebp-0xd4]                    
   0x08048649 <+126>:	push   eax
   0x0804864a <+127>:	push   0x8048789
   0x0804864f <+132>:	call   0x80484b0 <__isoc99_scanf@plt>    "Like scanf("%s",&input)"
   0x08048654 <+137>:	add    esp,0x10
   0x08048657 <+140>:	sub    esp,0x8
   0x0804865a <+143>:	lea    eax,[ebp-0x70]
   0x0804865d <+146>:	push   eax
   0x0804865e <+147>:	lea    eax,[ebp-0xd4]
   0x08048664 <+153>:	push   eax
   0x08048665 <+154>:	call   0x8048430 <strcmp@plt>   "Comparing our input with the key"
   0x0804866a <+159>:	add    esp,0x10
   0x0804866d <+162>:	test   eax,eax                  "Checking for equality"
   0x0804866f <+164>:	jne    0x80486a3 <main+216>     
   0x08048671 <+166>:	sub    esp,0xc                  "If pass and key are equal"
   0x08048674 <+169>:	push   0x8048790
   0x08048679 <+174>:	call   0x8048440 <printf@plt>
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
   0x080486a3 <+216>:	sub    esp,0xc                   "If pass and key unequal"
   0x080486a6 <+219>:	push   0x80487b8
                 ..........
   0x080486d0 <+261>:	ret    
End of assembler dump.
{% endhighlight %}

The program opens `/dev/urandom` and writes random bytes into they `key`.

If our input and the random bytes are equal, we fall through `0x0804866f <+164>:	jne    0x80486a3`.

Now this has 3 output statements:
```c
printf(0x8048440)
puts(0x804ad60)
puts(0x80487b5)
```
We can see these values by simply issuing a `x/s 0x8048440` and two others `x/s`'s for each address using gdb.

That subsequently leads to printing our flag:

```
Correct password!! The flag is flag{kH9h9skyxrgSZeN3oaqGnNo4amNJvhOa}
```
