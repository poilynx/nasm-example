section .data
num1: dd 10, 20, 30, 40, 50, 10, 20, 30, 40, 50,300
total: dd 0
msg :  dd "arr[%d] = %d",10,0

section .text
    extern printf
    global main
main:
    push ebp
    mov ebp,esp
	mov eax,10
    mov ebx,num1 ;point bx to first number
    mov ecx,0    ;load 0
  
loop:

	;store the value because external function like printf modify the value
	push ebx
	push eax
	push ecx
	
	;print the value stored on stack
    push DWORD [ebx]
	push ecx
	push msg
    call printf
	;clear the stack
	add esp,12

	;restore thses values
	pop ecx
	pop eax
	pop ebx
	;increment the counter
	inc ecx
	;add 4 byte to ebx
	add ebx,4
	;compare value stored in ecx and eax
	cmp ecx,eax
	jne loop

	;destroy the stack
	mov esp,ebp
	pop ebp
	
	ret
