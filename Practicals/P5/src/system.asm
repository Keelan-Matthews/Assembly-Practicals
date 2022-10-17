            segment   .text
            global    filter, enrol, predict, expel, getStudentSize, getAverageOffset, getIdOffset
            extern    malloc, strcpy, free
; p *((struct Student*) variable)
enrol:
  imul rdi, Student_size
  call malloc
  ret

predict:
  mov rax, rsi
  imul rsi, Student_size
  movsd [rdi + rsi], xmm0
  mov [rdi + rsi + 8], rax
  ret

filter:
  movsd xmm1, [rdi]
  mov rdx, 0
  mov rcx, 0
.more:
  mov rbx, rcx
  imul rbx, Student_size
  movsd xmm0, [rdi + rbx]
  comisd xmm0, xmm1
  jbe .skip
  movsd xmm1, xmm0
  mov rdx, rcx
.skip:
  inc rcx
  cmp rcx, rsi
  jl .more
  
  imul rdx, Student_size
  lea rax, [rdi + rdx]
  ret

; Helpers
expel:
  push rbp
  mov rbp, rsp

  call free
  leave
  ret

getStudentSize:
  mov rax, Student_size
  ret

getAverageOffset:
  mov rax, Student.average
  ret

getIdOffset:
  mov rax, Student.id
  ret
            segment   .data
            struc Student
            .average resq 1
            .id resd 1
            align 8
            endstruc
            
