;   Program: Prints 'Hello world!'
;
;   No input
;
;   Output: 'Hello world!'
;

section .data
    msg db  'Hello world!' ; msg is a variable and we're storing 'Hello world!' in it. We're defining static data
    nl  db 0x0a ; adds a newline to msg
    msgLen  equ $-msg ; Calculate size of label before it, which is the msg in this case

segment .text
    global _start

    _start:
        mov rax, 1  ; perform write
        mov rdi, 1  ; destination is stdout
        mov rsi, msg    ; data to write
        mov rdx, msgLen ; byte count to write
        syscall

        mov rax, 60 ; system call for exit
        mov rdi, 0 ; exit code 0
        syscall ; invoke system call