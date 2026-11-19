# GNU Bash

## Classificação e variante

Bash (Bourne Again Shell) é o shell do Projeto GNU e uma linguagem de scripting e linha de comandos. Esta pasta usa **GNU Bash**, não POSIX `sh`: os exemplos incluem recursos próprios do Bash, como expansão de sequência, arrays indexados, comandos aritméticos `(( ... ))` e substituição de texto em parâmetros. Os arquivos `.sh` devem ser executados com Bash, por exemplo `bash exemplo_1.sh`.

O ano de criação não é indicado aqui: a auditoria não encontrou nas fontes primárias consultadas evidência suficiente para confirmar uma data ou definir qual marco histórico ela representaria.

## Exemplos

Os dez scripts são exemplos funcionais de tópicos introdutórios. Execute-os com `bash nome_do_arquivo.sh`.

| Arquivo | Tópico |
| --- | --- |
| [`exemplo_1.sh`](exemplo_1.sh) | Olá, mundo e saída com `printf` |
| [`exemplo_2.sh`](exemplo_2.sh) | Atribuição e expansão de variáveis |
| [`exemplo_3.sh`](exemplo_3.sh) | Condicionais e comparação aritmética |
| [`exemplo_4.sh`](exemplo_4.sh) | Laço `for` e expansão de sequência do Bash |
| [`exemplo_5.sh`](exemplo_5.sh) | Definição e chamada de função; resultado na saída padrão |
| [`exemplo_6.sh`](exemplo_6.sh) | Array indexado do Bash |
| [`exemplo_7.sh`](exemplo_7.sh) | Verificação de legibilidade e tratamento de falha |
| [`exemplo_8.sh`](exemplo_8.sh) | Substituição de texto em variável |
| [`exemplo_9.sh`](exemplo_9.sh) | Aritmética inteira do Bash |
| [`exemplo_10.sh`](exemplo_10.sh) | Ordenação de linhas com o utilitário externo `sort` |

`exemplo_10.sh` invoca `sort`, que não é sintaxe nem builtin do Bash; requer que o utilitário GNU Coreutils esteja disponível no `PATH`. Já a aritmética do exemplo 9 é inteira, não ponto flutuante.

## Exercícios

Cada script é uma tarefa executável e distinta. Os objetivos abaixo descrevem o que cada exercício demonstra; execute-os com `bash exercicio_N.sh`.

| Arquivo | Objetivo |
| --- | --- |
| [`exercicio_1.sh`](exercicio_1.sh) | Imprimir uma saudação usando `printf`. |
| [`exercicio_2.sh`](exercicio_2.sh) | Atribuir duas variáveis e interpolá-las na saída. |
| [`exercicio_3.sh`](exercicio_3.sh) | Verificar se um inteiro predefinido é par ou ímpar. |
| [`exercicio_4.sh`](exercicio_4.sh) | Somar os inteiros de 1 a 5 com um laço. |
| [`exercicio_5.sh`](exercicio_5.sh) | Definir e chamar uma função que multiplica dois inteiros. |
| [`exercicio_6.sh`](exercicio_6.sh) | Percorrer um array indexado e exibir quantidade e elementos. |
| [`exercicio_7.sh`](exercicio_7.sh) | Verificar se um arquivo pode ser lido; opcionalmente, passe seu caminho como argumento. Sem argumento, usa `/dev/null`. |
| [`exercicio_8.sh`](exercicio_8.sh) | Substituir hífens por espaços em uma variável de texto. |
| [`exercicio_9.sh`](exercicio_9.sh) | Calcular a área inteira de um retângulo. |
| [`exercicio_10.sh`](exercicio_10.sh) | Ordenar linhas com o utilitário externo GNU `sort`. |

## Referências

- [GNU Bash — Projeto GNU](https://www.gnu.org/software/bash/)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html), incluindo [arrays](https://www.gnu.org/software/bash/manual/html_node/Arrays.html), [expansões](https://www.gnu.org/software/bash/manual/html_node/Shell-Expansions.html), [aritmética](https://www.gnu.org/software/bash/manual/html_node/Shell-Arithmetic.html), [condicionais](https://www.gnu.org/software/bash/manual/html_node/Conditional-Constructs.html) e [funções](https://www.gnu.org/software/bash/manual/html_node/Shell-Functions.html)
- [GNU Coreutils: sort](https://www.gnu.org/software/coreutils/manual/html_node/sort-invocation.html)
