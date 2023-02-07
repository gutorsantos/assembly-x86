section .text
	global _start

    _start:
        push dword num                              ; pass pointer to str as arg
        call str_len                                ; call str_len
        
        sub esi, 1                                  ; length without counting \0
        add esi, '0'                                ; convert to char
        mov [len], esi                              ; saving length in len

        mov eax, 4                                  ; syscall to write
        mov ebx, 1                                  ; write to stdout
        mov ecx, len                                ; buffer
        mov edx, 1                                  ; write one byte
        int 0x80									; make the interruption

    exit:
        mov ebx, 0									; error code 0
        mov eax, 1									; syscall to exit
        int 0x80									; make the interruption


    str_len:
        push ebp                                    ; saving ebp value
        mov ebp, esp                                ; pointing the base to same addr as esp

        mov eax, [ebp+8]                            ; accesing the arg of function
        mov edi, eax                                

        mov esi, 0

    str_len_loop:                                   ; loop through string characteres
        mov eax, [edi+esi]                          ; acessing a char of string
        mov [char], eax                             ; saving on char

        inc esi                                     ; incrementing
        cmp [char], byte 0                          ; compare
        jne str_len_loop                            ; while char != \0 read next char
    
    str_len_ret:
        pop ebp                                     ; removing old_ebp from stack
        ret                                         ; return

section .data
    num     db '0123456789',0

section .bss
    char    resb 1
    len     resb 1