# Aheui (아희)

Aheui é uma linguagem esotérica criada para refletir a estrutura visual do Hangul. As sílabas coreanas do código são instruções, não texto natural.

## Como o programa funciona

Um programa Aheui é uma grade bidimensional codificada em UTF-8. Em cada sílaba completa, a consoante inicial escolhe a instrução, a vogal altera a direção ou o movimento do cursor e a consoante final, quando presente, fornece um parâmetro. A grade pode ser percorrida em mais de uma direção e o cursor dá a volta pelas bordas. Caracteres não Hangul e espaços são ignorados como instruções, mas ainda ocupam células; por isso, texto acrescentado a um arquivo de código pode mudar a geometria do programa.

O armazenamento inicial é uma pilha. A linguagem também define outras pilhas, uma fila e um canal de extensão cujo comportamento pode depender da implementação. As instruções incluem empilhar e remover valores, entrada e saída de inteiros ou caracteres, operações aritméticas, comparação, seleção/transferência de armazenamento, desvio e término. Aheui não usa declarações textuais convencionais de variáveis, funções, tipos ou literais de strings; um algoritmo precisa ser construído com instruções da grade.

A extensão `.aheui` é uma convenção de arquivo usada por implementações, não uma regra normativa da especificação. Os programas deste diretório contêm somente código Aheui em UTF-8.

## Execução

Com a implementação Go do projeto instalada e disponível no `PATH`, execute um arquivo com `aheui linguagens/AHEUI/exemplo_1.aheui`. A implementação e suas instruções de instalação estão em [aheui/goaheui](https://github.com/aheui/goaheui). A especificação publicada se declara incompleta e sujeita a mudanças; os resultados devem ser conferidos na implementação escolhida.

## Exemplos

1. `exemplo_1.aheui` — Hello World publicado na especificação.
2. `exemplo_2.aheui` — empilha o inteiro 2 e o imprime.
3. `exemplo_3.aheui` — soma 2 e 3 e imprime 5.
4. `exemplo_4.aheui` — multiplica 2 por 3 e imprime 6.
5. `exemplo_5.aheui` — calcula 5 − 2 e imprime 3.
6. `exemplo_6.aheui` — calcula a divisão inteira 5 // 2 e imprime 2.
7. `exemplo_7.aheui` — calcula o resto de 5 por 2 e imprime 1.
8. `exemplo_8.aheui` — compara 3 com 2 e imprime o resultado booleano como 1.
9. `exemplo_9.aheui` — transfere o inteiro 2 da pilha para a fila, seleciona a fila e imprime o valor.
10. `exemplo_10.aheui` — lê um inteiro da entrada padrão e o ecoa.

## Exercícios

Cada arquivo contém uma solução Aheui; os enunciados são: (1) imprimir o inteiro 4; (2) somar 2 e 4; (3) somar 3 e 5; (4) multiplicar 3 por 5; (5) subtrair 3 de 5; (6) calcular 7 // 2 formando 7 a partir de 5 + 2; (7) calcular 8 % 3 formando 8 a partir de 5 + 3; (8) comparar 2 >= 3; (9) transferir o inteiro 4 para a fila e imprimi-lo; (10) ler e devolver um caractere Unicode. Os exercícios 1–9 imprimem, respectivamente, 4, 6, 8, 15, 2, 3, 2, 0 e 4.

## Referências

- [Especificação de Aheui](https://aheui.readthedocs.io/ko/latest/specs.en.html)
- [Introdução oficial](https://aheui.readthedocs.io/ko/latest/introduction.html)
- [Intérpretes mantidos pelo projeto](https://github.com/aheui/)
