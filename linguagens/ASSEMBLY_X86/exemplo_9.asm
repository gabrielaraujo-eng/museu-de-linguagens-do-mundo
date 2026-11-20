; ============================================================================
; exemplo_9.asm -- Matematica inteira: mdc, mmc, potencia e divisao com resto
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: mul, imul, div (rdx:rax), idiv e o algoritmo de Euclides
;
; Montagem:  nasm -f elf64 -o exemplo_9.o exemplo_9.asm
; Ligacao:   ld -o exemplo_9 exemplo_9.o
; Execucao:  ./exemplo_9
; ============================================================================

section .data
    rot_mdc  db "mdc(48, 18) = "
    len_mdc  equ $ - rot_mdc
    rot_mmc  db "mmc(48, 18) = "
    len_mmc  equ $ - rot_mmc
    rot_pot  db "2^10 = "
    len_pot  equ $ - rot_pot
    rot_div  db "47 / 5 -> quociente "
    len_div  equ $ - rot_div
    rot_rest db " resto "
    len_rest equ $ - rot_rest
    rot_neg  db "(-47) / 5 -> quociente "
    len_neg  equ $ - rot_neg
    nl       db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- mdc(48, 18) por Euclides ----------------------------
    mov rdi, 48
    mov rsi, 18
    call mdc                           ; rax = 6
    mov [temp1], rax
    lea rsi, [rot_mdc]
    mov rdx, len_mdc
    call escreve_str
    mov rax, [temp1]
    call imprime_int
    call nova_linha

    ; ---------------- mmc = a * b / mdc ----------------------------------
    ; mul rbx: rdx:rax = rax * rbx (sem sinal)
    mov rax, 48
    mov rbx, 18
    mul rbx                            ; rdx:rax = 864
    xor edx, edx                       ; descarta a parte alta (cabe em 64 bits)
    mov rcx, 6                         ; mdc calculado acima
    div rcx                            ; rax = 144
    mov [temp1], rax
    lea rsi, [rot_mmc]
    mov rdx, len_mmc
    call escreve_str
    mov rax, [temp1]
    call imprime_int
    call nova_linha

    ; ---------------- potencia 2^10 ---------------------------------------
    mov rdi, 2
    mov rsi, 10
    call potencia                      ; rax = 1024
    mov [temp1], rax
    lea rsi, [rot_pot]
    mov rdx, len_pot
    call escreve_str
    mov rax, [temp1]
    call imprime_int
    call nova_linha

    ; ---------------- divisao com sinal e sem sinal -----------------------
    mov rax, 47
    xor edx, edx
    mov rcx, 5
    div rcx                            ; quociente 9, resto 2
    mov [temp1], rax
    mov [temp2], rdx
    lea rsi, [rot_div]
    mov rdx, len_div
    call escreve_str
    mov rax, [temp1]
    call imprime_int
    lea rsi, [rot_rest]
    mov rdx, len_rest
    call escreve_str
    mov rax, [temp2]
    call imprime_int
    call nova_linha

    ; idiv trabalha com sinal e exige cqo (estende rax para rdx:rax)
    mov rax, -47
    cqo
    mov rcx, 5
    idiv rcx                           ; quociente -9, resto -2
    mov [temp1], rax
    mov [temp2], rdx
    lea rsi, [rot_neg]
    mov rdx, len_neg
    call escreve_str
    mov rax, [temp1]
    call imprime_int
    lea rsi, [rot_rest]
    mov rdx, len_rest
    call escreve_str
    mov rax, [temp2]
    call imprime_int
    call nova_linha

    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; mdc: rax = mdc(rdi, rsi) pelo algoritmo de Euclides (resto de divisoes)
; ----------------------------------------------------------------------------
mdc:
    mov rax, rdi
    mov rbx, rsi
.laco:
    test rbx, rbx
    jz .pronto
    xor edx, edx
    div rbx                            ; rdx = rax mod rbx
    mov rax, rbx
    mov rbx, rdx
    jmp .laco
.pronto:
    ret

; ----------------------------------------------------------------------------
; potencia: rax = rdi ^ rsi (expoente inteiro nao negativo)
; ----------------------------------------------------------------------------
potencia:
    mov rax, 1
    mov rcx, rsi
    test rcx, rcx
    jz .fim
.laco:
    imul rax, rdi
    loop .laco
.fim:
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
temp1 resq 1
temp2 resq 1
