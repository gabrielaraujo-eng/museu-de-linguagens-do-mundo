; ============================================================================
; exemplo_4.asm -- Lacos (repeticoes) com loop, dec/jnz e cmp/jl
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: soma 1..100 com a instrucao loop e contagem regressiva
;
; Montagem:  nasm -f elf64 -o exemplo_4.o exemplo_4.asm
; Ligacao:   ld -o exemplo_4 exemplo_4.o
; Execucao:  ./exemplo_4
; ============================================================================

section .data
    rot_soma db "soma de 1 a 100 com loop = "
    len_soma equ $ - rot_soma
    rot_regr db "contagem regressiva: "
    len_regr equ $ - rot_regr
    espaco   db " "
    nl       db 10

section .bss
    buf       resb 32
    resultado resq 1

section .text
    global _start

_start:
    ; ---------------- laco contado com a instrucao loop --------------------
    ; loop: dec rcx e salta se rcx != 0 (nao altera as flags)
    mov rcx, 100
    xor rax, rax                       ; acumulador = 0
.soma:
    add rax, rcx
    loop .soma                         ; repete enquanto rcx > 0

    mov [resultado], rax
    lea rsi, [rot_soma]
    mov rdx, len_soma
    call escreve_str
    mov rax, [resultado]
    call imprime_int
    call nova_linha

    ; ---------------- contagem regressiva 5..1 -----------------------------
    ; Atencao: syscall sobrescreve rcx e r11, por isso o contador fica em r12
    lea rsi, [rot_regr]
    mov rdx, len_regr
    call escreve_str

    mov r12, 5
.regressiva:
    mov rax, r12
    call imprime_int
    lea rsi, [espaco]
    mov rdx, 1
    call escreve_str
    dec r12
    jnz .regressiva                    ; dec atualiza ZF: repete enquanto != 0
    call nova_linha

    ; ---------------- laco com condicao no topo (while) --------------------
    ; imprime os multiplos de 30 menores que 100
    mov r13, 30
.topo:
    cmp r13, 100
    jge .fim                           ; condicao testada antes do corpo
    mov rax, r13
    call imprime_int
    lea rsi, [espaco]
    mov rdx, 1
    call escreve_str
    add r13, 30
    jmp .topo

.fim:
    call nova_linha
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

