section .text
	global _start

    _start:
        mov eax, 0
        add al, [num]
        
    exit:
        mov ebx, 0									; error code 0
        mov eax, 1									; syscall to exit
        int 0x80									; make the interruption

section .data
    num     db 2
