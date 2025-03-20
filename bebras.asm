; pig latin challenge
bits 64
section .text
extern print, exit, read

global _start
_start:
    mov rax,msg
    mov rbx,len
    call print

    mov rax,ibuf
    mov rbx,20
    call read

    mov rcx,0
    mov rdx,0
    jmp lloop

enterloop:
    cmp rdx,10
    je end
    inc rcx
    jmp lloop

lloop:
    ; rcx - counter, rdx - char
    mov dl, [ibuf + rcx]
    jmp enterloop

end:
    cmp byte [ibuf], 0x65
    je end_vowel
    cmp byte [ibuf], 0x61
    je end_vowel
    cmp byte [ibuf], 0x69
    je end_vowel
    cmp byte [ibuf], 0x6f
    je end_vowel
    cmp byte [ibuf], 0x75
    je end_vowel

    mov [count],rcx
    mov al, byte [ibuf]
    mov [ibuf + rcx], byte "-"
    add rcx,1
    mov [ibuf + rcx], al
    add rcx,1
    mov [ibuf + rcx], word "ay"
    add rcx,2
    mov [ibuf + rcx], byte 10
    mov [ibuf], byte 0
    jmp final

end_vowel:
    mov [count],rcx
    mov [ibuf + rcx], byte "-"
    add rcx,1
    mov [ibuf + rcx], al
    add rcx,1
    mov [ibuf + rcx], dword "yay"
    add rcx,3
    mov [ibuf + rcx], byte 10
    jmp final

final:
    mov rax, ibuf
    mov rbx, 20
    call print

    call exit

section .data 
msg db "Enter a message: ",0
len equ $-msg

temp db "loop",10,0
templ equ $-temp

section .bss
ibuf resb 20
obuf resb 20
count resb 4
