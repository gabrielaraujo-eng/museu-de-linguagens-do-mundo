; ============================================================================
; exemplo_2.asm -- Variaveis e tipos de dados (db, dw, dd, dq)
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: secao .data, tamanhos de dados e carga com movzx
;
; Montagem:  nasm -f elf64 -o exemplo_2.o exemplo_2.asm
; Ligacao:   ld -o exemplo_2 exemplo_2.o
; Execucao:  ./exemplo_2
; ============================================================================

section .data
    ; Em assembly nao existe "tipo" verificado: existe o tamanho em bytes.
    val_byte  db 42                    ; 1 byte
    val_word  dw 1000                  ; 2 bytes
    val_dword dd 70000                 ; 4 bytes
    val_qword dq 5000000000            ; 8 bytes
fim_dados:

    total equ fim_dados - val_byte     ; soma dos tamanhos = 15 bytes

    rot_b db "db  (1 byte)  = "
    len_b equ $ - rot_b
    rot_w db "dw  (2 bytes) = "
    len_w equ $ - rot_w
    rot_d db "dd  (4 bytes) = "
    len_d equ $ - rot_d
    rot_q db "dq  (8 bytes) = "
    len_q equ $ - rot_q
    rot_t db "total reservado em .data = "
    len_t equ $ - rot_t
    rot_f db " bytes", 10
    len_f equ $ - rot_f
    nl    db 10

section .bss
    buf resb 32                        ; buffer para converter numeros em texto

section .text
    global _start

_start:
    lea rsi, [rot_b]                   ; rotulo do primeiro campo
    mov rdx, len_b
    call escreve_str
    movzx rax, byte [val_byte]         ; movzx: carrega 1 byte e zera o resto
    call imprime_int
    call nova_linha

    lea rsi, [rot_w]
    mov rdx, len_w
    call escreve_str
    movzx rax, word [val_word]         ; 2 bytes -> 64 bits
    call imprime_int
    call nova_linha

    lea rsi, [rot_d]
    mov rdx, len_d
    call escreve_str
    mov eax, [val_dword]               ; 4 bytes: escrever em eax zera rax
    call imprime_int
    call nova_linha

    lea rsi, [rot_q]
    mov rdx, len_q
    call escreve_str
    mov rax, [val_qword]               ; 8 bytes cabem inteiros em rax
    call imprime_int
    call nova_linha

    lea rsi, [rot_t]
    mov rdx, len_t
    call escreve_str
    mov rax, total
    call imprime_int
    lea rsi, [rot_f]
    mov rdx, len_f
    call escreve_str

    mov rax, 60
    xor rdi, rdi
    syscall

; ----------------------------------------------------------------------------
; escreve_str: escreve rdx bytes apontados por rsi na saida padrao
; ----------------------------------------------------------------------------
escreve_str:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

; ----------------------------------------------------------------------------
; nova_linha: escreve um unico caractere de nova linha
; ----------------------------------------------------------------------------
nova_linha:
    lea rsi, [nl]
    mov rdx, 1
    jmp escreve_str                    ; cauda: chamada com ret do destino

; ----------------------------------------------------------------------------
; imprime_int: converte o inteiro com sinal de rax para decimal e escreve
; Preserva rbx; destroi rax, rcx, rdx, rsi, rdi, r8
; ----------------------------------------------------------------------------
imprime_int:
    push rbx
    lea rsi, [buf + 31]                ; escreve de tras para frente no buffer
    mov rbx, 10
    xor ecx, ecx                       ; contador de digitos
    xor r8d, r8d                       ; 0 = positivo, 1 = negativo
    test rax, rax
    jns .converte
    neg rax                            ; transforma em positivo
    mov r8d, 1
.converte:
    xor edx, edx                       ; div usa rdx:rax
    div rbx                            ; rax = quociente, rdx = resto
    add dl, '0'                        ; resto -> digito ASCII
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
