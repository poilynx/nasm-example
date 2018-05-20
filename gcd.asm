section .data
a : dd 12
b : dd 18
msg : db "GCD(%d,%d) = %d", 0Ah, 0

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

	mov eax ,dword [a]
	mov ebx,dword [b]
CONTD:
	cmp eax,0
	je L1
	cmp eax,ebx			;调整为EAX < EBX
	jge modulo
	xchg eax,ebx
modulo:
	cdq					;扩展EAX
	idiv ebx			;EAX/EBX，余数送EDX，商送至EAX
	mov eax,edx
	jmp CONTD
L1:
	mov eax,ebx
	push eax
	push dword [b]
	push dword [a]
	push msg
	call printf

	mov esp,ebp
	pop ebp
	ret
