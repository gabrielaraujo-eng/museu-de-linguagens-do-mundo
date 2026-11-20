; ============================================================================
; exercicio_2.asm -- Conversao de Celsius para Fahrenheit com inteiros
; Enunciado: converter 37 C e 100 C para Fahrenheit usando F = C*9/5 + 32.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_2.o exercicio_2.asm
; Ligacao:   ld -o exercicio_2 exercicio_2.o
; Execucao:  ./exercicio_2
; ============================================================================

section .data
    celsius  dd 37, 100, -40           ; tres temperaturas de entrada
    n        equ 3

    rot_c    db " C = "
    len_c    equ $ - rot_c
    rot_f    db " F", 10
    len_f    equ $ - rot_f

section .bss
    buf resb 32

section .text
    global _start

_start:
    xor rbx, rbx                       ; indice do vetor
.laco:
    cmp rbx, n
    jge .fim

    ; ---- imprime a temperatura em Celsius ----
    mov eax, [celsius + rbx*4]
    movsxd rax, eax                    ; valor com sinal -> 64 bits
    mov [temp], rax
    call imprime_int
    lea rsi, [rot_c]
    mov rdx, len_c
    call escreve_str

    ; ---- F = (C * 9) / 5 + 32 ----
    mov rax, [temp]
    imul rax, 9                        ; imul com sinal
    cqo                                ; estende o sinal para rdx:rax
    mov rcx, 5
    idiv rcx                           ; divisao inteira com sinal
    add rax, 32
    mov [temp], rax

    call imprime_int
    lea rsi, [rot_f]
    mov rdx, len_f
    call escreve_str

    inc rbx
    jmp .laco
.fim:
    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; escreve_str: escreve rdx bytes apontados por rsi
; ----------------------------------------------------------------------------
escreve_str:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

; ----------------------------------------------------------------------------
; imprime_int: imprime rax em decimal (com sinal)
; ----------------------------------------------------------------------------
imprime_int:
    push rbx
    lea rsi, [buf + 31]
    mov rbx, 10
    xor ecx, ecx
    xor r8d, r8d
    test rax, rax
    jns .converte
    neg rax
    mov r8d, 1
.converte:
    xor edx, edx
    div rbx
    add dl, '0'
    dec rsi
    mov [rsi], dl
    inc rcx
    test rax, rax
    jnz .converte
    test r8d, r8d
    jz .escreve
    dec rsi
    mov byte [rsi], '-'
    inc rcx
.escreve:
    mov rdx, rcx
    mov rax, 1
    mov rdi, 1
    syscall
    pop rbx
    ret

section .bss
temp resq 1
