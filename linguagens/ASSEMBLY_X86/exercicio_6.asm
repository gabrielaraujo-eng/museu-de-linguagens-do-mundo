; ============================================================================
; exercicio_6.asm -- Inverter um vetor de cinco posicoes
; Enunciado: trocar os elementos de um vetor de 5 inteiros de 32 bits,
;            usando dois indices que se aproximam, e imprimir antes e depois.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_6.o exercicio_6.asm
; Ligacao:   ld -o exercicio_6 exercicio_6.o
; Execucao:  ./exercicio_6
; ============================================================================

section .data
    vetor   dd 10, 20, 30, 40, 50
    n       equ 5

    rot_ant db "antes  : "
    len_ant equ $ - rot_ant
    rot_dep db "depois : "
    len_dep equ $ - rot_dep
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
    call mostra

    ; ---------------- inversao no proprio vetor --------------------------
    xor rbx, rbx                       ; i = 0
    mov r12, n
    dec r12                            ; j = 4
.inverte:
    cmp rbx, r12
    jge .fim_inverte
    mov eax, [vetor + rbx*4]           ; elemento da esquerda
    mov edx, [vetor + r12*4]           ; elemento da direita
    mov [vetor + rbx*4], edx
    mov [vetor + r12*4], eax
    inc rbx
    dec r12
    jmp .inverte
.fim_inverte:
    lea rsi, [rot_dep]
    mov rdx, len_dep
    call escreve_str
    call mostra

    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; mostra: imprime os n elementos do vetor, separados por espaco
; ----------------------------------------------------------------------------
mostra:
    xor r13, r13
.laco:
    cmp r13, n
    jge .fim
    mov eax, [vetor + r13*4]
    call imprime_int
    lea rsi, [espaco]
    mov rdx, 1
    call escreve_str
    inc r13
    jmp .laco
.fim:
    call nova_linha
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
