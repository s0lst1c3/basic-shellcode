#!/bin/sh
nasm -f elf32 -o execve.o execve.asm
ld -m elf_i386 -o execve execve.o
shellcode=$(objdump -d execve | grep 8048 | grep -v ">:" | cut -f2 | perl -p -e 's/ [ \n]*/\\x/g')

echo 'Generating shellcode:'
echo $shellcode
