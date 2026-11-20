; ============================================================================
; exemplo_5.asm -- Funcoes: call/ret, quadro de pilha e recursao
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: convencao propria de chamada (rdi, rsi -> rax), push/pop, rbp
;
; Montagem:  nasm -f elf64 -o exemplo_5.o exemplo_5.asm
; Ligacao:   ld -o exemplo_5 exemplo_5.o
; Execucao:  ./exemplo_5
; ============================================================================

section .data
    rot_soma db "soma(40, 2) = "
    len_soma equ $ - rot_soma
    rot_fat  db "fatorial(10) = "
    len_fat  equ $ - rot_fat
    rot_pres db "rbx preservado pela funcao: "
    len_pres equ $ - rot_pres
    nl       db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- chamada simples: argumentos em rdi e rsi -------------
    mov rdi, 40
    mov rsi, 2
    call soma                          ; retorno em rax
    mov [guardado], rax

    lea rsi, [rot_soma]
    mov rdx, len_soma
    call escreve_str
    mov rax, [guardado]
    call imprime_int
    call nova_linha

    ; ---------------- recursao: fatorial(10) -------------------------------
    mov rdi, 10
    call fatorial
    mov [guardado], rax

    lea rsi, [rot_fat]
    mov rdx, len_fat
    call escreve_str
    mov rax, [guardado]
    call imprime_int
    call nova_linha

    ; ---------------- preservacao de registrador pela funcao ---------------
    mov rbx, 777
    call usa_rbx_sem_estragar         ; a funcao salva e restaura rbx
    lea rsi, [rot_pres]
    mov rdx, len_pres
    call escreve_str
    mov rax, rbx
    call imprime_int
    call nova_linha

    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; soma: rax = rdi + rsi
; ----------------------------------------------------------------------------
soma:
    mov rax, rdi
    add rax, rsi
    ret

; ----------------------------------------------------------------------------
; fatorial: rax = rdi!  (recursivo, usa quadro de pilha com rbp)
; ----------------------------------------------------------------------------
fatorial:
    push rbp                           ; salva o quadro do chamador
    mov rbp, rsp                       ; novo quadro
    sub rsp, 16                        ; espaco para a variavel local n
    mov [rbp - 8], rdi                 ; guarda n na pilha
    cmp rdi, 1
    jbe .caso_base                     ; 0! = 1! = 1
    dec rdi
    call fatorial                      ; chamada recursiva
    imul rax, [rbp - 8]                ; rax = (n-1)! * n
    leave                              ; mov rsp, rbp; pop rbp
    ret
.caso_base:
    mov rax, 1
    leave
    ret

; ----------------------------------------------------------------------------
; usa_rbx_sem_estragar: altera rbx e o restaura antes de retornar
; ----------------------------------------------------------------------------
usa_rbx_sem_estragar:
    push rbx                           ; salva o valor do chamador
    mov rbx, 12345
    add rbx, 1
    pop rbx                            ; restaura: o chamador nao percebe
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
guardado resq 1
