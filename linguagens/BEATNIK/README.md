# BEATNIK

**Ano de criação:** 2000 (o criador situa BEATNIK no inverno de 2000, dentro do período 2000–2001). [1] [2]

## O que é

BEATNIK é uma linguagem esotérica orientada a pilha. Cada palavra da fonte é pontuada pela tabela de Scrabble e a pontuação seleciona uma operação; a palavra seguinte também pode ser consumida como operando. Portanto, prosa, títulos e rótulos dentro de um `.btk` não são comentários: podem executar operações. Os arquivos desta pasta contêm somente tokens de código; as explicações e os enunciados estão neste README.

## Convenção usada nesta pasta

Para tornar os exemplos verificáveis por inspeção, esta pasta escolhe como alvo a interpretação literal do `beatnik.py` mantido por Cat’s Eye e a tabela inglesa de pontos exibida pelo criador. Isso é uma convenção explícita para estes exemplos, não uma afirmação de que exista uma semântica universal: a especificação original admite um erro intencional sem indicar sua localização, e Cat’s Eye alerta que exemplos originais podem não funcionar com sua interpretação. A tabela é inglesa; não se aplicam aqui pontuações de palavras portuguesas ou letras acentuadas. [1] [3] [4]

Os programas usam palavras ASCII separadas por espaços, pilha inicialmente vazia e valores pequenos, sem depender de overflow. Na notação dos resultados, a pilha é mostrada da base para o topo. Quando `CAT` (5) é executado, ele empilha a pontuação da palavra seguinte e a consome; essa palavra não executa seu próprio opcode. Por exemplo, `CAT CAGE` empilha 7, não soma.

| Pontos | Token usado | Operação documentada |
|---:|---|---|
| 5 | `CAT` | Empilha a pontuação da próxima palavra e pula essa palavra |
| 6 | `BAG` | Descarta o topo da pilha |
| 7 | `CAGE` | Soma os dois valores do topo |
| 8 | `HIM` | Lê um caractere e empilha seu valor |
| 9 | `OX` | Remove um valor e emite o caractere correspondente |
| 10 | `TAX` | Subtrai o topo do valor logo abaixo |
| 11 | `AXLE` | Troca os dois valores do topo |
| 12 | `JAM` | Duplica o topo |
| 13–16 | — | Saltos condicionais; não usados nos programas abaixo |
| 17 | `JOCK` | Encerra o programa |

As pontuações seguem a tabela inglesa da fonte. Além dos valores da tabela, os operandos usados abaixo pontuam `A` = 1, `JAW` = 13, `JIVE` = 14, `JIVES` = 15 e `JIVED` = 16. Por exemplo, `CAT` = 5, `AD` = 3, `TAX` = 10, `CAGE` = 7 e `JOCK` = 17. Quando aparecem após `CAT`, essas palavras são dados de pontuação, não instruções. A linguagem descrita tem pilha de valores de 0 a 255, entrada/saída de caracteres, saltos e soma/subtração; não define variáveis nomeadas, tipos, funções/subrotinas, exceções ou operações nativas de strings. [1] [3]

## Exemplos

Todos os arquivos `.btk` abaixo são código, não pseudocódigo nem comentários. Os efeitos descritos são rastreamentos estáticos segundo a convenção acima; não foram executados pelo interpretador oficial neste ambiente.

1. [`exemplo_1.btk`](exemplo_1.btk) — soma valores para formar 65 e emite `A`.
2. [`exemplo_2.btk`](exemplo_2.btk) — empilha 10 e encerra; estado final: `[10]`.
3. [`exemplo_3.btk`](exemplo_3.btk) — soma 5 + 3; estado final: `[8]`.
4. [`exemplo_4.btk`](exemplo_4.btk) — subtrai 6 de 10; estado final: `[4]`.
5. [`exemplo_5.btk`](exemplo_5.btk) — duplica 17 e descarta uma cópia; estado final: `[17]`.
6. [`exemplo_6.btk`](exemplo_6.btk) — troca 10 e 6; estado final da base ao topo: `[6, 10]`.
7. [`exemplo_7.btk`](exemplo_7.btk) — lê um caractere e deixa seu valor na pilha; requer uma entrada de um caractere.
8. [`exemplo_8.btk`](exemplo_8.btk) — ecoa um caractere de entrada e consome o valor emitido.
9. [`exemplo_9.btk`](exemplo_9.btk) — soma valores para formar 66 e emite `B`.
10. [`exemplo_10.btk`](exemplo_10.btk) — calcula 10 + 6 − 1; estado final: `[15]`.

## Exercícios de rastreamento

Cada `exercicio_*.btk` contém tokens que, segundo a convenção acima, servem como base para um rastreamento estático. Faça o rastreamento no papel; os objetivos estão aqui, não como texto embutido no código-fonte.

1. [`exercicio_1.btk`](exercicio_1.btk) — acompanhe a instrução 5 e o operando consumido; resultado esperado: pilha final `[10]`, sem caractere emitido.
2. [`exercicio_2.btk`](exercicio_2.btk) — rastreie uma soma a partir da pilha vazia; resultado esperado: pilha final `[8]`.
3. [`exercicio_3.btk`](exercicio_3.btk) — subtraia 6 do valor 10 que está abaixo; resultado esperado: pilha final `[4]`.
4. [`exercicio_4.btk`](exercicio_4.btk) — acompanhe a construção do valor ASCII 67; resultado esperado: emite `C` e termina com a pilha vazia.
5. [`exercicio_5.btk`](exercicio_5.btk) — explique o efeito líquido de duplicar 13 e descartar o topo; resultado esperado: pilha final `[13]`.
6. [`exercicio_6.btk`](exercicio_6.btk) — registre a ordem da pilha após trocar 5 e 3; resultado esperado, da base ao topo: `[3, 5]`.
7. [`exercicio_7.btk`](exercicio_7.btk) — com entrada `A`, determine o valor que permanece; resultado esperado: pilha final `[65]`, sem emissão de caractere.
8. [`exercicio_8.btk`](exercicio_8.btk) — com entrada `Z`, indique a saída e a pilha; resultado esperado: emite `Z` e termina com `[]`.
9. [`exercicio_9.btk`](exercicio_9.btk) — explique por que `CAGE` é consumido por `CAT`; resultado esperado: pilha final `[7]`, sem executar a soma.
10. [`exercicio_10.btk`](exercicio_10.btk) — some 17 e 13, depois subtraia 10; resultado esperado: pilha final `[20]`.

## Limites e validação

Os códigos 13–16 são descritos como saltos condicionais e saltos para trás podem construir ciclos, mas a auditoria fornecida não especifica com precisão o predicado, a codificação/destino do salto e a contagem de posições. Por isso, esta pasta não inventa exemplos de saltos ou ciclos. Também não apresenta subrotinas, tratamento de erros, tipos, variáveis nomeadas ou primitivas de strings; saída de texto é feita emitindo caracteres individualmente.

A auditoria não encontrou `beatnik`, `beatnik.py` nem pacote Python BEATNIK instalado. Assim, os programas foram revisados estaticamente contra a tabela de pontos e as operações descritas, mas não foram testados em runtime. A ressalva do erro intencional na especificação impede prometer execução portátil; consulte a implementação escolhida antes de usar estes exemplos com um interpretador. [3] [4]

## Fontes

[1] Cliff L. Biffle, [Beatnik](https://cliffle.com/esoterica/beatnik/).
[2] Cliff L. Biffle, [Esoteric Programming Languages](https://cliffle.com/esoterica/).
[3] Cat’s Eye Technologies, [Beatnik tools and interpreter](https://git.catseye.tc/Beatnik/).
[4] Cat’s Eye Technologies, [examples directory](https://git.catseye.tc/Beatnik/tree/master/eg).
