; ============================================================================
; exercicio_8.asm -- Converter uma string para maiusculas
; Enunciado: percorrer "museu de linguagens" byte a byte, trocar 'a'..'z' pelas
;            maiusculas correspondentes (subtraindo 32) e imprimir o resultado.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_8.o exercicio_8.asm
; Ligacao:   ld -o exercicio_8 exercicio_8.o
; Execucao:  ./exercicio_8
; ============================================================================

section .data
    texto db "museu de linguagens", 0

    rot_ant db "antes  : "
    len_ant equ $ - rot_ant
    rot_dep db "depois : "
    len_dep equ $ - rot_dep
    nl      db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- imprime o original --------------------------------
    lea rdi, [texto]
    call strlen
    mov r13, rax                       ; comprimento da string
    mov [tam], rax

    lea rsi, [rot_ant]
    mov rdx, len_ant
    call escreve_str
    lea rsi, [texto]
    mov rdx, r13
    call escreve_str
    call nova_linha

    ; ---------------- converte para maiusculas --------------------------
    xor rbx, rbx
.laco:
    cmp rbx, [tam]
    jge .fim_laco
    lea rdi, [texto]
    mov al, [rdi + rbx]
    cmp al, 'a'
    jb .proximo                        ; abaixo de 'a': nao e letra minuscula
    cmp al, 'z'
    ja .proximo                        ; acima de 'z': idem (espaco, por exemplo)
    sub al, 32                         ; distancia entre 'a' e 'A' na tabela ASCII
    mov [rdi + rbx], al
.proximo:
    inc rbx
    jmp .laco
.fim_laco:

    ; ---------------- imprime o resultado -------------------------------
    lea rsi, [rot_dep]
    mov rdx, len_dep
    call escreve_str
    lea rsi, [texto]
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

section .bss
tam resq 1
