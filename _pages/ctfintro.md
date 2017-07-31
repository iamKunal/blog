<!------->
<!--title: ""-->
<!--layout: single-->
<!--permalink: /ctfintro/-->
<!--sitemap: false-->
<!------->

# Starting with CTF

Here's a little list of what will be covered in this write-up.

* TOC
{:toc}

## [WTF is CTF?](https://ctftime.org/ctf-wtf/)
*From [Wikipedia](https://en.wikipedia.org/wiki/Capture_the_flag):*
> Capture the flag (CTF) is a traditional outdoor game where two teams each have a flag (or other marker) and the objective is to capture the other team's flag, located at the team's "base," and bring it safely back to their own base.

Security CTFs are somewhat similar competitions, where multiple teams/players obtain flags (which further fetch points) either by securing their systems or conducting and preventing computer security related attacks.

There are many famous events which hold CTFs like [DEFCON](https://en.wikipedia.org/wiki/DEF_CON) (the world's largest hacker conventions) being the most prominent one. The NYU-CSAW (Cyber Security Awareness Week) is the largest student cyber-security contest. Many other companies and organisations like Google and TrendMicro also host CTFs.

## Why CTF?

### Hacking :computer:
CTFs are basically educational (and really fun) exercises in order to give experience in computer security (and thus computer hacking), which is a prime issue today. We all have heard about the WannaCry and Petya Ransomware which have taken over many industries incurring losses.

### It's fun and interesting
You will definitely find CTFs interesting if you are interested in any of the following:

1. The internet and securing yourself on it; website/webapp designing.
2. Reverse engineering stuff and then modifying to see if it works.
3. Messing around with things and making them work they are not supposed to, like entering a character on a friends's C program when it asks for an integer and then it goes into an infinite loop.
4. Mathematics! Yes, cryptography and many challenges require mathematical knowledge to solve them.
5. Tinkering around with your computer and trying to see how things work.

### Money :moneybag:
Since Cyber Security is a major growing concern, there is a demand of computer security experts in the real world.

`Demand = Jobs = Money for People who take up those jobs`

Also there are various bug bounty programs organised by companies and organisations like Google, Facebook, and recently Tor which award money to people who find bugs in their systems.
## What are the challenges/problems like?

The two main types are:
* **Jeopardy-style**: Challenges related to different categories with varying difficulties and points need to be solved and submitted to progress up the leaderboard.
* **Attack/Defense**: Each team is given a machine on an isolated network. The teams then need to defend their machines and attack the others to obtain flags to earn points.

Some of the categories of the problems are (just a broad classification):

1. **Web** - These challenges are mainly web app related. You may be given a URL and you may have to do an SQL Injection or bypass authentication or perform an XSS or CSRF.
2. **Reversing** - These generally provide an executable which implements an algorithm or certain check on your input or a secret key. If you are able to understand the algorithm/check and reverse-engineer it to get back the secret key - which is generally the flag, you have successfully solved it.
3. **Pwning** - Similar to reversing, you are provided an executable program but along with a server IP and port runnig the same program. You need to exploit the program to gain remote access or hijack it's control flow so as to read the flag on the server. These range may range from simple buffer overflows to very advanced exploits. 
4. **Cryptography** - As the name suggests, ranges attacking cipher techniques or weak cryptographic algorithms to very advanced stuff.
5. **Miscellaneous** - Everything not in the above categories. These may include things like steganography (hiding data in images, audio, etc.) and forensics, programming challenges, network sniffing, etc.

You can loosely correlate the types of problems with the respective interest [above](#its-fun-and-interesting).

## Where to start?

Be sure to learn a little about linux utilities like:
* `file` : Use it to know what type a given file is.
* `cat` : Print contents of a file.
* `strings` : Use it to print all strings/printable characters in a file.
* `grep` : Use it to print specific lines matching a given string or pattern from the input. (Use the `|` character - one above the enter key, to redirect output from one command [like `cat`] to another [like `grep`]. E.g. `cat main.c | grep hello` will show all lines in `main.c` containing `hello`).

You can start practicing on the following sites to kick-off:

* [Backdoor](https://backdoor.sdslabs.co/) : IIT Roorkee's CTF platform with n00bCTF being an event aimed especially for beginners. Checkout previous years' n00bCTF problems for [2017](https://backdoor.sdslabs.co/competitions/n00b17CTF/), [2016](https://backdoor.sdslabs.co/competitions/n00b16CTF/), and [2015](https://backdoor.sdslabs.co/competitions/n00b15CTF/). You can also go to tags and sort by category or CTF.
* [Root Me](https://www.root-me.org/) : Consists of many practice problems and learning resources grouped by categories and arranged by difficulty level.
* [We Chall](http://www.wechall.net/) : Contains a lot of challenges as well as an overview of popular challenge sites.
* [CTF Field Guide](https://trailofbits.github.io/ctf)
* [http://captf.com/practice-ctf/](http://captf.com/practice-ctf/)

[CTF-Time](https://ctftime.org/) is a great place to know about upcoming and past CTF events.

If you are ever stuck on a challenge for a lot of time or cannot figure it out even after reading the required resources, the write-ups for many problems are easily available on the internet or you can discuss with others and us as well!

## A sample problem.

Here's a very simple exercise.
> Given this file, you need to submit a flag from it.
> <form onsubmit="var flag=document.getElementById('flag');if(flag.value=='flag{Example_Flag}'){flag.style='border:2px solid green';alert('Correct Flag!');}else{flag.style='border:2px solid orangered';alert('Wrong Flag!');};return false;">
> <input id="flag" type="text" placeholder="Enter Flag Here" required autocomplete="off" />
> </form>

Let's open up the terminal and run the `file` command.

```console
$ file example
example: ELF 32-bit LSB shared object, Intel 80386, version 1 (SYSV)
```
[ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format) is used for executable files under linux.
So we try to run it.

```console
$ chmod +x example #Give it executable permissions
$ ./example
$
```

We get no output, so we do a `strings` on it.

```console
$ strings example
/lib/ld-linux.so.2
libc.so.6
_IO_stdin_used
-- A lot of strings --
flag{Example_Flag}       #Here's the flag
-- A lot of strings --
.data
.bss
.comment
```
You can also get only the line containing the word `flag` by:

```console
$ strings example | grep flag
flag{Example_Flag}
```
Try entering the flag [here](#a-sample-problem), it accepts it!

### The code

The C-Code for the above problem is given below, you can tinker with it:
```c
int main(){
	char *flag="flag{Example_Flag}";
	return 0;
}
```

Happy Hacking!


