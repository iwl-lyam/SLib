bits 64
section .text

global _start
extern print,exit,read
extern os_string_to_int
extern os_int_to_string

loop:
  push rcx
  mov rax,dash
  mov rbx,2
  call print

  pop rcx
  
  dec rcx
  jmp looph

looph:
  cmp rcx,0
  jz done
  
  jmp loop

done:
  ret

_start:
  
  mov rax,obuf
  mov rbx,8
  call read

  mov rax,open
  mov rbx,2
  call print

  mov rsi,obuf
  call os_string_to_int
  sub rax,2
  mov rcx,rax

  call looph

  mov rax,close
  mov rbx,2
  call print
  
  jmp exit

section .data
dash db "-",0
open db "<",0
close db ">",0

section .bss
obuf resb 8
obuf2 resb 8
obuf3 resb 8
