section .text
	global _start

	_start:
        ; open file to read
		mov eax, 5                                  ; syscall to open
        mov ebx, file1    		    				; filename
        mov ecx, 0                                  ; access mode - read
        mov edx, 777o                               ; permission
		int 0x80									; make the interruption

		; read file
		mov ebx, eax                                ; eax return the file descriptor that is the arg for ebx
		mov eax, 3                                  ; read mode
		mov ecx, x                                  ; buffer to store the data read
		mov edx, 100                                ; max num of bytes to be read
		int 0x80                                    ; make the interruption

		mov eax, 4
        mov ebx, 1
        mov ecx, x
        mov edx, 1
        int 0x80

        ; close file
        mov ebx, eax							    ; eax return the file descriptor that is the arg for ebx
		mov eax, 6									; syscall to close
		int 0x80	                                ; make the interruption

        ; create and open
		mov eax, 8									; syscall to create and open
        mov ebx, file2    						    ; write to stdout
        mov ecx, 744o                               ; permission
		int 0x80									; make the interruption


        

        ; close file
        mov ebx, eax							    ; eax return the file descriptor that is the arg for ebx
		mov eax, 6									; syscall to close
		int 0x80                                    ; make the interruption


    exit:
		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data
    file1       db 'myfile1.txt',0
    file2       db 'myfile2.txt',0
	max_char	db 100

section .bss
    x           resb 100
    y           resb 100
    sum         resb 1