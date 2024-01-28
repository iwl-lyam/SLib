bits 64
section .text

global print, read, exit

print:
  push rdi

  mov rsi,rax
  mov rdx,rbx
  mov rax,1
  mov rdi,1
  syscall
  
  pop rdi
  ret

read:
  push rdi
  
  mov rsi,rax
  mov rdx,rbx
  mov rax,0
  mov rdi,1
  syscall
  
  pop rdi
  ret

exit:
  mov rax,60
  mov rdi,0
  syscall
