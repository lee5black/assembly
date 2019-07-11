BITS 64

section .text

global _start

_start:
	push rbp
	mov rbp, rsp
	
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx	

	sub rsp, 40

;	rbx = arr pointer

	lea rbx, [rbp-40]
	mov rcx, 0x1

loop:
	mov dword [rbx] , ecx
	cmp rcx, 10
	je loop_end
	add rbx, 0x1
	inc rcx
	jmp loop

loop_end:

	leave
	ret
