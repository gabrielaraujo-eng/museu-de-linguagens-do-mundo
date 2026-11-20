; ============================================================================
; exemplo_1.asm -- "Ola, Mundo" em assembly x86-64 para Linux
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: primeiro programa, sys_write e sys_exit
;
; Montagem:  nasm -f elf64 -o exemplo_1.o exemplo_1.asm
; Ligacao:   ld -o exemplo_1 exemplo_1.o
; Execucao:  ./exemplo_1
; ============================================================================

section .data
    mensagem db "Ola, Mundo!", 10      ; 10 = caractere de nova linha (LF)
    tam      equ $ - mensagem          ; $ e o endereco atual: tamanho calculado

section .text
    global _start                      ; ponto de entrada do programa (ELF)

_start:
    ; sys_write(fd=1, buf, count): rax = numero da syscall, rdi/rsi/rdx = argumentos
    mov rax, 1                         ; 1 = sys_write
    mov rdi, 1                         ; 1 = descritor da saida padrao
    lea rsi, [mensagem]                ; endereco do texto (lea carrega endereco)
    mov rdx, tam                       ; quantidade de bytes a escrever
    syscall                            ; transfere o controle ao kernel

    ; sys_exit(codigo): encerra o processo devolvendo o codigo ao shell
    mov rax, 60                        ; 60 = sys_exit
    xor rdi, rdi                       ; codigo de saida 0 (xor zera o registrador)
    syscall
