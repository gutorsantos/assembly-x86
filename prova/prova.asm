section .text
	global _start

	_start:
        ; open file to read
		mov eax, 5									
        mov ebx, file1    		    				
        mov ecx, 0                                  ; access mode - read
        mov edx, 777o                               ; permission
		int 0x80									; make the interruption

        mov esi, eax
        add esi, '0'

        mov [sum], esi
        mov eax, 4									; syscall to write
        mov ebx, 1                                  ; write in stdout
        mov ecx, sum                               ; pointer to output buffer
        mov edx, 1                                  ; number of bytes to write
        int 0x80                                    ; interrupt to write

		; ; read file
		; mov ebx, eax                                ; eax return the file descriptor that is the arg for ebx
		; mov eax, 3                                  ; read mode
		; mov ecx, x                                  ; buffer to store the data read
		; mov edx, 4                                ; max num of bytes to be read
		; int 0x80                                    ; make the interruption

        ; ; close file
        ; mov ebx, eax							    ; eax return the file descriptor that is the arg for ebx
		; mov eax, 6									; syscall to close
		; int 0x80	                                ; make the interruption

        ; ; create and open
		; mov eax, 8									; syscall to create and open
        ; mov ebx, file2    						    ; write to stdout
        ; mov ecx, 744o                               ; permission
		; int 0x80									; make the interruption

        ; ; close file
        ; mov ebx, eax							    ; eax return the file descriptor that is the arg for ebx
		; mov eax, 6									; syscall to close
		; int 0x80                                    ; make the interruption

    again: 
        ; mov [sum], byte x       	                ; store value 0xa (\n) inside char
        ; mov eax, 4
        ; mov ebx, eax
        ; mov ecx, x
        ; mov edx, max_char
        ; cmp eax, 13
        ; je exit
        ; mov x[esi], eax
        ; inc esi
        ; inc ecx
        ; jmp again

    exit:
		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data
    file1       db 'myfile1.txt'
    file2       db 'myfile2.txt'
	max_char	db 100

section .bss
    x           resb 100
    y           resb 100
    sum         resb 1