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
    jl .retl
    jg .retg
    cmp dl, 0
    je .rete
    inc rcx
    jmp .cmp

.retl:
    mov rax, -1
    ret
.retg:
    mov al, 1
    ret
.rete:
    mov al, 0
    ret
