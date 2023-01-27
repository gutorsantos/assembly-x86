section .text
	global _start

	_start:
        mov ecx, num1
        mov edx, num2
        add ecx, edx

        mov edx, len
        ; mov ecx, ah

		mov ebx, 1									; write to stdout
		mov eax, 4									; syscall to write
		int 0x80									; make the interruption

		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data
    num1        dd 2
    num2        dd 3
    len         db 32