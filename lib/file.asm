bits 64
section .text

global openFile, openOrCreateFile, closeFile, writeFD, readFD, readFile, writeFile

openFile:
    ; open(2)
    ; (rdi - *filename, rsi - flags, rdx - mode)
    ; rax - *filename, rbx - *fdBuffer
    push rdi
    push rsi
    push rdx
    mov rdi, rax
    mov rsi, 0x0
    mov rax, 2
    syscall
    pop rdx
    pop rsi
    pop rdi

    mov [rbx], rax
    ret

openOrCreateFile:
    ; open(2)
    ; (rdi - *filename, rsi - flags, rdx - mode)
    ; rax - *filename, rbx - *fdBuffer, rdx - mode
    push rdi
    push rsi
    mov rsi, 0x42
    mov rdi, rax
    mov rax, 2
    syscall
    pop rsi
    pop rdi

    mov [rbx], rax
    ret

closeFile:
    ;

writeFD:
    ; write(2) - RAX 1
    ; rdi - fd, rsi - *buf, rdx - count
    ; rax - fd, rbx - *buf, rdx - count
    push rdi
    push rsi
    mov rdi, rax
    mov rsi, rbx
    mov rax, 1
    syscall
    pop rsi
    pop rdi
    ret

readFD:
    ;

readFile:
    ;

writeFile:
    ;
