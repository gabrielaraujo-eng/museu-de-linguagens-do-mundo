; ============================================================================
; exemplo_8.asm -- Manipulacao de strings: strlen, rep movsb e inversao
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: strings terminadas em zero, instrucoes de string e cld
;
; Montagem:  nasm -f elf64 -o exemplo_8.o exemplo_8.asm
; Ligacao:   ld -o exemplo_8 exemplo_8.o
; Execucao:  ./exemplo_8
; ============================================================================

section .data
    original db "linguagem assembly", 0

    rot_orig db "original : "
    len_orig equ $ - rot_orig
    rot_tam  db "comprimento (sem o zero final) = "
    len_tam  equ $ - rot_tam
    rot_cop  db "copia    : "
    len_cop  equ $ - rot_cop
    rot_inv  db "invertida: "
    len_inv  equ $ - rot_inv
    nl       db 10

section .bss
    copia resb 64
    buf   resb 32

section .text
    global _start

_start:
    ; ---------------- imprime a string original ---------------------------
    lea rsi, [rot_orig]
    mov rdx, len_orig
    call escreve_str

    lea rdi, [original]
    call strlen                        ; rax = comprimento
    mov r13, rax                       ; guarda o comprimento

    lea rsi, [original]
    mov rdx, r13
    call escreve_str
    call nova_linha

    ; ---------------- comprimento ----------------------------------------
    lea rsi, [rot_tam]
    mov rdx, len_tam
    call escreve_str
    mov rax, r13
    call imprime_int
    call nova_linha

    ; ---------------- copia com rep movsb --------------------------------
    ; rep repete a instrucao rcx vezes; rsi = origem, rdi = destino.
    cld                                ; DF = 0: avanca os ponteiros
    lea rsi, [original]
    lea rdi, [copia]
    mov rcx, r13
    rep movsb
    mov byte [rdi], 0                  ; termina a copia com zero

    lea rsi, [rot_cop]
    mov rdx, len_cop
    call escreve_str
    lea rsi, [copia]
    mov rdx, r13
    call escreve_str
    call nova_linha

    ; ---------------- inverte a copia no proprio lugar -------------------
    xor rbx, rbx                       ; i = 0
    mov r12, r13
    dec r12                            ; j = comprimento - 1
.inverte:
    cmp rbx, r12
    jge .fim_inverte                   ; parou quando os indices se cruzaram
    lea rdi, [copia]
    mov al, [rdi + rbx]                ; guarda o da esquerda
    mov dl, [rdi + r12]                ; pega o da direita
    mov [rdi + rbx], dl
    mov [rdi + r12], al
    inc rbx
    dec r12
    jmp .inverte
.fim_inverte:
    lea rsi, [rot_inv]
    mov rdx, len_inv
    call escreve_str
    lea rsi, [copia]
    mov rdx, r13
    call escreve_str
    call nova_linha

    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; strlen: rax = comprimento da string terminada em zero apontada por rdi
; ----------------------------------------------------------------------------
strlen:
    xor rax, rax
.volta:
    cmp byte [rdi + rax], 0
    je .pronto
    inc rax
    jmp .volta
.pronto:
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
