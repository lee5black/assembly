BITS 64

section .text
;int strlen_s(const char* msg)
global strlen_s
global _start

strlen_s:
    push rbp 
    mov rbp,rsp
    xor rax, rax 
    xor rbx, rbx 
loop:
    mov bl, byte [rdi]
    cmp bl, 0
    je loop_end
    inc rax 
    inc rdi 
    jmp loop

loop_end:
    leave
    ret 

_start:
;    push rbp
;    mov rbp,rsp
    xor rax, rax 
	xor rdx, rdx
	xor rbx, rbx
	xor r8, r8

    mov rdi, src 
    call strlen_s

	mov rcx, rax

	mov rdi, src
	mov rsi, dest 
   
strcmp_s:
	
	xor rdx, rdx
	xor rbx, rbx
	
	mov dl, byte [rdi]
	mov bl, byte [rsi]

	cmp dl, 0
	je strcmp_end
	cmp bl, 0
	je strcmp_end

	inc r8
	inc rdi
	inc rsi

	cmp dl, bl
	je strcmp_s


	mov dl, byte [rdi-1]
	mov bl, byte [rsi-1]
	cmp rdx, rbx
	ja first_big
	jmp second_big

	
strcmp_end:

	cmp rcx, r8
	je strcmp_0
	mov rax, 3
	call write_result

first_big:
	mov rax, 1
	call write_result

second_big:
	mov rax, -1
	call write_result


strcmp_0:
	mov rax, 0
	call write_result

write_result:
	leave
	ret

section .data
    src db "a", 0
	dest db "a", 0 
