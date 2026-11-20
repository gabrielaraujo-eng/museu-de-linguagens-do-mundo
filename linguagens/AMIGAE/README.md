# Amiga E

**Linhagem:** linguagem E, criada por Wouter van Oortmerssen para o Amiga
**Marcos datados:** criação iniciada em 1991, lançamento público em 1993, versão comercial em 1994, código-fonte liberado em 1997

## Descrição

Amiga E (ou simplesmente E) é uma linguagem compilada criada por Wouter van Oortmerssen para os computadores Amiga. O autor relata ter começado a escrevê-la em 1991, publicado em 1993, comercializado em 1994 e aberto o código em 1997. O compilador inteiro, cerca de 400 KB de assembly 68000 em um único arquivo, foi escrito à mão pelo próprio autor.

A linguagem mistura programação procedural, orientada a objetos e funcional: tem procedimentos e funções com múltiplos valores de retorno, objetos com herança e métodos, listas imediatas tipadas (*E-lists*), strings de tamanho fixo, tratamento de exceções, assembler embutido e um sistema de módulos. A tipagem é fraca: toda variável escalar é um inteiro de 32 bits (`LONG`), e `INT` e `CHAR` existem apenas como elementos de tipos compostos, como `ARRAY OF INT`.

Três detalhes costumam surpreender quem vem de C:

- **Não há precedência de operadores.** As expressões são avaliadas da esquerda para a direita, de modo que `2 + 3 * 4` vale 20. Parênteses são obrigatórios quando a ordem desejada não é a linear.
- **`MOD` não é operador, é função:** escreve-se `Mod(a, b)`.
- **`ENDPROC` é uma instrução de nível de procedimento.** Ela não pode aparecer dentro de um bloco `IF`/`ENDIF`; nesses casos o valor é atribuído a uma variável local e devolvido no `ENDPROC` final.

## Arquivos

Todos os arquivos usam a extensão `.e`, a mesma da distribuição oficial do compilador. Cada arquivo é um programa completo, com `PROC main()` e `ENDPROC`, comentado em português com a forma de comentário da linguagem (`->` até o fim da linha e `/* ... */`).

### Exemplos

1. `exemplo_1.e` — saída de texto com `WriteF` e os especificadores `\n`, `\d` e `\s`
2. `exemplo_2.e` — variáveis com `DEF`, `CONST`, `STRING` e `ARRAY OF INT`
3. `exemplo_3.e` — `IF`/`ELSEIF`/`ELSE`/`ENDIF`, forma horizontal `IF ... THEN` e `SELECT`/`CASE`/`ENDSELECT`
4. `exemplo_4.e` — `FOR`/`ENDFOR` com `STEP -1`, `WHILE`, `REPEAT`/`UNTIL` e `EXIT`
5. `exemplo_5.e` — procedimentos, função com `IS`, recursão e retorno de dois valores
6. `exemplo_6.e` — E-lists imediatas tipadas, acesso por índice e liberação com `END`
7. `exemplo_7.e` — exceções com `HANDLE`, `EXCEPT`, `Raise` e a variável `exception`
8. `exemplo_8.e` — `STRING`, `StrCopy`, `EstrLen` e manipulação de caracteres por índice
9. `exemplo_9.e` — aritmética inteira, `Mod()` e a ausência de precedência
10. `exemplo_10.e` — ordenação por trocas (*bubble sort*) sobre um vetor global

### Exercícios

Cada exercício é um programa completo e resolvido, com enunciado em comentário no topo do arquivo:

1. `exercicio_1.e` — cartão de visitas em três linhas com `WriteF`
2. `exercicio_2.e` — conversão de Celsius para Fahrenheit com `LONG`
3. `exercicio_3.e` — situação do aluno por nota e conceito com `SELECT`/`CASE ... TO`
4. `exercicio_4.e` — soma, contagem e média dos pares de 1 a 100, com `FOR` e com `WHILE`
5. `exercicio_5.e` — potência por laço e por recursão
6. `exercicio_6.e` — total, maior e média de uma E-list de seis preços
7. `exercicio_7.e` — saque bancário com `Raise` e tratador `HANDLE`/`EXCEPT`
8. `exercicio_8.e` — contagem de vogais e inversão de uma `STRING`
9. `exercicio_9.e` — `mdc` por Euclides com `Mod()` e `mmc` correspondente
10. `exercicio_10.e` — ordenação decrescente por seleção (*selection sort*)

## Como compilar

No AmigaOS original, com o compilador `ec` da distribuição Amiga E v3.3a instalado e a atribuição `EMODULES:` apontando para os módulos:

```sh
ec exemplo_1.e
exemplo_1
```

O resultado é um executável AmigaOS (hunks 68K), não um binário para a máquina hospedeira: ele roda em um Amiga real ou em emulador (WinUAE, FS-UAE, vAmiga).

Como o `ec` original é um programa 68K, uma alternativa em máquinas atuais é o compilador `ecomp`, escrito em JavaScript sem dependências, que gera executáveis AmigaOS a partir da mesma sintaxe:

```sh
node tools/ecc.js --source=exemplo_1.e --out=exemplo_1
```

O `ecomp` também aceita `--adf=exemplo_1.adf` para produzir uma imagem de disquete inicializável. Foi essa a ferramenta usada na validação desta pasta.

## Escopo e limitações documentadas

- **Saída de texto:** `WriteF` pertence ao runtime do E; `\d` imprime inteiro, `\s` imprime string, `\n` quebra a linha.
- **Aspas:** strings usam aspas simples (`'texto'`); constantes de caractere usam aspas duplas e no máximo quatro caracteres (`"a"`, `"NEW"`).
- **Aritmética:** a multiplicação e a divisão do runtime são feitas em 16 bits, e não há precedência de operadores.
- **Sem entrada interativa nos exemplos:** os programas desta pasta não chamam `ReadStr`, para que a saída seja determinística; a leitura de console é citada apenas como recurso do runtime.
- **`INT` e `CHAR`:** não podem ser usados como tipo de variável escalar, apenas dentro de tipos compostos.
- **Execução:** os binários gerados são para AmigaOS e não foram executados nesta validação, que se limitou à compilação.

## Validação executada

Os 20 arquivos `.e` desta pasta foram compilados pelo `ecomp` (Amiga E v3.3a, em JavaScript) sem nenhum erro: 20 de 20 geraram executáveis AmigaOS válidos. Não houve execução dos binários, porque o ambiente de validação não dispõe de AmigaOS nem de emulador 68K funcional. Os comandos e os resultados estão no `RELATORIO.md`.

## Referências

- Página oficial de Amiga E, de Wouter van Oortmerssen: <https://strlen.com/amiga-e/>
- Distribuição Amiga E v3.3a no Aminet: <https://aminet.net/package/dev/e/amigae33a>
- *A Beginner's Guide to Amiga E*, de Chris Handley: <https://cshandley.co.uk/JasonHulance/beginner_toc.html>
- Manual do compilador Amiga E v3.3a: <https://cshandley.co.uk/amigae/>
- `ecomp`, compilador Amiga E em JavaScript: <https://github.com/gin0115/Amiga-E-Compiler-WebBased>
- Exemplo `bintree.e` da distribuição clássica: <https://amiga-e.com/docs/examples/yaec-examples-bintree-e.html>
