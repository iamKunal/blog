---
title: "[SecurityMoocCTF] Drunk Coder (100 points)"
date: 2017-07-06 00:00:04 +0530
categories:
  - Write-ups
header:
  teaser: "https://i.imgur.com/jDYN8Iw.png"
tags:
  - securitymooc
excerpt: ""
---
Here's the [file link](/assets/write-ups/securitymoocctf/drunk_coder).


```
Coder who wrote this code was not happy with his salary hike and left the company without
handing over the source. We could manage to get the binary file somehow, can you help us
find the secret. Use nc 52.7.95.224 8060 to connect to server.
```
Let's run the file using `ltrace`:

```console
$ ltrace ./drunk_coder 
__libc_start_main(0x804865b, 1, 0xffb1f984, 0x8048810 <unfinished ...>
setbuf(0xf76c5d60, 0)                            = <void>
puts("How many bytes you want to read "...How many bytes you want to read from file
)      = 42
__isoc99_scanf(0x80488ba, 0xffb1f88c, 0xc10000, 01234567890
) = 1
printf("Reading %d bytes\n", 1234567890Reading 1234567890 bytes
)         = 25
puts("You will be banned if you brutef"...You will be banned if you bruteforce...
)      = 40
time(0)                                          = 1499196786
sleep(36)                                        = 0
read(01234567890
, "1234567890\n", 1234567890)              = 11
atoi(0xffb1f8ac, 0xffb1f8ac, 0x499602d2, 0)      = 0x499602d2
puts("Sorry Password in file is wrong"Sorry Password in file is wrong
)          = 32
+++ exited (status 0) +++
```
The binary asks for number of bytes to read and then we are asked for an input after a brief `sleep()`.

Let's observe the disassembly and understand the `ltrace` calls.
{% highlight nasm%}
$ pdisas main
Dump of assembler code for function main:
   0x0804865b <+0>:	lea    ecx,[esp+0x4]
                 ..........
   0x0804867d <+34>:	xor    eax,eax
   0x0804867f <+36>:	mov    DWORD PTR [ebp-0x48],0x274
   0x08048686 <+43>:	mov    DWORD PTR [ebp-0x44],0x4
   0x0804868d <+50>:	mov    DWORD PTR [ebp-0x40],0x19ba83ef
   0x08048694 <+57>:	mov    eax,DWORD PTR [ebp-0x48]
   0x08048697 <+60>:	neg    eax
   0x08048699 <+62>:	imul   eax,DWORD PTR [ebp-0x48]
   0x0804869d <+66>:	imul   eax,DWORD PTR [ebp-0x48]
   0x080486a1 <+70>:	imul   eax,DWORD PTR [ebp-0x44]
   0x080486a5 <+74>:	mov    edx,eax
   0x080486a7 <+76>:	mov    eax,DWORD PTR [ebp-0x40]       "Some operations done &"
   0x080486aa <+79>:	add    eax,edx                        "result stored in [ebp-0x3c]"
   0x080486ac <+81>:	mov    DWORD PTR [ebp-0x3c],eax
   0x080486af <+84>:	mov    DWORD PTR [ebp-0x38],0x0
                 ..........
   0x080486dc <+129>:	lea    eax,[ebp-0x4c]
   0x080486df <+132>:	push   eax
   0x080486e0 <+133>:	push   0x80488ba
   0x080486e5 <+138>:	call   0x8048520 <__isoc99_scanf@plt> "No. of bytes asked"
                 ..........
   0x0804874e <+243>:	push   eax
   0x0804874f <+244>:	lea    eax,[ebp-0x2c]
   0x08048752 <+247>:	push   eax
   0x08048753 <+248>:	push   DWORD PTR [ebp-0x38]
   0x08048756 <+251>:	call   0x80484a0 <read@plt>           "Read from stdin"
                 ..........
   0x08048797 <+316>:	lea    eax,[ebp-0x2c]
   0x0804879a <+319>:	push   eax
   0x0804879b <+320>:	call   0x8048530 <atoi@plt>           "atoi(input)"
   0x080487a0 <+325>:	add    esp,0x10
   0x080487a3 <+328>:	xor    eax,0xabbebabe                 "input ^ 0xabbebabe"
   0x080487a8 <+333>:	mov    DWORD PTR [ebp-0x30],eax
   0x080487ab <+336>:	mov    eax,DWORD PTR [ebp-0x3c]
   0x080487ae <+339>:	cmp    eax,DWORD PTR [ebp-0x30]       "Compared against [ebp-0x3c]"
   0x080487b1 <+342>:	jne    0x80487d5 <main+378>
   0x080487b3 <+344>:	sub    esp,0xc
   0x080487b6 <+347>:	push   0x8048909
   0x080487bb <+352>:	call   0x80484f0 <puts@plt>
   0x080487c0 <+357>:	add    esp,0x10
   0x080487c3 <+360>:	sub    esp,0xc
   0x080487c6 <+363>:	push   0x804891c
   0x080487cb <+368>:	call   0x8048500 <system@plt>         "We get the flag here"
   0x080487d0 <+373>:	add    esp,0x10
   0x080487d3 <+376>:	jmp    0x80487e5 <main+394>
   0x080487d5 <+378>:	sub    esp,0xc                        "Wrong Password"
   0x080487d8 <+381>:	push   0x8048930
   0x080487dd <+386>:	call   0x80484f0 <puts@plt>
                 ..........
   0x08048802 <+423>:	ret    
End of assembler dump.
{% endhighlight %}

The following things happen:
1. Now, first we are asked for the length of input, and then our input is converted to integer.
2. Input is xor'ed with `0xabbebabe`.
3. Input is tested against `[ebp-0x3c]`.

With gdb we get `[ebp-0x3c]` = `0xdeadbeef`.

```
       input ^ 0xabbebabe = 0xdeadbeef
Thus,  input = 0xabbebabe ^ 0xdeadbeef = 1964180561 (From python).
```
Thus we get the flag:

```console
$ nc 52.7.95.224 8060
How many bytes you want to read from file
10
Reading 10 bytes
You will be banned if you bruteforce...
1964180561
OK Here's the flag
flag{lBa3ohgOmuMZmVqP3sESLhC3Vi2fMuCT}
```
