section .data
str : db 'Hello world',10,0
fmt : db "Length=%d",10,0

section .text
extern printf
global main
main:
	push ebp
	mov ebp,esp
	
	mov ebx,str
	push ebx
	mov ecx,0
	dec ebx
.count:
	inc ecx
	inc ebx
	cmp byte[ebx], 0
	jnz .count
	mov eax,ecx
	
	dec ecx
	push eax
	push fmt
	call printf
	
	mov esp,ebp
	pop ebp
	ret
