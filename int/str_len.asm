section .text
	global _start

    _start:
        push dword num
        call str_len
        
        add esi, '0'
        mov [len], esi

        mov eax, 4
        mov ebx, 1
        mov ecx, len
        mov edx, 1
        int 0x80									; make the interruption

    exit:
        mov ebx, 0									; error code 0
        mov eax, 1									; syscall to exit
        int 0x80									; make the interruption


    str_len:
        push ebp
        mov ebp, esp

        mov eax, [ebp+8]
        mov edi, eax

        mov esi, 0

    str_len_loop:
        ; add esi, 3
        mov eax, [edi+esi]
        mov [char], eax

        inc esi                                     ; incrementing
        cmp [char], byte 0                                 ; compare
        jne str_len_loop
    
    str_len_ret:
        pop ebp
        ret

section .data
    num     db '1540',0

section .bss
    char    resb 1
    len    resb 1