bits 64

section .text
global convertAscii

convertAscii:
  ; rdx - address of input
  ; rax - address of output buffer
  ; r10 - 0 (to int) or 1 (to string)
  ; Stores result in the output buffer

  ; Saves state of rcx and rbx

  push rcx
  push rbx

  xor rcx,rcx
  jmp loop

loop:
  ;cmp byte [rdx+rcx],0
  ;jz end

  ;cmp byte [rdx+rcx],0xa
  ;je end

  cmp rcx,3
  jz end

  xor rbx,rbx

  cmp r10,0
  jz toi
  jmp toa

toa:
  mov bl,[rdx+rcx]
  add bl,'0'
  mov rdx, 10
  push rax
  mov rax,[rax]
  mul rdx
  mov rsi,rax

  add rsi,rbx
  pop rax
  mov [rax],rsi
  
  ;mov [rax+rcx],bl
  inc rcx
  jmp loop

toi:
  mov bl,[rdx+rcx]
  sub bl,'0'
  push rdx
  mov rdx, 10
  push rax
  mov rax,[rax]
  mul rdx
  pop rdx
  mov rsi,rax

  add rsi,rbx
  pop rax
  mov [rax],rsi
  
  ;mov [rax+rcx],bl
  inc rcx
  jmp loop

end:
  pop rbx
  pop rcx
  ret
