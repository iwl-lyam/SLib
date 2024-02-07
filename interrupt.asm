section .text
  global _start

_start:
  xor eax, eax
  cpuid

  mov rax,
  test al, 0x80
  jnz interrupt_detected
  jmp no_interrupt_detected

interrupt_detected:
  ; Code to handle interrupt and print out data about it
  mov rax, 4
  mov rbx, 1
  mov rsi, interrupt_message
  mov rdx, interrupt_message_length
  int 0x80
  jmp _start

no_interrupt_detected:
  ; Continue with program execution
  jmp _start

interrupt_message db "Hardware interrupt detected", 0xA
interrupt_message_length equ $ - interrupt_message

end_program:
  ; Code to exit the program
  mov rax, 60
  xor edi, edi
  syscall

section .bss
mes resb 8
