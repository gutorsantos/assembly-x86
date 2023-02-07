section .text
	global _start
	_start:

        ; mov ax, word 
        push word 'a'
        pop word ax
        mov [sum], ax
        ; mov sum, esp

        mov eax, 4
        mov ebx, 1
        mov ecx, sum
        mov edx, 1
		int 0x80									; make the interruption

		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption

section .data
    msg        db "ABC",0xa
section .bss
    sum         resb 1