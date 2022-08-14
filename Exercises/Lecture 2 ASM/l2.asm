  global _start
  segment .text

; set disassembly-flavor intel 
; info registers all 
; info registers eax
; layout r
; p/x $rax
; p (char[18]) a
; p (char[8]) $rax

_start:
  ; Moving constant values
mov_const:
  mov rax, 0x0123456789ABCDEF           ; Moves 8 byte value into rax
  mov eax, 0                            ; Moves 0 into rax
  mov eax, 5                            ; Moves 5 into lower 32 bits of rax and zeroes out top 32 bits

  ; Moving data from memory into a register
mov_mem:
  mov rax, b                            ; Moves the address of a into rax which is 8 bytes
  mov rax, [b]                          ; What does this do?
  mov rax, [a]                          ; What is in rax?
  
  ; Moving data from a register into memory
  ; p (char[18]) a
  mov rax, 'Patrick'
  mov [a], rax

  ; What is stored in c?
  ; What is stored in d?
  ; Why?
  mov rax, '8th'
  mov [c], rax
exit:
  mov rax, 60
  mov rdi, 0
  syscall

  segment .data
a     db    'No this is Patrick'
a_l   equ   $ - a
b     db    1,2,3,4,5,6,7,8
c     db    '3rd'
d     db    '4th'