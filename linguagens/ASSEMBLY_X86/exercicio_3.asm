; ============================================================================
; exercicio_3.asm -- Classificar um inteiro em positivo, negativo ou zero
; Enunciado: para cada valor de um vetor, imprimir a classificacao usando
;            test/js/jz e um salto indireto por tabela de rotulos.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_3.o exercicio_3.asm
; Ligacao:   ld -o exercicio_3 exercicio_3.o
; Execucao:  ./exercicio_3
; ============================================================================

section .data
    valores dd -42, 0, 7

    txt_neg db "negativo", 10
    len_neg equ $ - txt_neg
    txt_zer db "zero", 10
    len_zer equ $ - txt_zer
    txt_pos db "positivo", 10
    len_pos equ $ - txt_pos

    ; Tabela de rotulos: 0 = negativo, 1 = zero, 2 = positivo
    tabela  dq alvo_neg, alvo_zer, alvo_pos
    rot_val db "valor "
    len_val equ $ - rot_val
    rot_sep db " -> "
    len_sep equ $ - rot_sep

section .bss
    buf resb 32

section .text
    global _start

_start:
    xor rbx, rbx                       ; indice
laco_principal:
    cmp rbx, 3
    jge fim_programa

    ; ---- imprime o valor ----
    lea rsi, [rot_val]
    mov rdx, len_val
    call escreve_str
    mov eax, [valores + rbx*4]
    movsxd rax, eax
    mov [atual], rax
    call imprime_int
    lea rsi, [rot_sep]
    mov rdx, len_sep
    call escreve_str

    ; ---- escolhe o indice na tabela: 0, 1 ou 2 ----
    mov rax, [atual]
    mov rcx, 2                         ; assume positivo
    test rax, rax
    jns .nao_negativo
    xor ecx, ecx                       ; negativo -> indice 0
    jmp .despacha
.nao_negativo:
    jnz .despacha                      ; diferente de zero -> indice 2
    mov rcx, 1                         ; zero -> indice 1

.despacha:
    lea rdi, [tabela]
    mov rax, [rdi + rcx*8]             ; endereco do rotulo escolhido
    jmp rax                            ; salto indireto

alvo_neg:
    lea rsi, [txt_neg]
    mov rdx, len_neg
    call escreve_str
    jmp volta_laco
alvo_zer:
    lea rsi, [txt_zer]
    mov rdx, len_zer
    call escreve_str
    jmp volta_laco
alvo_pos:
    lea rsi, [txt_pos]
    mov rdx, len_pos
    call escreve_str
volta_laco:
    inc rbx
    jmp laco_principal
fim_programa:
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
atual resq 1
