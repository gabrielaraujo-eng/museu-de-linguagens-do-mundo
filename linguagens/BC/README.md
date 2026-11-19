# bc

**Documentação histórica:** o manual do Unix V6 de 20/02/1975 já documenta `bc`; essa data não comprova o ano exato de criação da linguagem.

## Sobre e compatibilidade

`bc` é uma linguagem de cálculo aritmético de precisão arbitrária, usada de forma interativa ou em scripts. Seu foco é numérico: ela oferece variáveis e arrays numéricos unidimensionais, expressões, funções e controle de fluxo; não é uma linguagem geral para manipulação de texto.

Os arquivos desta pasta têm como alvo a sintaxe padrão **POSIX.1-2024 `bc`**, e não extensões específicas do GNU `bc`. Por isso, não usam `else`, nomes de variáveis/funções com várias letras nem comentários `#`. Comentários usam `/* ... */`. O modo `-s` do GNU `bc` pode ser usado para verificar a sintaxe padrão:

```sh
cd linguagens/BC
bc -s < exemplo_1.bc
```

A opção de conformidade e a forma de fornecer arquivos podem variar entre implementações. Os arquivos foram revisados para o subconjunto POSIX documentado; a verificação local usa GNU `bc` 1.07.1 em modo `-s`.

Strings em `bc` são literais de saída, não valores atribuíveis a variáveis nem objetos com operações gerais de texto. Quando uma saída precisa de quebra de linha, os exemplos usam uma quebra real dentro da string; `\n` não é uma sequência de escape portátil. O exemplo 7 demonstra validação de uma condição numérica antes da divisão, não tratamento de exceções. Arrays não são listas genéricas, e `bc` não fornece uma função interna `sort`: no exemplo 10, a ordenação é implementada com array e laços.

## Exemplos

1. **`exemplo_1.bc` — Saída textual:** imprime uma saudação usando um literal.
2. **`exemplo_2.bc` — Variáveis numéricas:** atribui e exibe dois valores numéricos.
3. **`exemplo_3.bc` — Condições:** compara um valor com um limite usando dois `if` portáveis.
4. **`exemplo_4.bc` — Laço `for`:** exibe os inteiros de 1 a 5.
5. **`exemplo_5.bc` — Função:** define e chama uma função de soma com identificador POSIX de uma letra.
6. **`exemplo_6.bc` — Array numérico:** armazena e soma dois elementos indexados.
7. **`exemplo_7.bc` — Validação numérica:** verifica o divisor antes de tentar uma divisão.
8. **`exemplo_8.bc` — Literais de saída:** demonstra mensagens literais; não manipula texto.
9. **`exemplo_9.bc` — Raiz quadrada:** usa `scale` e a função padrão `sqrt`.
10. **`exemplo_10.bc` — Ordenação explícita:** ordena um array numérico com laços e trocas; não chama um `sort` interno.

## Exercícios

Cada arquivo apresenta a tarefa em comentário e uma implementação executável de referência. Os objetivos são distintos:

1. **`exercicio_1.bc` — Saudação:** imprima uma saudação em uma linha.
2. **`exercicio_2.bc` — Soma:** some dois valores numéricos armazenados em variáveis.
3. **`exercicio_3.bc` — Classificação por limite:** indique se um valor é maior que 10 ou não.
4. **`exercicio_4.bc` — Acumulador:** calcule a soma dos inteiros de 1 a 10 com um laço.
5. **`exercicio_5.bc` — Função de quadrado:** defina e chame uma função que eleva um número ao quadrado.
6. **`exercicio_6.bc` — Média de array:** calcule a média de três elementos numéricos.
7. **`exercicio_7.bc` — Divisão segura:** evite a divisão quando o divisor for zero e informe essa condição.
8. **`exercicio_8.bc` — Mensagens literais:** imprima duas mensagens estáticas sem atribuir strings a variáveis.
9. **`exercicio_9.bc` — Raiz quadrada:** calcule a raiz de 225 com quatro casas decimais.
10. **`exercicio_10.bc` — Ordenação:** implemente ordenação crescente de um array com laços e trocas.

Para executar um exercício, por exemplo:

```sh
bc -s < exercicio_1.bc
```

## Referências

- [POSIX.1-2024 — `bc`](https://pubs.opengroup.org/onlinepubs/9799919799/utilities/bc.html), sintaxe e comportamento padrão.
- [Manual do GNU `bc`](https://www.gnu.org/software/bc/manual/html_mono/bc.html) e [notas de compatibilidade](https://www.gnu.org/software/bc/manual/html_chapter/bc_8.html), incluindo extensões GNU não pressupostas aqui.
- [Manual do `bc` do Unix V6](https://www.tuhs.org/cgi-bin/utree.pl?file=V6/usr/man/man1/bc.1), datado de 20 de fevereiro de 1975.
