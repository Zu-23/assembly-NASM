;1ST ARG RDI. 2ND ARG RSI


section .text
global ft_strcpy

ft_strcpy:
    mov rax, rdi           
    mov rcx, 0              
.copy:
    mov al, byte [rsi + rcx]
    mov byte [rdi + rcx], al
    cmp al, 0
    je .eof                 
    inc rcx                 
    jmp .copy              
.eof:
    ret