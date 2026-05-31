section .text
global ft_strdup
extern ft_strlen
extern ft_strcpy   
extern malloc

ft_strdup:
    call ft_strlen      
    
    push rdi            
    inc rax             
    mov rdi, rax        
    call malloc wrt ..plt 
    cmp rax, 0          
    je .malloc_error    
    pop rsi             
    mov rdi, rax        
    call ft_strcpy       
    ret                 

.malloc_error:
    pop rdi             
    xor rax, rax        
    ret