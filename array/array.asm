section .text
	global _start

	_start:
    
    mov esi, 0
    print:
		mov eax, 4									                ; syscall to write
		mov ebx, 1									                ; write to stdout
        
    mov ecx, array                              ; pointer to output buffer
    add ecx, esi                                ; sum the esi to array move through array
    
    mov edx, 1                                  ; number of bytes to write
    int 0x80                                    ; make the interruption    
    
    inc esi                                     ; increment esi
    cmp esi, [len]                              ; compare
    jl  print 							                    ; jump to for if < 10

    exit:
		mov ebx, 0									                 ; error code 0
		mov eax, 1									                 ; syscall to exit
		int 0x80									                   ; make the interruption


section .data
    array       db '0','1','2','3','4','5','6','7','8','9'
    len         db 10