; ============================================================================
; exemplo_10.asm -- Algoritmos: ordenacao por trocas e busca binaria
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: bubble sort em vetor de 32 bits e busca binaria no vetor ordenado
;
; Montagem:  nasm -f elf64 -o exemplo_10.o exemplo_10.asm
; Ligacao:   ld -o exemplo_10 exemplo_10.o
; Execucao:  ./exemplo_10
; ============================================================================

section .data
    vetor   dd 42, 7, 19, 3, 88, 15, 60, 1
    n       equ 8
    alvo    dd 19

    rot_ant db "antes  : "
    len_ant equ $ - rot_ant
    rot_dep db "depois : "
    len_dep equ $ - rot_dep
    rot_bus db "busca binaria por 19 -> indice "
    len_bus equ $ - rot_bus
    rot_nac db "busca binaria por 50 -> nao encontrado (retorno -1)", 10
    len_nac equ $ - rot_nac
    espaco  db " "
    nl      db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    lea rsi, [rot_ant]
    mov rdx, len_ant
    call escreve_str
    call mostra_vetor

    ; ---------------- ordenacao por trocas (bubble sort) ------------------
    ; Dois lacos aninhados: i de 0 a n-2, j de 0 a n-2-i.
    xor r12, r12                       ; i = 0
.externo:
    mov r13, n
    dec r13
    sub r13, r12                       ; limite interno = n - 1 - i
    cmp r13, 0
    jle .fim_externo
    xor rbx, rbx                       ; j = 0
.interno:
    cmp rbx, r13
    jge .proximo_i
    mov eax, [vetor + rbx*4]
    mov edx, [vetor + rbx*4 + 4]       ; vizinho da direita
    cmp eax, edx
    jle .sem_troca                     ; ja esta em ordem
    mov [vetor + rbx*4], edx
    mov [vetor + rbx*4 + 4], eax       ; troca os dois elementos
.sem_troca:
    inc rbx
    jmp .interno
.proximo_i:
    inc r12
    jmp .externo
.fim_externo:
    lea rsi, [rot_dep]
    mov rdx, len_dep
    call escreve_str
    call mostra_vetor

    ; ---------------- busca binaria --------------------------------------
    mov rdi, 19
    call busca_binaria                 ; rax = indice ou -1
    mov [indice], rax
    lea rsi, [rot_bus]
    mov rdx, len_bus
    call escreve_str
    mov rax, [indice]
    call imprime_int
    call nova_linha

    mov rdi, 50
    call busca_binaria
    mov [indice], rax
    cmp qword [indice], -1
    jne .achou
    lea rsi, [rot_nac]
    mov rdx, len_nac
    call escreve_str
    jmp .fim
.achou:
    mov rax, [indice]
    call imprime_int
    call nova_linha

.fim:
    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; mostra_vetor: imprime os n elementos separados por espaco
; ----------------------------------------------------------------------------
mostra_vetor:
    xor rbx, rbx
.laco:
    cmp rbx, n
    jge .fim
    mov eax, [vetor + rbx*4]
    call imprime_int
    lea rsi, [espaco]
    mov rdx, 1
    call escreve_str
    inc rbx
    jmp .laco
.fim:
    call nova_linha
    ret

; ----------------------------------------------------------------------------
; busca_binaria: rax = indice de rdi no vetor ordenado, ou -1
; ----------------------------------------------------------------------------
busca_binaria:
    xor r8, r8                         ; esquerda = 0
    mov r9, n
    dec r9                             ; direita = n - 1
.laco:
    cmp r8, r9
    jg .nao_achou
    mov r10, r8
    add r10, r9
    shr r10, 1                         ; meio = (esq + dir) / 2
    mov eax, [vetor + r10*4]
    cmp eax, edi
    je .achou
    jl .direita                        ; valor do meio < alvo: vai para a direita
    mov r9, r10
    dec r9
    jmp .laco
.direita:
    mov r8, r10
    inc r8
    jmp .laco
.achou:
    mov rax, r10
    ret
.nao_achou:
    mov rax, -1
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
indice resq 1
