; ============================================================================
; exercicio_5.asm -- Funcao que calcula potencia inteira
; Enunciado: implementar potencia(base, expoente) com call/ret e um laco,
;            e usa-la para 2^10 e 3^4.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_5.o exercicio_5.asm
; Ligacao:   ld -o exercicio_5 exercicio_5.o
; Execucao:  ./exercicio_5
; ============================================================================

section .data
    rot_1 db "2^10 = "
    len_1 equ $ - rot_1
    rot_2 db "3^4  = "
    len_2 equ $ - rot_2
    nl    db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- 2 elevado a 10 -------------------------------------
    mov rdi, 2                         ; base
    mov rsi, 10                        ; expoente
    call potencia                      ; rax = 1024
    mov [res], rax
    lea rsi, [rot_1]
    mov rdx, len_1
    call escreve_str
    mov rax, [res]
    call imprime_int
    call nova_linha

    ; ---------------- 3 elevado a 4 --------------------------------------
    mov rdi, 3
    mov rsi, 4
    call potencia                      ; rax = 81
    mov [res], rax
    lea rsi, [rot_2]
    mov rdx, len_2
    call escreve_str
    mov rax, [res]
    call imprime_int
    call nova_linha

    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; potencia: rax = rdi ^ rsi  (base em rdi, expoente em rsi)
; Caso base: expoente 0 -> resultado 1 (inclusive 0^0 = 1 por convencao)
; ----------------------------------------------------------------------------
potencia:
    mov rax, 1                         ; resultado parcial
    mov rcx, rsi                       ; contador do laco
    test rcx, rcx
    jz .fim
.laco:
    imul rax, rdi                      ; resultado *= base
    loop .laco                         ; dec rcx; salta se rcx != 0
.fim:
    ret

; ----------------------------------------------------------------------------
; escreve_str: escreve rdx bytes apontados por rsi
; ----------------------------------------------------------------------------
escreve_str:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

; ----------------------------------------------------------------------------
; nova_linha: escreve um caractere de nova linha
; ----------------------------------------------------------------------------
nova_linha:
    lea rsi, [nl]
    mov rdx, 1
    jmp escreve_str

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
res resq 1
