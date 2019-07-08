BITS 64

section .text
; int a = 10

global _start

_start:
	push rbp
	mov rbp, rsp
	xor rax, rax
	sub rsp, 0x8
	mov DWORD [rbp-0x4], 0x10
	mov rax, [rbp-0x4]

	leave
	ret
