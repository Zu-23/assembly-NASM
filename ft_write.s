section .text
    global ft_write
    extern __errno_location

ft_write:
    mov rax, 1
    syscall

    cmp rax, 0
    jl .error
    ret

.error:
    neg rax
    mov rdi, rax
    
    call __errno_location wrt ..plt 
;The wrt ..plt notation stands for With Respect to Procedure Linkage Table. 
;It is a mandatory syntax rule in 64-bit Linux when your assembly code 
;calls an external function that lives inside a shared dynamic library (like libc). 
;It acts as a routing slip so the linker knows how to find the function.
                            
    mov [rax], rdi
    mov rax, -1
    ret

;when an error happens kernel sets a negative value inside rax
;but errno only accept positive value and we so we do neg rax
;we store rax value temp inside another register
;when we call errno_location we get the location of the errno variable inside the thread
;and it automatically stores it into RAX
;we then access that address in order to put the positive value inside errno
;after that we set rax with -1 to indicate write failed