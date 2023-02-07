section .text
	global _start

    _start:
        push dword num
        call str_2_int
        
        ; add eax, '0'
        ; mov [sum], eax

        ; mov eax, 4
        ; mov ebx, 1
        ; mov ecx, sum
        ; mov edx, 1
        ; int 0x80									; make the interruption

    exit:
        mov ebx, 0									; error code 0
        mov eax, 1									; syscall to exit
        int 0x80									; make the interruption

    str_2_int_loop:
        add esi, 4
        mov eax, [eax+esi]
        mov [char], eax
        mov eax, 4
        mov ebx, 1
        mov ecx, char
        mov edx, 1
        int 0x80	

        inc esi                                     ; incrementing
        cmp [char], byte 0                                 ; compare
        je str_2_int_loop
        ; jmp str_2_int_loop


    str_2_int:
        push ebp
        mov ebp, esp

        mov eax, [ebp+8]

        mov esi, 0
        jmp str_2_int_loop

        pop ebp
        ret

section .data
    num     db '1540'

section .bss
    char    resb 1