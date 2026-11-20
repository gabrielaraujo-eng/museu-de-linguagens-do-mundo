; ============================================================================
; exercicio_7.asm -- Divisao protegida contra divisor nulo
; Enunciado: implementar divide(a, b) que devolve codigo de status 0 (ok) ou
;            1 (divisor nulo) sem executar div quando b = 0, e testar tres casos.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_7.o exercicio_7.asm
; Ligacao:   ld -o exercicio_7 exercicio_7.o
; Execucao:  ./exercicio_7
; ============================================================================

section .data
    rot_a db "84 / 4  -> "
    len_a equ $ - rot_a
    rot_b db "84 / 0  -> "
    len_b equ $ - rot_b
    rot_c db "84 / -7 -> "
    len_c equ $ - rot_c
    txt_ok db "resultado "
    len_ok equ $ - txt_ok
    txt_err db "erro: divisor nulo (status 1), div nao foi executado", 10
    len_err equ $ - txt_err
    nl     db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- caso valido: 84 / 4 --------------------------------
    mov rdi, 84
    mov rsi, 4
    call divide                        ; rax = quociente, rdx = status
    mov [quoc], rax
    mov [stat], rdx
    lea rsi, [rot_a]
    mov rdx, len_a
    call escreve_str
    call mostra_resultado

    ; ---------------- divisor nulo: 84 / 0 -------------------------------
    mov rdi, 84
    xor rsi, rsi
    call divide
    mov [quoc], rax
    mov [stat], rdx
    lea rsi, [rot_b]
    mov rdx, len_b
    call escreve_str
    call mostra_resultado

    ; ---------------- divisor negativo: 84 / -7 --------------------------
    mov rdi, 84
    mov rsi, -7
    call divide
    mov [quoc], rax
    mov [stat], rdx
    lea rsi, [rot_c]
    mov rdx, len_c
    call escreve_str
    call mostra_resultado

    ; Codigo de saida reflete se houve erro em algum caso: aqui houve
    ; (o segundo caso), mas o erro foi tratado, entao o processo termina com 0.
    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; mostra_resultado: imprime "resultado N" ou a mensagem de erro
; ----------------------------------------------------------------------------
mostra_resultado:
    cmp qword [stat], 0
    jne .erro
    lea rsi, [txt_ok]
    mov rdx, len_ok
    call escreve_str
    mov rax, [quoc]
    call imprime_int
    call nova_linha
    ret
.erro:
    lea rsi, [txt_err]
    mov rdx, len_err
    call escreve_str
    ret

; ----------------------------------------------------------------------------
; divide: rax = rdi / rsi, rdx = status (0 = ok, 1 = divisor nulo)
; Usa idiv porque aceita divisores negativos; verifica antes de dividir.
; ----------------------------------------------------------------------------
divide:
    test rsi, rsi
    jz .falha
    mov rax, rdi
    cqo                                ; rdx:rax com sinal estendido
    idiv rsi                           ; quociente em rax, resto em rdx
    xor edx, edx                       ; status 0
    ret
.falha:
    xor eax, eax
    mov rdx, 1                         ; status 1: divisor nulo
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
quoc resq 1
stat resq 1
