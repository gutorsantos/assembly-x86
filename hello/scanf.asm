section .text
	global _start

	_start:
        mov esi, 0
    loop:
		mov eax, 3									; syscall to read
		mov ebx, 1									; read to stdout
		mov ecx, char                               ; buffer
		mov edx, 1                                  ; one byte
		int 0x80									; make the interruption
        
        mov al, [char]                              
        mov [string+esi], al                        ; append char to string
        
        inc esi
        
        cmp [char], byte 0xa                        ; while char != \n
        jne loop                                    ; read next char

    final:
        sub esi, 1                                  ; len without \0
        mov [len], esi                              ; saving length in len

        mov [string+esi], byte 0                    ; adding \0 to end of string

		mov eax, 4									; syscall to write
		mov ebx, 1									; write to stdout
		mov ecx, string
		mov edx, len
        int 0x80									; make the interruption

		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .bss
	char		resb 1                  ; db -> define byte | 0xa -> \n
    string      resb 1000
    len         resb 1