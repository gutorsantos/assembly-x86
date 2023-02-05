section .text
    global _start

    _start:
        ; create and open file
        mov eax, 8                        ; syscall to open file
        mov ebx, file                     ; filename
        mov ecx, 777o                     ; permission
        int 0x80	                      ; make the interruption

        ; print to file
        mov ebx, eax                      ; stdout as output buffer
        mov eax, 4                        ; syscall to write
        mov ecx, hello                    ; input
        mov edx, len                      ; num of bytes
        int 0x80                          ; make the interruption

        ; close file
        mov ebx, eax                      ; passing file descriptor
        mov eax, 6                        ; syscall to close file
        int 0x80	                      ; make the interruption

   exit:
        mov ebx, 0			              ; error code 0
        mov eax, 1						  ; syscall to exit
        int 0x80						  ; make the interruption

section .data
    file	db 'files/file2.txt',0
    hello   db 'Hello, World!'
    len     equ $ - hello

section .bss
    char    resb 1