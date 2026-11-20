; ============================================================================
; exercicio_1.asm -- Saida em varias linhas com sys_write
; Enunciado: escrever tres linhas na saida padrao e encerrar com codigo 0.
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
;
; Montagem:  nasm -f elf64 -o exercicio_1.o exercicio_1.asm
; Ligacao:   ld -o exercicio_1 exercicio_1.o
; Execucao:  ./exercicio_1
; ============================================================================

section .data
    linha1 db "Museu de Linguagens do Mundo", 10
    len1   equ $ - linha1
    linha2 db "Sala: Assembly x86 (NASM, Linux x86-64)", 10
    len2   equ $ - linha2
    linha3 db "Tres chamadas a sys_write, um unico processo.", 10
    len3   equ $ - linha3

section .text
    global _start

_start:
    ; Cada linha usa o par rax=1 (sys_write) / rdi=1 (stdout).
    mov rax, 1
    mov rdi, 1
    lea rsi, [linha1]
    mov rdx, len1
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [linha2]
    mov rdx, len2
    syscall

    mov rax, 1
    mov rdi, 1
    lea rsi, [linha3]
    mov rdx, len3
    syscall

    mov rax, 60                        ; sys_exit
    xor rdi, rdi                       ; codigo 0
    syscall
