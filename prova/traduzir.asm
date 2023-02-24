section .text
	global _start

    ; int square(int a) {
    ;   return a*a
    ; }
    ; 
    ; 
    ;     
    ; 
    ; 
    ; 

    square:
        enter 0,0

        mov eax, [ebp+8]
        mov ebx, [ebp+8]

        imul eax, ebx

        leave
        ret 4



    _start:

        push dword [a]
        call square



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
