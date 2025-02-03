[bits 64]

extern print, exit, read
extern os_int_to_string, os_string_to_int

section .text
global _start
_start:
    mov rax,msg
    mov rbx,len
    call print

    mov rax,fish_i
    mov rbx,four
    call read

    mov rsi,fish_i
    call os_string_to_int
    mov [fish],rax

    mov rax,msg2
    mov rbx,msg2len
    call print

    mov rax,chips_i
    mov rbx,four
    call read

    mov rsi,chips_i
    call os_string_to_int
    mov [chips],rax

    call debug

    mov rbx,[fish]

    add rax,rbx
    mov [sum],rax

    call exit

debug:
    ret

section .data
msg db "Perse program by lyam",10,"Enter number of fish: ",0
len equ $-msg

msg2 db "Enter number of chips: ",0
msg2len equ $-msg2

four equ 4
eight equ 8

section .bss
fish_i resb 2
chips_i resb 2
fish resb 4
chips resb 4
sum resb 6
deliveryq resb 1
obuf resb 8
