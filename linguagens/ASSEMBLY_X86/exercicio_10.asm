; ============================================================================
; exercicio_10.asm -- Maior, menor, media e resto de seis notas
; Enunciado: dado um vetor de 6 notas inteiras, calcular maior, menor, media
;            inteira e resto da divisao por 6, imprimindo tudo.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_10.o exercicio_10.asm
; Ligacao:   ld -o exercicio_10 exercicio_10.o
; Execucao:  ./exercicio_10
; ============================================================================

section .data
    notas dd 7, 9, 6, 10, 8, 5
    n     equ 6

    rot_maior db "maior = "
    len_maior equ $ - rot_maior
    rot_menor db "menor = "
    len_menor equ $ - rot_menor
    rot_media db "media = "
    len_media equ $ - rot_media
    rot_resto db " resto "
    len_resto equ $ - rot_resto
    rot_soma  db "soma  = "
    len_soma  equ $ - rot_soma
    nl        db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- inicializa maior/menor com o primeiro elemento ------
    mov eax, [notas]
    mov [maior], rax
    mov [menor], rax
    xor r13, r13                       ; soma
    xor rbx, rbx                       ; indice
.laco:
    cmp rbx, n
    jge .fim_laco
    movsxd rax, dword [notas + rbx*4]
    add r13, rax                       ; acumula a soma
    cmp rax, [maior]
    jle .testa_menor
    mov [maior], rax
.testa_menor:
    cmp rax, [menor]
    jge .proximo
    mov [menor], rax
.proximo:
    inc rbx
    jmp .laco
.fim_laco:

    ; ---------------- media inteira e resto -------------------------------
    mov rax, r13
    xor edx, edx
    mov rcx, n
    div rcx                            ; rax = media, rdx = resto
    mov [media], rax
    mov [resto], rdx

    ; ---------------- saida ----------------------------------------------
    lea rsi, [rot_maior]
    mov rdx, len_maior
    call escreve_str
    mov rax, [maior]
    call imprime_int
    call nova_linha

    lea rsi, [rot_menor]
    mov rdx, len_menor
    call escreve_str
    mov rax, [menor]
    call imprime_int
    call nova_linha

    lea rsi, [rot_soma]
    mov rdx, len_soma
    call escreve_str
    mov rax, r13
    call imprime_int
    call nova_linha

    lea rsi, [rot_media]
    mov rdx, len_media
    call escreve_str
    mov rax, [media]
    call imprime_int
    lea rsi, [rot_resto]
    mov rdx, len_resto
    call escreve_str
    mov rax, [resto]
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

section .bss
maior resq 1
menor resq 1
media resq 1
resto resq 1
