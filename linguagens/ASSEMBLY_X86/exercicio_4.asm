; ============================================================================
; exercicio_4.asm -- Soma dos numeros pares de 1 a 20
; Enunciado: percorrer 1..20, testar paridade com test e somar apenas os pares.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_4.o exercicio_4.asm
; Ligacao:   ld -o exercicio_4 exercicio_4.o
; Execucao:  ./exercicio_4
; ============================================================================

section .data
    rot_par db "pares de 1 a 20: "
    len_par equ $ - rot_par
    rot_som db "soma dos pares = "
    len_som equ $ - rot_som
    espaco  db " "
    nl      db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    lea rsi, [rot_par]
    mov rdx, len_par
    call escreve_str

    ; r12 = contador (nao pode ser rcx: syscall destroi rcx)
    ; r13 = acumulador da soma
    mov r12, 1
    xor r13, r13
.laco:
    cmp r12, 20
    jg .fim_laco

    test r12b, 1                       ; bit 0 = 1 -> impar
    jnz .proximo                       ; ignora os impares

    add r13, r12                       ; acumula o par

    mov rax, r12
    call imprime_int
    lea rsi, [espaco]
    mov rdx, 1
    call escreve_str

.proximo:
    inc r12
    jmp .laco
.fim_laco:
    call nova_linha

    lea rsi, [rot_som]
    mov rdx, len_som
    call escreve_str
    mov rax, r13
    call imprime_int
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
