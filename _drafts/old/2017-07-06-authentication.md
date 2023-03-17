---
title: "[SecurityMoocCTF] Authentication (100 points)"
categories:
  - Write-ups
header:
  teaser: "https://i.imgur.com/ptHkEPe.png"
tags:
  - securitymooc
excerpt: ""
---
Here's the [file link](/assets/write-ups/securitymoocctf/auth).

```
IB HeadQuarter has received a binary from it's agent, supposed to be containing a key
which will allow them to take control of enemy country nuke facility. See if you can find
something userful. Here is the binary file. Use nc 52.7.95.224 8050 to connect to server.
```
Let's run the file with ltrace (I created a `flag.txt` with content `flag{ABCDEFGHIJKLMNOPQRSTUVWXYZ}`):

```console
$ ltrace ./auth
__libc_start_main(0x804867b, 1, 0xffa86b54, 0x8048880 <unfinished ...>
setbuf(0xf7787d60, 0)                            = <void>
fopen("flag.txt", "r")                           = 0x91de008
__isoc99_fscanf(0x91de008, 0x8048925, 0xffa8694c, 0xf772f702) = 1
puts("Enter the flag\n"Enter the flag

)                         = 16
__isoc99_scanf(0x8048925, 0xffa86974, 0xffa8694c, 0xf772f702heyy
) = 1
snprintf("heyy", 247, "heyy")                    = 4
strcmp("heyy", "flag{ABCDEFGHIJKLMNOPQRSTUVWXYZ}"...) = 1
snprintf(" which is incorrect!!\n", 243, " which is incorrect!!\n") = 22
puts("You said heyy which is incorrect"...You said heyy which is incorrect!!

)      = 36
+++ exited (status 0) +++

```

The calls are:
1. An `fopen("flag.txt","r")` and reading the flag from that file.
2. `scanf()` call for our input.
3. `snprintf()` to a string using our input (without any `%s`).
4. Using `puts()` on the final string.

The [dissassembly](/assets/write-ups/securitymoocctf/auth.asm) tells us the same.

Since `printf()` and `snprintf()` work on the same principle, we can try printing out the stack and see whether we can 
Let's disassemble `main()` and see what we can infer:
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
   0x080485f7 <+44>:	call   0x80484a0 <fopen@plt>          "Opens file [0x8048762]"
   0x080485fc <+49>:	add    esp,0x10
   0x080485ff <+52>:	mov    DWORD PTR [ebp-0xd8],eax       "Bytes we get from the file"
   0x08048605 <+58>:	sub    esp,0x4
   0x08048608 <+61>:	lea    eax,[ebp-0x70]
   0x0804860b <+64>:	push   eax
   0x0804860c <+65>:	push   0x804876f
   0x08048611 <+70>:	push   DWORD PTR [ebp-0xd8]           "fscanf(bytes,"%s",&key)"
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
   0x08048643 <+120>:	lea    eax,[ebp-0xd4]                    "Our input"
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
End of assembler dump.
{% endhighlight %}

Doing a quick `x/s 0x8048762` tells us that the program opens `/dev/urandom` so our input is compared to random bytes.

If our input and the random bytes are equal, we fall through `0x0804866f <+164>:	jne    0x80486a3`.

Now this has 3 output statements:
```c
printf(0x8048440)
puts(0x804ad60)
puts(0x80487b5)
```
We can see these values by simply issuing a `x/s 0x8048440` and two others `x/s`'s for each address.

That subsequently leads to printing our flag:

```
Correct password!! The flag is flag{kH9h9skyxrgSZeN3oaqGnNo4amNJvhOa}
```
