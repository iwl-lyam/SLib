BITS 32

section .text
global _start
_start:
    mov eax,3
    mov ebx,0
    mov ecx,obuf
    mov edx,10
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,obuf
    mov edx,10
    int 0x80

    mov eax,1
    mov ebx,0
    int 0x80

section .bss
obuf resb 10