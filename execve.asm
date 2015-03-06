global _start

section .data
	
	shell: db "/bin/sh", 0x0

section .bss

section .text

	_start:

	push 0x0
	push shell

	xor edx, edx
	mov ecx, esp
	mov ebx, shell
	mov eax, 0xb
	int 0x80

	; if we've made it this far, then execve has failed and 
	; we need to exit gracefully

	mov eax, 0x1
	xor ebx, ebx
	int 0x80
