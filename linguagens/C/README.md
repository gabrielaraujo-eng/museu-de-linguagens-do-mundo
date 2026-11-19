# C

**Desenvolvimento:** 1969–1973; o período mais criativo ocorreu em 1972, segundo o relato histórico de Dennis Ritchie.

## Descrição

C é uma linguagem de programação de propósito geral padronizada pelo ISO/IEC. Esta pasta reúne programas independentes em C11. Cada fonte define sua própria função `main`, então compile e execute um arquivo por vez.

## Exemplos

1. `exemplo_1.c` — saída básica
2. `exemplo_2.c` — variáveis e tipos
3. `exemplo_3.c` — decisão com `if`
4. `exemplo_4.c` — repetição com `for`
5. `exemplo_5.c` — função
6. `exemplo_6.c` — array
7. `exemplo_7.c` — erro de abertura de arquivo
8. `exemplo_8.c` — composição segura de strings
9. `exemplo_9.c` — função matemática `sqrt`
10. `exemplo_10.c` — estrutura e lista encadeada simples

## Exercícios demonstrativos

1. `exercicio_1.c` — mensagem
2. `exercicio_2.c` — leitura validada de inteiro
3. `exercicio_3.c` — seleção com `switch`
4. `exercicio_4.c` — contagem regressiva com `while`
5. `exercicio_5.c` — troca de valores por ponteiros
6. `exercicio_6.c` — alocação dinâmica
7. `exercicio_7.c` — término explícito do programa
8. `exercicio_8.c` — comprimento de string
9. `exercicio_9.c` — valor absoluto
10. `exercicio_10.c` — leitura de arquivo

Todos os vinte arquivos incluem comentários breves em português e são fontes independentes; não são compilados em conjunto.

## Compilação

É necessário um compilador C com suporte a C11. Exemplo geral:

```sh
gcc -std=c11 -Wall -Wextra -Wpedantic linguagens/C/exemplo_1.c -o /tmp/exemplo_1
/tmp/exemplo_1
```

Para `exemplo_9.c`, acrescente `-lm` ao comando de link em toolchains que mantenham a biblioteca matemática separada. `exercicio_10.c` lê `t.txt` no diretório de trabalho; crie esse arquivo antes de executar o exercício.
