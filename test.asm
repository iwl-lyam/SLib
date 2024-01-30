bits 64
section .text

global _start
extern print,exit
extern convert_function

_start:
  mov rdx, start  ; Address of input string
  mov rax, obuf ; Address of output buffer
  mov r10, 0             ; 0 corresponds to atoi
  call convert_function

  ;lea rsi, [obuf]
  ;mov rdx, 4
  ;mov rax,[rsi]
  ;mul rdx
  ;mov [obuf],rax

  mov rdx, obuf  ; Address of input string
  mov rax, obuf2 ; Address of output buffer
  mov r10, 1             ; 1 corresponds to itoa
  call convert_function

  mov rax,obuf2
  mov rbx,8
  call print
  
  jmp exit

section .bss
obuf resb 8
obuf2 resb 8

section .data
start db "123",0