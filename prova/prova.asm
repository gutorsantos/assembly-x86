section .text
	global _start

	sum:
		enter 0,0
		mov esi, [ebp+8]
		mov edx, [ebp+12]
		mov eax, 0
		mov ecx, dword 0

	sum_loop:
		mov bl, [esi+0]
		sub bl, '0'
		add eax, ebx

		inc ecx

		cmp ecx, edx
		jl sum_loop

	sum_ret:
		leave
		ret 8

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
		mov edx, [n]                                ; max num of bytes to be read
		int 0x80                                    ; make the interruption

        ; close file
        mov ebx, eax							    ; eax return the file descriptor that is the arg for ebx
		mov eax, 6									; syscall to close
		int 0x80	                                ; make the interruption

		push dword [n]
		push dword x
		call sum

		mov [y], eax
		add [y], byte '0'

        ; create and open
		mov eax, 8									; syscall to create and open
        mov ebx, file2    						    ; write to stdout
        mov ecx, 744o                               ; permission
		int 0x80									; make the interruption

		mov ebx, eax
		mov eax, 4
		mov ecx, y
		mov edx, 1
		int 0x80
        

        ; close file
        mov ebx, eax							    ; eax return the file descriptor that is the arg for ebx
		mov eax, 6									; syscall to close
		int 0x80                                    ; make the interruption


    exit:
		mov ebx, 0									; error code 0
		mov eax, 1									; syscall to exit
		int 0x80									; make the interruption


section .data
    file1       db 'prova/myfile1.txt',0
    file2       db 'prova/myfile2.txt',0
	n 			db 9

section .bss
    x           resb 100
    y           resb 1
