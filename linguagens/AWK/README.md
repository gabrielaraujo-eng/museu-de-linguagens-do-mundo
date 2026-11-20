# AWK

**Linhagem:** AWK, criada em 1977 por Alfred Aho, Peter Weinberger e Brian Kernighan nos Bell Labs
**Linguagem desta pasta:** AWK conforme a especificação POSIX (`awk` da IEEE Std 1003.1), executável por `gawk`, `mawk` e `bwk awk`

## Descrição

AWK é uma linguagem de propósito específico para processamento de texto organizado em registros e campos: um programa é uma sequência de pares `padrão { ação }`, avaliados para cada registro da entrada, mais os blocos especiais `BEGIN` (antes da leitura) e `END` (depois do último registro). O modelo de dados tem apenas três tipos — string, número (sempre em ponto flutuante) e array associativo —, e a conversão entre string e número é automática. O nome vem das iniciais dos três autores; a linguagem foi descrita em "AWK — a pattern scanning and processing language" (1979) e normalizada pelo POSIX, que é a referência usada nesta pasta.

## Arquivos

Os programas são autocontidos: cada um traz os próprios dados de exemplo (em uma string desmembrada com `split`, em arrays preenchidos no `BEGIN` ou em um fluxo lido com `getline`) e encerra com `exit` dentro do `BEGIN`. Assim, `awk -f arquivo.awk` produz saída sem precisar de arquivo de entrada e sem ficar esperando pela entrada padrão. O uso real, com dados externos, é o mesmo programa sem o `exit`: `awk -f programa.awk dados.txt`.

### Exemplos

1. `exemplo_1.awk` — estrutura do programa: `BEGIN`, `END`, `print`, `printf` e `exit`
2. `exemplo_2.awk` — registros e campos: `$0`, `$1`, `$NF`, `NF`, `NR`, `OFS` e `split`
3. `exemplo_3.awk` — padrões: `/regex/`, `~`, `!~`, comparações, `match` com `RSTART`/`RLENGTH`
4. `exemplo_4.awk` — laços `for`, `while`, `do-while`, `break`, `continue` e `for (k in array)`
5. `exemplo_5.awk` — funções com `function nome(a, b)`, recursão e parâmetros locais
6. `exemplo_6.awk` — arrays associativos: contagem, `in` e `delete`
7. `exemplo_7.awk` — validação de dados, mensagens em `/dev/stderr`, `getline` e código de saída
8. `exemplo_8.awk` — strings: `length`, `substr`, `index`, `sub`, `gsub`, `split`, `sprintf`
9. `exemplo_9.awk` — matemática: `int`, `sqrt`, `exp`, `log`, `sin`, `cos`, `atan2`, `rand`/`srand`
10. `exemplo_10.awk` — algoritmos: ordenação por inserção e busca binária sobre array

### Exercícios

Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1.awk` — quantidade, soma, média e contagem acima da média de uma lista de notas
2. `exercicio_2.awk` — vogais e consoantes por palavra de uma frase, com totais
3. `exercicio_3.awk` — tabuada 5x5 alinhada com `printf`, soma da tabela e diagonal
4. `exercicio_4.awk` — inversão de string e teste de palíndromo com `substr`
5. `exercicio_5.awk` — fatorial recursivo de 0 a 10 e Fibonacci iterativo
6. `exercicio_6.awk` — frequência de palavras ordenada por contagem decrescente
7. `exercicio_7.awk` — validação de cadastros com motivos de recusa e código de saída opcional
8. `exercicio_8.awk` — relatório de vendas por categoria com total e percentuais
9. `exercicio_9.awk` — estatística descritiva: mínimo, máximo, média, variância e desvio padrão
10. `exercicio_10.awk` — extração e contagem de domínios de e-mail, em ordem alfabética

## Como executar

Qualquer implementação POSIX serve. A validação desta pasta foi feita com `gawk` 5.2.1 e `mawk` 1.3.4:

```sh
sudo apt-get install gawk mawk     # Debian/Ubuntu

gawk -f exemplo_1.awk </dev/null
mawk -f exercicio_10.awk </dev/null
```

O redirecionamento `</dev/null` não é obrigatório: como cada programa encerra com `exit` no `BEGIN`, nenhum deles lê a entrada padrão. Para usar os programas com dados reais, basta remover o `exit` final e passar o arquivo:

```sh
awk -f exemplo_2.awk dados.txt
printf 'Ana 31 analista\n' | awk '{ print NF, $1 }'
```

Dois programas aceitam a variável `estrito` com `-v`, que faz o código de saída refletir dados inválidos (útil em scripts):

```sh
gawk -v estrito=1 -f exemplo_7.awk </dev/null; echo $?      # 1: há registro inválido
gawk -f exemplo_7.awk </dev/null; echo $?                   # 0: apenas relata
```

## Escopo e limitações documentadas

- **POSIX versus extensões:** os arquivos usam somente o que a especificação POSIX garante. Ficaram de fora extensões do `gawk` como `gensub`, `asort`, `length(array)`, `delete array`, `nextfile`, `ENVIRON` estendido e as funções de bit. Onde a extensão era tentadora (contar chaves de um array), o programa usa um contador explícito.
- **Arrays associativos não têm ordem:** `for (chave in array)` percorre as chaves em ordem não especificada e diferente entre implementações — `gawk` e `mawk` imprimem `exemplo_4`, `exemplo_6` e `exercicio_8` em ordens distintas. Onde a ordem faz parte do resultado (`exercicio_6`, `exercicio_8`, `exercicio_10`), as chaves são copiadas para um array indexado e ordenadas com um algoritmo explícito.
- **`rand()` não é portátil:** `srand(1)` fixa a semente, mas a sequência gerada difere entre `gawk`, `mawk` e `busybox awk`. Por isso `exemplo_9` mostra os valores apenas como ilustração; os demais resultados do arquivo são determinísticos.
- **Números são ponto flutuante:** não há inteiros. `%d` trunca em direção a zero, e não existe arredondamento pronto — usa-se `int(x + 0.5)`, como em `exemplo_9`. Inteiros acima de 2^53 perdem precisão.
- **Sem exceções:** erros são tratados com valor sentinela de retorno, mensagem em `/dev/stderr` e `exit N` (`exemplo_7`, `exercicio_7`).
- **`getline`:** as três formas usadas (`cmd | getline var`, `getline var < arquivo`, `getline`) devolvem 1 com registro, 0 no fim e -1 em erro. Em `exemplo_7` o fluxo vem de um comando `printf` interno, para o programa não depender de arquivo externo.
- **Expressões regulares:** são ERE, não PCRE. Não há `\d`, `\b` nem lookaround; `\` em string literal precisa ser escrito `\\`.

## Validação executada

Os 20 programas foram executados com `gawk` 5.2.1 e com `mawk` 1.3.4, sempre com `</dev/null`: 40 execuções, 40 com código de saída 0 e saída correspondente ao tópico. O comando usado foi:

```sh
for f in exemplo_*.awk exercicio_*.awk; do
  for impl in gawk mawk; do
    $impl -f "$f" </dev/null >/dev/null 2>&1; echo "$impl $f rc=$?"
  done
done
```

O detalhamento, com trechos de saída e as diferenças observadas entre as duas implementações, está em `RELATORIO.md`.

## Referências

- POSIX `awk`, IEEE Std 1003.1-2017 (Utility `awk`): <https://pubs.opengroup.org/onlinepubs/9699919799/utilities/awk.html>
- GNU Awk User's Guide: <https://www.gnu.org/software/gawk/manual/>
- *The AWK Programming Language*, Aho, Weinberger e Kernighan (1988): <https://awk.dev/awk.pdf>
- One True Awk (bwk awk), implementação histórica: <https://github.com/onetrueawk/awk>
- mawk, implementação leve usada na validação: <https://invisible-island.net/mawk/>
