#!/bin/sh
nasm -f elf32 -o execve.o execve.asm
ld -m elf_i386 -o execve execve.o
