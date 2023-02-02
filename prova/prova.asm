section .text
	global _start

	_start:
        ; open file to read
		mov eax, 5									; syscall to write
        mov ebx, [file1]    						; write to stdout
        mov ecx, 0                                  ; access mode - read
        mov edx, 777o
		int 0x80									; make the interruption

        ; open file to write
		mov eax, 8									; syscall to write
        mov ebx, [file2]    						; write to stdout
        mov edx, 744o
		int 0x80									; make the interruption







		mov ebx, 1									; write to stdout
		mov eax, 4									; syscall to write
		int 0x80									; make the interruption

		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data
    file1       db 'myfile1.txt'
    file2       db 'myfile2.txt'

section .bss
    x           resw
    y           resb