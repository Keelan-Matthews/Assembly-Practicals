  global _start
  section .text

_start: 
; =======================================================
; Your code goes below here
; =======================================================
  ; Output the string contained in name_prompt
  mov rsi, name_prompt
  mov rdx, name_prompt_size
  call output

  ; Store the user's response in product
  mov rsi, product
  mov rdx, 8
  call input

  ; Update q1 to include the product name instead of xxxxxxxx
  ; Add a newline character at the end of the string in q1
  ; [1 mark]
  xor rbx, rbx
  mov rbx, [product]
  mov [q1+18], rbx
  mov byte [q1+26], newline

  ; Output the string contained in the memory location q1
  ; [0.5 marks]
  mov rsi, q1
  mov rdx, q1_size
  call output

  ; Output the string contained in the memory location price_prompt
  mov rsi, price_prompt
  mov rdx, price_prompt_size
  call output

  ; Store the user's response in the memory location price
  mov rsi, price
  mov rdx, 1
  call input

  ; Store the arithmetic capable value of price in the register al
  ; [1 mark]
  mov al, [price]
  sub al, '0'

  ; Store the number of products (2) in the register cl 
  ; Multiply it by the price
  ; [0.5 marks]
  mov cl, '2'
  sub cl, '0'
  mul cl

  ; Convert the single digit integer value currently stored in register al to be usable for output
  ; [0.5 marks]
  add al, '0'

  ; Update q2 to include the new price instead of x
  ; Add a newline character at the end of the string
  ; [0.5 marks]
  mov [q2+60], al
  mov byte [q2+61], newline

  ; Output the string contained in the memory location q2
  mov rsi, q2
  mov rdx, q2_size
  call output
; =======================================================
; DO NOT ALTER anything below here
; =======================================================

exit:
  mov	rax, 60
  xor	rdi, rdi
  syscall

; Helper functions for handling basic input and output
; Use the call keyword for each label to jump to the code and return back to where it was called
output:
  mov	rax, 1
  mov	rdi, 1
  syscall
  ret

input:
; Sets the registers to perform a stdin read
  mov rax, 0
  mov rdi, 0
  syscall

; Takes care of the additional null character that is added to the end of the string when enter is pressed
  mov rax, 0
  mov rdi, 0
  mov rdx, 1
  mov rsi, trash
  syscall
  ret

; =======================================================
; You may create helper functions below here
; =======================================================

; =======================================================
; DO NOT ALTER EXISTING VALUES in .data or .bss sections
; =======================================================
  section .data
name_prompt:         db "Please input a product name: "
name_prompt_size:    equ $-name_prompt
price_prompt:        db "Please input a price: "
price_prompt_size:   equ $-price_prompt
q1:                  db "You have selected xxxxxxxx", 0x0a
q1_size:             equ $-q1
q2:                  db "Amazing offer: Buy two of these and pay for both, now only Rx", 0x0a
q2_size:             equ $-q2
newline:             equ 0x0a

  section .bss
product:             resb 8 ; Stores the product name restricted to 8 characters exactly (computer, keyboard, etc.)
price:               resb 1 ; Price must be a single digit below 5 (0, 1, 2, 3, 4)
trash:               resb 1 ; For throwing away null characters