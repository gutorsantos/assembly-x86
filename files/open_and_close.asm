section .text
   global _start

   _start:
      ; open file
      mov eax, 5                        ; syscall to open file
      mov ebx, file                    ; filename
      mov ecx, 0                        ; access mode
      mov edx, 777o                     ; permission
		int 0x80	                         ; make the interruption

      ; close file
      mov ebx, eax                      ; passing file descriptor
      mov eax, 6                        ; syscall to close file
		int 0x80	                         ; make the interruption

   exit:
      mov ebx, 0								 ; error code 0
      mov eax, 1								 ; syscall to exit
      int 0x80									 ; make the interruption

section .data
   file		db 'files/file1.txt',0