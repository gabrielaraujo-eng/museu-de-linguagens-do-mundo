; ============================================================================
; exemplo_3.asm -- Controle de fluxo: cmp, test e saltos condicionais
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: if/else com jcc, diferenca entre saltos com e sem sinal
;
; Montagem:  nasm -f elf64 -o exemplo_3.o exemplo_3.asm
; Ligacao:   ld -o exemplo_3 exemplo_3.o
; Execucao:  ./exemplo_3
; ============================================================================

section .data
    valor_a dd -7                      ; sera classificado como negativo
    valor_b dd 0                       ; sera classificado como zero
    valor_c dd 15                      ; sera classificado como positivo

    rot_a db "valor_a = -7  -> "
    len_a equ $ - rot_a
    rot_b db "valor_b =  0  -> "
    len_b equ $ - rot_b
    rot_c db "valor_c = 15  -> "
    len_c equ $ - rot_c

    txt_neg db "negativo", 10
    len_neg equ $ - txt_neg
    txt_zer db "zero", 10
    len_zer equ $ - txt_zer
    txt_pos db "positivo", 10
    len_pos equ $ - txt_pos

    rot_cmp db "cmp 15, 7 -> o primeiro e maior (jg) / nao e menor (jl)", 10
    len_cmp equ $ - rot_cmp
    rot_uns db "cmp 15, 7 -> acima (ja) e nao abaixo (jb) nos saltos sem sinal", 10
    len_uns equ $ - rot_uns

section .text
    global _start

_start:
    ; ---------------- primeiro valor: cadeia if / else if / else -----------
    lea rsi, [rot_a]
    mov rdx, len_a
    call escreve_str
    mov eax, [valor_a]
    cmp eax, 0                         ; atualiza as flags (ZF, SF, OF)
    jl  .a_negativo                    ; jl = menor, comparacao com sinal
    je  .a_zero                        ; je = igual (ZF = 1)
    jmp .a_positivo
.a_negativo:
    lea rsi, [txt_neg]
    mov rdx, len_neg
    call escreve_str
    jmp .segundo
.a_zero:
    lea rsi, [txt_zer]
    mov rdx, len_zer
    call escreve_str
    jmp .segundo
.a_positivo:
    lea rsi, [txt_pos]
    mov rdx, len_pos
    call escreve_str

.segundo:
    ; ---------------- segundo valor: zero ----------------------------------
    lea rsi, [rot_b]
    mov rdx, len_b
    call escreve_str
    mov eax, [valor_b]
    test eax, eax                      ; test x,x e mais barato que cmp x,0
    js  .b_negativo
    jz  .b_zero
    lea rsi, [txt_pos]
    mov rdx, len_pos
    call escreve_str
    jmp .terceiro
.b_negativo:
    lea rsi, [txt_neg]
    mov rdx, len_neg
    call escreve_str
    jmp .terceiro
.b_zero:
    lea rsi, [txt_zer]
    mov rdx, len_zer
    call escreve_str

.terceiro:
    ; ---------------- terceiro valor: positivo -----------------------------
    lea rsi, [rot_c]
    mov rdx, len_c
    call escreve_str
    mov eax, [valor_c]
    cmp eax, 0
    jg  .c_positivo                    ; jg = maior (com sinal)
    je  .c_zero
    lea rsi, [txt_neg]
    mov rdx, len_neg
    call escreve_str
    jmp .comparacoes
.c_zero:
    lea rsi, [txt_zer]
    mov rdx, len_zer
    call escreve_str
    jmp .comparacoes
.c_positivo:
    lea rsi, [txt_pos]
    mov rdx, len_pos
    call escreve_str

.comparacoes:
    ; ---------------- saltos com sinal x saltos sem sinal ------------------
    mov eax, 15
    cmp eax, 7
    jg  .maior                         ; 15 > 7 com sinal: salta
    jmp .sem_sinal
.maior:
    lea rsi, [rot_cmp]
    mov rdx, len_cmp
    call escreve_str
.sem_sinal:
    mov eax, 15
    cmp eax, 7
    ja  .acima                         ; 15 > 7 sem sinal: tambem salta
    jmp .fim
.acima:
    lea rsi, [rot_uns]
    mov rdx, len_uns
    call escreve_str

.fim:
    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; escreve_str: escreve rdx bytes apontados por rsi (rax=1, rdi=1)
; ----------------------------------------------------------------------------
escreve_str:
    mov rax, 1
    mov rdi, 1
    syscall
    ret
