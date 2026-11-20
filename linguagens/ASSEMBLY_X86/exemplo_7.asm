; ============================================================================
; exemplo_7.asm -- Tratamento de erros: codigo de retorno e errno de syscall
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: verificacao de divisor nulo e erro devolvido pelo kernel em rax
;
; Assembly nao tem excecoes: o erro e um valor de retorno que o chamador testa.
;
; Montagem:  nasm -f elf64 -o exemplo_7.o exemplo_7.asm
; Ligacao:   ld -o exemplo_7 exemplo_7.o
; Execucao:  ./exemplo_7
; ============================================================================

section .data
    caminho   db "/caminho/que/nao/existe.txt", 0

    rot_ok    db "10 / 2 = "
    len_ok    equ $ - rot_ok
    rot_err   db "10 / 0 -> erro detectado: divisor nulo", 10
    len_err   equ $ - rot_err
    rot_open  db "open() de arquivo inexistente -> rax = "
    len_open  equ $ - rot_open
    rot_enoent db "  (ENOENT = 2, sinal negativo indica erro)", 10
    len_enoent equ $ - rot_enoent
    rot_fim   db "o programa continua: o erro foi tratado, nao derrubou o processo", 10
    len_fim   equ $ - rot_fim
    nl        db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- caso 1: divisao valida ------------------------------
    mov rax, 10
    mov rbx, 2
    call divisao_segura                ; rax = quociente, rdx = 0 (ok)
    mov [quoc], rax                    ; syscall destroi rax: guarda o resultado
    test rdx, rdx
    jnz .erro_div
    lea rsi, [rot_ok]
    mov rdx, len_ok
    call escreve_str
    mov rax, [quoc]
    call imprime_int
    call nova_linha
    jmp .caso2

.erro_div:
    lea rsi, [rot_err]
    mov rdx, len_err
    call escreve_str

.caso2:
    ; ---------------- caso 2: divisor nulo --------------------------------
    mov rax, 10
    xor rbx, rbx                       ; divisor = 0
    call divisao_segura                ; nao executa div: retorna rdx = 1
    mov [quoc], rax
    test rdx, rdx
    jz .sem_erro
    lea rsi, [rot_err]
    mov rdx, len_err
    call escreve_str
    jmp .caso3
.sem_erro:
    lea rsi, [rot_ok]
    mov rdx, len_ok
    call escreve_str
    mov rax, [quoc]
    call imprime_int
    call nova_linha

.caso3:
    ; ---------------- caso 3: erro devolvido pelo kernel ------------------
    ; Syscalls sinalizam falha com valor negativo em rax (ate -4095).
    mov rax, 2                         ; 2 = sys_open
    lea rdi, [caminho]
    xor esi, esi                       ; O_RDONLY
    xor edx, edx                       ; sem modo
    syscall                            ; rax = -2 (ENOENT)
    mov [errno], rax

    lea rsi, [rot_open]
    mov rdx, len_open
    call escreve_str
    mov rax, [errno]
    call imprime_int
    lea rsi, [rot_enoent]
    mov rdx, len_enoent
    call escreve_str

    cmp qword [errno], 0
    jge .sem_falha
    lea rsi, [rot_fim]
    mov rdx, len_fim
    call escreve_str
.sem_falha:
    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; divisao_segura: rax = rax / rbx, com verificacao de divisor nulo
; entrada: rax = dividendo, rbx = divisor
; saida:   rax = quociente, rdx = 0 (ok) ou 1 (divisor nulo)
; ----------------------------------------------------------------------------
divisao_segura:
    test rbx, rbx
    jz .falha
    xor edx, edx
    div rbx                            ; se rbx = 0 aqui, o processo morreria (SIGFPE)
    xor edx, edx
    ret
.falha:
    xor eax, eax
    mov rdx, 1
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
errno resq 1
quoc  resq 1
