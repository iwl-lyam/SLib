bits 64
section .text

global os_string_to_int
global os_int_to_string

; os_string_to_int -- Convert a string into a binary interger
;  IN:   RSI = location of string
; OUT:   RAX = integer value
;   All other registers preserved

os_string_to_int:
   push rsi
   push rdx
   push rcx
   push rbx

   xor eax, eax         ; initialize accumulator
   mov rbx, 10         ; decimal-system's radix
os_string_to_int_next_digit:
   mov cl, [rsi]         ; fetch next character
   cmp cl, '0'         ; char preceeds '0'?
   jb os_string_to_int_invalid   ; yes, not a numeral
   cmp cl, '9'         ; char follows '9'?
   ja os_string_to_int_invalid   ; yes, not a numeral
   mul rbx            ; ten times prior sum
   and rcx, 0x0F         ; convert char to int
   add rax, rcx         ; add to prior total
   inc rsi            ; advance source index
   jmp os_string_to_int_next_digit   ; and check another char

os_string_to_int_invalid:
   pop rbx
   pop rcx
   pop rdx
   pop rsi
   ret

;-----------------------------------

os_int_to_string:
   push rdx
   push rcx
   push rbx
   push rax

   mov rbx, 10               ; base of the decimal system
   xor ecx, ecx               ; number of digits generated
os_int_to_string_next_divide:
   xor edx, edx               ; RAX extended to (RDX,RAX)
   div rbx                  ; divide by the number-base
   push rdx               ; save remainder on the stack
   inc rcx                  ; and count this remainder
   cmp rax, 0               ; was the quotient zero?
   jne os_int_to_string_next_divide      ; no, do another division

os_int_to_string_next_digit:
   pop rax                  ; else pop recent remainder
   add al, '0'               ; and convert to a numeral
   stosb                  ; store to memory-buffer
   loop os_int_to_string_next_digit      ; again for other remainders
   xor al, al
   stosb                  ; Store the null terminator at the end of the string

   pop rax
   pop rbx
   pop rcx
   pop rdx
   ret