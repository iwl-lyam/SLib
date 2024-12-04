bits 64

extern print, exit, read
extern openOrCreateFile
extern os_int_to_string, writeFD
section .text
global _start
_start:
    mov rax, msg 
    mov rbx, 7
    call print

    mov rax, obuf
    mov rbx, 16
    call read

    xor rdx, rdx
    mov rax, obuf
    mov rbx, fdbuf
    mov rdx, mode
    call openOrCreateFile

    mov rax, msg2
    mov rbx, msg2_l
    call print

    mov rax, obuf
    mov rbx, 16
    call read

    mov rax, [fdbuf]
    mov rbx, obuf
    mov rdx, 16
    call writeFD

    mov rax, [fdbuf]
    cmp rax, 0
    jl fail

    jmp exit

fail:
    mov rax, failed
    mov rbx, failed_l
    call print

    jmp exit

section .data
msg db "File: ",0
msg2 db "Content: ",0
msg2_l equ $-msg2
failed db "Failed to open file",10,0
failed_l equ $-failed
mode dd 0666

section .bss
obuf resb 16
fdbuf resb 8
failbuf resb 9
