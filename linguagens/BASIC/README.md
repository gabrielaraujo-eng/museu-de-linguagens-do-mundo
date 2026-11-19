# BASIC

**Criação:** a primeira execução bem-sucedida do BASIC ocorreu em 1º de maio de 1964, em Dartmouth.

## Sobre esta pasta

BASIC é uma família de linguagens de programação criada para ensinar programação e também atender aplicações variadas. Como há vários dialetos, esta pasta adota **GW-BASIC 3.22** como variante de referência: os programas numerados e as construções sintáticas aqui usadas seguem as formas documentadas no *GW-BASIC User's Guide and User's Reference*. Isso não significa que a sintaxe seja igual em todas as implementações de BASIC.

Os arquivos `.bas` são listagens de programas BASIC com números de linha. Abra-os em um interpretador compatível com GW-BASIC 3.22. A extensão `.bas` é uma convenção de arquivo, não uma regra da linguagem. Os exemplos são explicados nesta página; nem todos têm comentários dentro do código.

## Exemplos

1. [`exemplo_1.bas`](exemplo_1.bas) — imprime “Olá, Mundo!”.
2. [`exemplo_2.bas`](exemplo_2.bas) — atribui um valor numérico a `X` e um texto a `S$`; o sufixo `$` identifica a variável de string neste dialeto. `LET` atribui valores, não declara tipos.
3. [`exemplo_3.bas`](exemplo_3.bas) — lê `X` com `INPUT` e escolhe uma saída com `IF ... THEN ... ELSE`.
4. [`exemplo_4.bas`](exemplo_4.bas) — percorre e imprime os números de 1 a 5 com `FOR` / `NEXT`.
5. [`exemplo_5.bas`](exemplo_5.bas) — define `FNADD` com `DEF FN` e chama a função para mostrar a soma.
6. [`exemplo_6.bas`](exemplo_6.bas) — reserva um array com `DIM`, armazena um valor e o imprime.
7. [`exemplo_7.bas`](exemplo_7.bas) — provoca um erro definido pelo usuário e o intercepta com `ON ERROR GOTO`, consultando `ERR` e `ERL` antes de `RESUME NEXT`.
8. [`exemplo_8.bas`](exemplo_8.bas) — obtém os três primeiros caracteres de uma string com `LEFT$`.
9. [`exemplo_9.bas`](exemplo_9.bas) — calcula a raiz quadrada de 25 com `SQR`.
10. [`exemplo_10.bas`](exemplo_10.bas) — ordena três valores em um array por bubble sort usando laços, comparação e `SWAP`; não presume uma instrução nativa `SORT`.

## Exercícios

Cada arquivo contém uma solução executável para o objetivo indicado. Os objetivos foram definidos para substituir dez cópias do mesmo “Olá, Mundo!”; usam construções compatíveis com o baseline GW-BASIC 3.22 documentado acima.

1. [`exercicio_1.bas`](exercicio_1.bas) — exibir uma saudação personalizada em duas linhas.
2. [`exercicio_2.bas`](exercicio_2.bas) — guardar dois números em variáveis e imprimir a soma.
3. [`exercicio_3.bas`](exercicio_3.bas) — pedir um número e informar se é maior que 10.
4. [`exercicio_4.bas`](exercicio_4.bas) — imprimir os números de 1 a 5 com um laço.
5. [`exercicio_5.bas`](exercicio_5.bas) — definir uma função para calcular a área de um círculo de raio 2 e exibir o resultado aproximado.
6. [`exercicio_6.bas`](exercicio_6.bas) — guardar três valores em um array e imprimir o segundo.
7. [`exercicio_7.bas`](exercicio_7.bas) — gerar o erro definido 210, capturá-lo e exibir o código e a linha que o gerou.
8. [`exercicio_8.bas`](exercicio_8.bas) — extrair e imprimir os três primeiros caracteres de `LINGUAGEM`.
9. [`exercicio_9.bas`](exercicio_9.bas) — calcular e imprimir a raiz quadrada de 81.
10. [`exercicio_10.bas`](exercicio_10.bas) — somar os três valores armazenados em um array usando um laço.

## Compatibilidade e validação

As referências de sintaxe são específicas ao manual GW-BASIC citado abaixo, não uma garantia de compatibilidade com qualquer dialeto BASIC. Não foi encontrado interpretador BASIC instalado para executar os arquivos nesta revisão; o conteúdo foi revisado estaticamente contra as construções citadas. A exibição de caracteres acentuados também pode depender da codificação do interpretador e do terminal.

## Referências

- [BASIC Begins at Dartmouth](https://www.dartmouth.edu/basicfifty/basic.html) e [Dartmouth BASIC 50](https://www.dartmouth.edu/basicfifty/) — contexto histórico e data da primeira execução.
- [Microsoft GW-BASIC](https://github.com/microsoft/GW-BASIC) — repositório oficial e proveniência do interpretador.
- [GW-BASIC 3.22 User's Guide and User's Reference](https://manuals.sterremuur.nl/GWBASIC/index2.html) — baseline de sintaxe; consulte também as referências do manual para [`DEF FN`](http://www.antonis.de/qbebooks/gwbasman/def_fn.html), [`IF THEN ELSE`](http://www.antonis.de/qbebooks/gwbasman/if.html), [`DIM`](http://www.antonis.de/qbebooks/gwbasman/dim.html), [`ON ERROR GOTO`](http://www.antonis.de/qbebooks/gwbasman/onerror.html), [`ERROR`](http://www.antonis.de/qbebooks/gwbasman/error.html), [`RESUME`](http://www.antonis.de/qbebooks/gwbasman/resume.html), [`LEFT$`](http://www.antonis.de/qbebooks/gwbasman/left.html), [`SQR`](http://www.antonis.de/qbebooks/gwbasman/sqr.html) e [`SWAP`](http://www.antonis.de/qbebooks/gwbasman/swap.html).
