segment .data
  intro: db "Consider the following languages when answering the questions below:", 0x0a
  intro_length: equ $-intro
  lang: db "Java, Python, Assembly, C++", 0x0a
  lang_length: equ $-lang
  q1: db "Assembly has the smallest binary executable", 0x0a
  q1_length: equ $-q1
  q2: db "Assembly has the fastest executable", 0x0a
  q2_length: equ $-q2
  q3: db "Java is compiled to byte code", 0x0a
  q3_length: equ $-q3
  q4: db "Java is my favourite programming language", 0x0a
  q4_length: equ $-q4
  q5: db "Good luck with the rest of the semester, I hope you enjoy COS284!", 0x0a
  q5_length: equ $-q5

segment .text
  global _start

_start:
  mov eax, 1
  mov edi, 1
  mov edx, intro_length
  lea rsi, [intro]
  syscall

  mov eax, 1
  mov edi, 1
  mov edx, lang_length
  lea rsi, [lang]
  syscall

  mov eax, 1
  mov edi, 1
  mov edx, q1_length
  lea rsi, [q1]
  syscall

  mov eax, 1
  mov edi, 1
  mov edx, q2_length
  lea rsi, [q2]
  syscall

  mov eax, 1
  mov edi, 1
  mov edx, q3_length
  lea rsi, [q3]
  syscall

  mov eax, 1
  mov edi, 1
  mov edx, q4_length
  lea rsi, [q4]
  syscall

  mov eax, 1
  mov edi, 1
  mov edx, q5_length
  lea rsi, [q5]
  syscall

exit:
  mov eax, 60
  xor edi, edi
  syscall
