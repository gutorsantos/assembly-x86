section .text
	global _start

	_start:
        mov ecx, [num1]
        mov edx, [num2]
        add ecx, edx
        add ecx, '0'

        mov [sum], ecx                              ; ?
        
        mov ecx, sum
        mov edx, 1

		mov ebx, 1									; write to stdout
		mov eax, 4									; syscall to write
		int 0x80									; make the interruption

		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data
    num1        db 2
    num2        db 3

section .bss
    sum         resb 1