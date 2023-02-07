section .text
	global _start
    
    _start:

        push 3
        push 2
        call add
        
        add eax, '0'
        mov [sum], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, sum
        mov edx, 1
        int 0x80									; make the interruption

        mov ebx, 0									; error code 0
        mov eax, 1									; syscall to exit
        int 0x80									; make the interruption

    add:
        push ebp
        mov ebp, esp

        mov ebx, [ebp+12]
        mov eax, [ebp+8]

        add eax, ebx
        pop ebp
        ret

section .bss
    sum         resb 1