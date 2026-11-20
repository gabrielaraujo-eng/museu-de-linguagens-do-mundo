# ATS

**Linhagem:** ATS (Applied Type System), criada por Hongwei Xi a partir de 2003
**Linguagem desta pasta:** ATS2 (ATS/Postiats), a implementação atual da linguagem, na versão 0.4.x

## Descrição

ATS é uma linguagem funcional de tipos dependentes que combina programação funcional com programação imperativa e com verificação formal. O núcleo teórico é o *Applied Type System*, no qual a verificação de tipos e a verificação de provas são separadas: tipos indexados descrevem os dados, e "views" (visões) lineares descrevem os recursos de memória. ATS2 é a segunda geração da implementação, escrita em ATS e distribuída como `patsopt` (compilador que traduz ATS para C) mais o script `atscc`, que aciona o compilador C e o linker.

Os programas desta pasta usam apenas o subconjunto "dinâmico" da linguagem: funções recursivas, tipos algébricos, casamento de padrões, listas persistentes e variáveis locais. Não há provas formais nem tipos dependentes explícitos aqui, porque o objetivo é mostrar a sintaxe executável de ATS2 de forma progressiva. Arquivos `.dats` contêm código dinâmico; arquivos `.sats` (assinaturas) e `.hats` (cabeçalhos) não são necessários quando a função é definida no próprio arquivo.

## Arquivos

Todos os arquivos têm a extensão `.dats`, a extensão convencional de código ATS dinâmico. Cada um começa com `#include "share/atspre_staload.hats"`, que carrega a prelude de ATS2 (tipos básicos, aritmética sobrecarregada, `printf`, listas, opções), e define o ponto de entrada com `implement main0 () = ...`.

### Exemplos

1. `exemplo_1` — estrutura mínima de um programa ATS2 com `main0`
2. `exemplo_2` — ligações imutáveis com `val`, células mutáveis com `var` e os tipos `int`, `double`, `bool`, `string`
3. `exemplo_3` — seleção com `if`/`then`/`else` como expressão e `case ... of` sobre constantes inteiras
4. `exemplo_4` — repetição por recursão de cauda com acumulador e por `while` sobre uma variável
5. `exemplo_5` — funções, funções anônimas com `lam`, tipos de função e ordem superior
6. `exemplo_6` — `datatype` com construtores que carregam valores, casamento com `case+` e a lista `list0`
7. `exemplo_7` — resultado explícito para sinalizar falhas, sem exceções, e verificação com `assertloc`
8. `exemplo_8` — strings como parâmetros e resultados, com `string_length` e `string_append`
9. `exemplo_9` — aritmética inteira e em ponto flutuante: potência, máximo divisor comum, Fibonacci e raiz quadrada por Newton-Raphson
10. `exemplo_10` — ordenação por inserção em lista persistente, mostrando que a lista original não é alterada

### Exercícios

Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1` — saída em duas linhas, com `println!` e `printf`
2. `exercicio_2` — conversão de Celsius para Fahrenheit com `double`
3. `exercicio_3` — classificação de um inteiro em positivo, negativo ou zero
4. `exercicio_4` — soma dos números pares de 1 a 20 por recursão de cauda
5. `exercicio_5` — fatorial recursivo e coeficiente binomial
6. `exercicio_6` — inversão de uma lista de cinco posições com acumulador
7. `exercicio_7` — divisão protegida contra divisor nulo, com valor sentinela e contador de falhas
8. `exercicio_8` — strings recebidas como parâmetros e devolvidas por função
9. `exercicio_9` — maior, menor e média de seis notas, em uma única passagem, com registro plano `@{...}`
10. `exercicio_10` — números primos até 50 por divisão tentativa, com contagem

## Como executar

A implementação de referência é o ATS2 (ATS/Postiats), disponível em <https://www.ats-lang.org/Downloads.html>; o pacote traz `patsopt` e o script `atscc`. Depois de instalar e ajustar `PATSHOME` e `PATH`:

```sh
export PATSHOME=/caminho/para/ATS2-Postiats
export PATH=$PATSHOME/bin:$PATH

# gerar o executável a partir do arquivo .dats
atscc -o exemplo_1 exemplo_1.dats
./exemplo_1

# apenas verificar os tipos, sem gerar código C nem executável
patsopt --typecheck -d exemplo_1.dats
```

O mesmo vale para os demais arquivos: troque o nome e o programa compilado. Nenhum arquivo depende de biblioteca externa além da prelude e da biblioteca padrão do C, usada pelo código gerado.

## Escopo e limitações documentadas

- **Ponto de entrada:** o programa começa em `main0`, cujo tipo é `() -> void`. A forma `main` (com lista de argumentos) existe, mas não é usada aqui.
- **Impressão:** `printf` de ATS2 aceita as diretivas `%d` (int), `%f` (double), `%s` (string) e `%c` (char). Não há formatação de casas decimais como `%.2f` na versão de `printf` da prelude; os valores `double` saem no formato padrão de `%f`. `bool` não tem diretiva própria: os exemplos convertem para string com `if`.
- **Repetição:** ATS2 não tem `for` no núcleo. O idioma recomendado é a recursão de cauda, que o compilador trata como laço; `while` existe e só faz sentido sobre uma célula declarada com `var`.
- **Sem provas:** os tipos dependentes, as views lineares e as provas de terminação de ATS não aparecem nos exemplos. As funções recursivas são aceitas sem métrica de terminação, o que é permitido, mas deixa a terminação sem verificação formal.
- **Listas:** `list0(T)` é a lista persistente da prelude, com construtores `list0_nil` e `list0_cons`, e a macro `$list{T}(...)` monta listas literais. Listas lineares (`list_vt`) e arrays ficam fora do escopo desta pasta.
- **Erros:** ATS2 tem exceções (`$raise`, `try ... with`) e o tipo `option`, mas os exemplos preferem resultados explícitos em `datatype`, o que obriga o chamador a tratar os dois casos.
- **Acentuação:** os literais de string e os comentários estão em UTF-8 e são repassados sem alteração ao C gerado; a saída depende do terminal.

## Validação executada

Não houve compilação. Não existe pacote `ats2` no repositório APT desta máquina e a construção a partir do código-fonte exige os arquivos C de bootstrap (`CBOOT`) que não acompanham a árvore do Git, de modo que `patsopt` não pôde ser construído no tempo disponível. A verificação feita foi estática: cada construção usada nos 21 arquivos foi conferida contra as fontes da prelude da versão 0.4.2 e contra o tutorial oficial, como registrado em `RELATORIO.md`. Nenhuma saída de programa é apresentada como observada.

## Referências

- Sítio oficial de ATS: <https://www.ats-lang.org/>
- Tutorial de ATS2 (ATS2TUTORIAL), capítulo de referência: <https://www.ats-lang.org/Documents.html>
- *Introduction to Programming in ATS*: <http://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/>
- Código-fonte do ATS2 (ATS/Postiats), versão 0.4.2: <https://github.com/githwxi/ATS-Postiats>
- Hongwei Xi, *Applied Type System* (tese e artigos sobre o núcleo teórico): <https://www.ats-lang.org/Papers.html>
