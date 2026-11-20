; ============================================================================
; exemplo_6.asm -- Estruturas de dados: vetor e registro com struc/istruc
; Dialeto: NASM (sintaxe Intel), x86-64, Linux, apenas chamadas de sistema
; Topico: acesso indexado com escala e campos de struct por deslocamento
;
; Montagem:  nasm -f elf64 -o exemplo_6.o exemplo_6.asm
; Ligacao:   ld -o exemplo_6 exemplo_6.o
; Execucao:  ./exemplo_6
; ============================================================================

; struc cria apenas constantes de deslocamento; nao reserva memoria.
struc aluno
    .id   resd 1                       ; deslocamento 0, 4 bytes
    .nota resd 1                       ; deslocamento 4, 4 bytes
endstruc                               ; aluno_size = 8

section .data
    ; Vetor simples de 32 bits: cada elemento ocupa 4 bytes.
    vetor      dd 10, 20, 30, 40, 50
    n_vetor    equ 5

    ; Vetor de registros: tres alunos contiguos de 8 bytes cada.
    tabela:
        istruc aluno
            at aluno.id,   dd 1
            at aluno.nota, dd 90
        iend
        istruc aluno
            at aluno.id,   dd 2
            at aluno.nota, dd 75
        iend
        istruc aluno
            at aluno.id,   dd 3
            at aluno.nota, dd 60
        iend
    n_alunos equ 3

    rot_vet db "soma do vetor = "
    len_vet equ $ - rot_vet
    rot_med db "media dos alunos = "
    len_med equ $ - rot_med
    rot_alu db "aluno "
    len_alu equ $ - rot_alu
    rot_not db " nota "
    len_not equ $ - rot_not
    rot_off db "deslocamento de .nota dentro de aluno = "
    len_off equ $ - rot_off
    nl      db 10

section .bss
    buf resb 32

section .text
    global _start

_start:
    ; ---------------- soma do vetor com indexacao escalada ----------------
    xor rbx, rbx                       ; indice i = 0
    xor r12, r12                       ; acumulador
.soma_vetor:
    cmp rbx, n_vetor
    jge .fim_soma
    mov eax, [vetor + rbx*4]           ; endereco = vetor + i * 4
    add r12, rax
    inc rbx
    jmp .soma_vetor
.fim_soma:
    lea rsi, [rot_vet]
    mov rdx, len_vet
    call escreve_str
    mov rax, r12
    call imprime_int
    call nova_linha

    ; ---------------- percorre os registros da tabela ---------------------
    xor rbx, rbx
    xor r13, r13                       ; soma das notas
.laco_alunos:
    cmp rbx, n_alunos
    jge .fim_alunos
    mov r14, rbx
    imul r14, aluno_size               ; deslocamento do registro atual

    lea rsi, [rot_alu]
    mov rdx, len_alu
    call escreve_str
    mov eax, [tabela + r14 + aluno.id]
    call imprime_int
    lea rsi, [rot_not]
    mov rdx, len_not
    call escreve_str
    mov eax, [tabela + r14 + aluno.nota]
    add r13, rax
    call imprime_int
    call nova_linha

    inc rbx
    jmp .laco_alunos
.fim_alunos:
    lea rsi, [rot_med]
    mov rdx, len_med
    call escreve_str
    mov rax, r13
    xor edx, edx
    mov rcx, n_alunos
    div rcx                            ; media inteira
    call imprime_int
    call nova_linha

    lea rsi, [rot_off]
    mov rdx, len_off
    call escreve_str
    mov rax, aluno.nota                ; constante calculada pelo struc = 4
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
