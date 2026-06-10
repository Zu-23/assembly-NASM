section .text
global ft_strcpy

ft_strcpy:
    mov rax, rdi            
    mov rcx, 0              
.copy:
    mov dl, byte [rsi + rcx]    
    mov byte [rdi + rcx], dl    
    cmp dl, 0                   
    je .eof                 
    inc rcx                 
    jmp .copy              
.eof:
    ret                     