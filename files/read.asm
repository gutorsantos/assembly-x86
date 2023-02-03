section .text
    global _start

    _start:
        ; open file
        mov eax, 5                        ; syscall to open file
        mov ebx, file                     ; filename
        mov ecx, 0                        ; access mode
        mov edx, 777o                     ; permission
        int 0x80	                      ; make the interruption

        ; read file
        mov ebx, eax                      ; passing the file descriptor
        mov eax, 3                        ; syscall to read
        mov ecx, char                     ; buffer
        mov edx, 1                        ; num of bytes to be read
        int 0x80

        ; print to screen
        mov eax, 4                        ; syscall to write
        mov ebx, 1                        ; stdout as output buffer
        mov ecx, char                     ; input
        mov edx, 1                        ; num of bytes
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
    file	db 'files/file1.txt',0

section .bss
    char    resb 1