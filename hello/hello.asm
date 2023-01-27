section .text
	global _start

	_start:
		mov edx, len
		mov ecx, msg

		mov ebx, 1									; write to stdout
		mov eax, 4									; syscall to write
		int 0x80									; make the interruption

		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data
	msg		db 'Hello, world!',0xa                  ; db -> define byte | 0xa -> \n
	len		equ $ - msg                             ; comprimento da lindona