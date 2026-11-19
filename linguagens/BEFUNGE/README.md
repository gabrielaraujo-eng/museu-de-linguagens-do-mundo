# Befunge-93

**Criação:** 1993, por Chris Pressey. Esta pasta documenta especificamente **Befunge-93**, não Funge-98.

Befunge-93 é uma linguagem esotérica imperativa, baseada em pilha e executada num playfield bidimensional toroidal de 80×25 células. O contador de instruções move-se nas direções cardeais; a grade pode ser alterada durante a execução. A especificação usa texto-fonte ASCII imprimível. [1][2]

## Convenção dos arquivos

Use a extensão **`.bf`** para novos fontes. Os arquivos `.bef` preexistentes foram mantidos como espelhos de compatibilidade: cada um corresponde ao arquivo `.bf` com o mesmo nome e contém o mesmo programa. A extensão não seleciona uma variante; ambos os conjuntos aqui são Befunge-93. Não há comentários `//` ou `/* ... */` em Befunge-93: esses caracteres são instruções, não delimitadores de comentário. As explicações ficam neste README. [1][3]

## Comandos usados

`>` `<` `^` `v` mudam a direção do contador; `_` escolhe esquerda/direita e `|` escolhe cima/baixo conforme o valor retirado da pilha (zero segue para a direita/baixo); `#` salta a próxima célula; `"` alterna o modo de string; `.` imprime um inteiro e `,` imprime um caractere; `&` lê um inteiro e `~` lê um caractere; `p` escreve no playfield e `g` lê uma célula; `@` encerra o programa. Consulte a especificação para a semântica completa. [1]

A pilha e o playfield são recursos da linguagem, não variáveis nomeadas ou listas nativas. Befunge-93 não define funções tradicionais nem comandos de exceção/`try-catch`. Padrões que simulem outras abstrações precisam ser demonstrados como código, não apresentados como comandos próprios da linguagem. Funge-98 é outra variante; sua sintaxe não é presumida nestes arquivos. [1][3]

## Exemplos

Os arquivos `.bf` abaixo são as versões de referência; cada `.bef` homônimo é um espelho idêntico.

1. [`exemplo_1.bf`](exemplo_1.bf) — imprime `Ola Mundo` usando uma string ASCII e termina.
2. [`exemplo_2.bf`](exemplo_2.bf) — soma 8 + 8 e imprime `16`.
3. [`exemplo_3.bf`](exemplo_3.bf) — inicializa a condição com zero; `_` escolhe o caminho à direita e o programa imprime `0`.
4. [`exemplo_4.bf`](exemplo_4.bf) — loop de contagem regressiva; imprime `3210` e termina. O contador é preservado na pilha enquanto `|` testa uma cópia.
5. [`exemplo_5.bf`](exemplo_5.bf) — duplica 5 com `:` e imprime uma cópia.
6. [`exemplo_6.bf`](exemplo_6.bf) — grava `A` na célula `(20,0)`, lê-a com `g` e imprime `A`.
7. [`exemplo_7.bf`](exemplo_7.bf) — lê um inteiro da entrada padrão, imprime-o e termina; requer entrada numérica.
8. [`exemplo_8.bf`](exemplo_8.bf) — imprime `Ola` em modo de string ASCII.
9. [`exemplo_9.bf`](exemplo_9.bf) — multiplica 2 × 3 e imprime `6`.
10. [`exemplo_10.bf`](exemplo_10.bf) — empilha os dígitos de 0 a 9 e imprime somente o topo, `9`; não é um algoritmo de ordenação.

## Exercícios com soluções de referência

Cada arquivo é uma solução completa do objetivo indicado; os `.bef` homônimos são espelhos idênticos. A entrada necessária está indicada onde aplicável.

1. [`exercicio_1.bf`](exercicio_1.bf) — imprimir `Hello` usando modo de string e saída de caracteres.
2. [`exercicio_2.bf`](exercicio_2.bf) — somar 5 + 5 e imprimir `10`.
3. [`exercicio_3.bf`](exercicio_3.bf) — inicializar uma condição zero, seguir o ramo à direita com `_`, imprimir `0` e terminar.
4. [`exercicio_4.bf`](exercicio_4.bf) — contar de 3 até 0 em um loop e imprimir `3210`.
5. [`exercicio_5.bf`](exercicio_5.bf) — gravar o caractere `A` na célula `(20,0)` com `p` e terminar.
6. [`exercicio_6.bf`](exercicio_6.bf) — ler com `g` o caractere da célula inicial `(0,0)`, cujo conteúdo é `0`, imprimi-lo e terminar.
7. [`exercicio_7.bf`](exercicio_7.bf) — ler um inteiro da entrada padrão e ecoá-lo; requer entrada numérica.
8. [`exercicio_8.bf`](exercicio_8.bf) — ler um caractere da entrada padrão e ecoá-lo.
9. [`exercicio_9.bf`](exercicio_9.bf) — multiplicar 2 × 3 e imprimir `6`.
10. [`exercicio_10.bf`](exercicio_10.bf) — imprimir `OK` em modo de string e terminar.

## Validação e limites

Os arquivos-fonte foram revisados estaticamente para caracteres ASCII imprimíveis, dimensões compatíveis com o playfield Befunge-93, instruções de saída/terminação e correspondência entre os espelhos `.bf`/`.bef`. Não foi encontrado um runtime/validador Befunge instalado no ambiente de trabalho, portanto as saídas e o fluxo não foram confirmados por execução; as descrições são baseadas em inspeção estática da semântica da especificação. Os exemplos 7 e os exercícios 7–8 precisam da entrada indicada.

## Referências

[1] [Befunge-93 Documentation — especificação de Chris Pressey](https://catseye.tc/view/Befunge-93/doc/Befunge-93.markdown).
[2] [Befunge-93 Reference Distribution — Cat's Eye Technologies](https://git.catseye.tc/Befunge-93/).
[3] [Funge-98 Final Specification](https://catseye.tc/view/Funge-98/doc/funge98.markdown), citada apenas para distinguir a variante posterior.
