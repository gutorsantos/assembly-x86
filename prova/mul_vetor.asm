section .text
	global _start
	_start:
		push dword [n]
		push dword b
		push dword a
		call f4

    exit:
        mov eax, 1
        mov ebx, 0
        int 0x80

	f4:
		enter 8,0
		mov [ebp-4], dword 0
		mov [ebp-8], dword 0
		mov esi, [ebp+8]
		mov edi, [ebp+12]
		mov ecx, [ebp+16]
		sub ecx, 1
		mov edx, [ebp+16]
		sub edx, 1
	f4_a_loop:
        mov ax, [esi+2*ecx]

		f4_b_loop:
			mov ebx, dword [edi+2*edx]
			imul bx, ax
			
		    add [ebp-4], ebx
			dec edx
			cmp edx, dword 0
			jge f4_b_loop

		dec ecx
		cmp ecx, dword 0
		jge f4_a_loop

		
		mov eax, [ebp-4]
		leave
		ret 12
	
		

section .data
	a dw 1,2,3,4,5,6,7,8,9,10
	b dw -1,10,-3,8,-5,6,-7,4,-9,2
	n dd 10

section .bss