section .text
	global _start

	_start:
    
    mov esi, 0                                      ; init esi
    for:
		mov eax, 4									; syscall to write
		mov ebx, 1                                  ; write in stdout

        add esi, '0'                                ; converting to char
        mov [char], esi	                            ; store esi value inside char
        sub esi, '0'                                ; converting to int

        mov ecx, char                               ; pointer to output buffer
        mov edx, 1                                  ; number of bytes to write
        int 0x80                                    ; interrupt to write
        
        mov [char], byte 0xa	                    ; store value 0xa (\n) inside char
        mov eax, 4									; syscall to write
		mov ebx, 1                                  ; write in stdout
        mov ecx, char                               ; pointer to output buffer
        mov edx, 1                                  ; number of bytes to write
        int 0x80                                    ; interrupt to write

        inc esi                                     ; incrementing
        cmp esi, 10                                 ; compare
        jl  for 							        ; jump to for if < 10

    exit:
		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data

section .bss
    char         resb 1