bits 64
section .text

global _start
extern print,exit,read
extern os_string_to_int
extern os_int_to_string

_start:
  mov rsi,start
  call os_string_to_int
  mov [obuf], rax

  mov rax,obuf3
  mov rbx,8
  call read

  mov rsi,obuf3
  call os_string_to_int
  mov [obuf3], rax

  lea rsi, [obuf]
  mov rdx, [obuf3]
  mov rax,[rsi]
  mul rdx
  mov [obuf],rax

  mov rax,[obuf]
  mov rdi,obuf2
  call os_int_to_string

  mov rax,obuf2
  mov rbx,8
  call print
  
  jmp exit

section .bss
obuf resb 8
obuf2 resb 8
obuf3 resb 8

section .data
start db "123",0