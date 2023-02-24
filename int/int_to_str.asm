section .text
	global _start

    _start:     
        push dword num
        call int_size

    exit:
        mov ebx, 0									; error code 0
        mov eax, 1									; syscall to exit
        int 0x80									; make the interruption

    int_size:
        push ebp
        mov ebp, esp

        mov al, [ebp+8]
        mov cx, 10
        mov bx, 0

    int_size_loop:
        xor edx, edx
        div cx

        inc bx
        cmp eax, 0
        jne int_size  

    int_size_ret:
        pop ebp
        ret

section .data
    num     dd -0754

section .bss
    char    resb 1
    len     resb 1