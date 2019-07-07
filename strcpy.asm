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
    ;push rbp
    ;mov rbp,rsp
    xor rax, rax
    xor rbx, rbx
    xor rdx, rdx

    mov rdi, src
    call strlen_s

    mov rdi, src 
    mov rsi, dest
    mov rcx,rax
    cmp rcx, 0
    je strcpy_loop_end
strcpy_loop:
    mov dl, byte [rdi]
    mov byte [rsi], dl
    inc rdi
    inc rsi
    loop strcpy_loop

    mov byte [rsi], 0

strcpy_loop_write:
    
    

    mov rdi, 1
    mov rsi, dest
    mov rdx, 0xc
    mov rax, 1
    syscall



strcpy_loop_end:
    mov rax, 60 
    syscall 
    ;mov rax, dest 
    ;leave 
    ;ret 



section .bss 
    dest resb 20

section .data
    src db "hello world", 0 
