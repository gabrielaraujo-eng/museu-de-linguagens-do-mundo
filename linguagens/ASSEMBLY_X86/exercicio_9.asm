; ============================================================================
; exercicio_9.asm -- Hipotenusa inteira de um triangulo retangulo
; Enunciado: para os pares (3,4) e (6,8), calcular h = isqrt(a*a + b*b) usando
;            a soma dos quadrados e a raiz inteira por aproximacao sucessiva.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_9.o exercicio_9.asm
; Ligacao:   ld -o exercicio_9 exercicio_9.o
; Execucao:  ./exercicio_9
; ============================================================================

section .data
    catetos dd 3, 4, 6, 8              ; dois pares: (3,4) e (6,8)

    rot_a db "catetos "
    len_a equ $ - rot_a
    rot_e db " e "
    len_e equ $ - rot_e
    rot_h db " -> hipotenusa "
    len_h equ $ - rot_h
    rot_q db "  (soma dos quadrados = "
    len_q equ $ - rot_q
    rot_f db ")", 10
    len_f equ $ - rot_f

section .bss
    buf resb 32

section .text
    global _start

_start:
    xor rbx, rbx                       ; indice do par (0 e 2)
.par:
    cmp rbx, 4
    jge .fim

    movsxd rdi, dword [catetos + rbx*4]        ; primeiro cateto
    movsxd rsi, dword [catetos + rbx*4 + 4]    ; segundo cateto
    mov [c1], rdi
    mov [c2], rsi

    ; ---- soma dos quadrados: a*a + b*b ----
    mov rax, rdi
    imul rax, rdi
    mov rcx, rsi
    imul rcx, rsi
    add rax, rcx
    mov [soma_q], rax

    ; ---- imprime "catetos a e b -> hipotenusa h (soma dos quadrados = N)" ----
    lea rsi, [rot_a]
    mov rdx, len_a
    call escreve_str
    mov rax, [c1]
    call imprime_int
    lea rsi, [rot_e]
    mov rdx, len_e
    call escreve_str
    mov rax, [c2]
    call imprime_int

    mov rdi, [soma_q]
    call isqrt                         ; rax = raiz inteira da soma
    mov [hip], rax

    lea rsi, [rot_h]
    mov rdx, len_h
    call escreve_str
    mov rax, [hip]
    call imprime_int
    lea rsi, [rot_q]
    mov rdx, len_q
    call escreve_str
    mov rax, [soma_q]
    call imprime_int
    lea rsi, [rot_f]
    mov rdx, len_f
    call escreve_str

    add rbx, 2                         ; proximo par
    jmp .par
.fim:
    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; isqrt: rax = maior inteiro r tal que r*r <= rdi  (busca linear)
; ----------------------------------------------------------------------------
isqrt:
    xor rax, rax
.laco:
    lea rcx, [rax + 1]
    imul rcx, rcx                      ; (r + 1)^2
    cmp rcx, rdi
    jg .pronto                         ; (r+1)^2 > n: r e a raiz inteira
    inc rax
    jmp .laco
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
c1     resq 1
c2     resq 1
soma_q resq 1
hip    resq 1
