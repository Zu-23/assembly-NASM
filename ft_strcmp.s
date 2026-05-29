section .text
global ft_strcmp

ft_strcmp:
    xor rax, rax
    xor rdx, rdx
    mov rcx, 0
.cmp:
    mov al, byte [rdi + rcx]
    mov dl, byte [rsi + rcx]
    sub al, dl
    jne .ret
    cmp dl, 0
    je .ret
    inc rcx
    jmp .cmp

.ret:
    ret