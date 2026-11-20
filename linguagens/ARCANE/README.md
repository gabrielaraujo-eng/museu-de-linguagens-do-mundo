# Arcane

**Linhagem:** linguagem de brinquedo derivada de Monkey (livro *Writing an Interpreter in Go*, Thorsten Ball, 2016)
**Linguagem desta pasta:** Arcane, a implementação de Ionuț Iordache (repositório `IORDACHE00/ARCANE`, 2023)

## Identidade da linguagem: qual "Arcane" é esta

O nome "Arcane" é ambíguo. A pesquisa feita para esta pasta encontrou três candidatos e apenas um deles tem documentação e implementação verificáveis:

1. **Arcane como esolang:** não existe. A busca na wiki Esolang (`esolangs.org`) pelo termo retorna zero páginas: a consulta à API do site (`action=query&list=search&srsearch=Arcane`) devolve `totalhits: 0`, e a página direta `esolangs.org/wiki/Arcane` não existe. Não há, portanto, "linguagem esotérica Arcane" documentada nessa fonte.
2. **Arcane da organização `arcane-lang` (arcane-lang.org):** a página se apresenta como "a programming language for the modern spellcaster", mas declara explicitamente "Work in progress", o instalador está marcado como "Coming soon" e a organização no GitHub não publica nenhum repositório. Não há código, especificação nem exemplos executáveis; o único trecho publicado (`import "console"; fn main() { console.writeln("Hello, spellcaster."); }`) não pode ser verificado.
3. **Arcane de `IORDACHE00/ARCANE`:** repositório público, licença MIT, escrito em Go, com lexer, parser, AST, avaliador e REPL completos, além de README com exemplos de funções, arrays, objetos, closures e funções embutidas. É uma implementação da linguagem **Monkey**, do livro *Writing an Interpreter in Go*: a sintaxe, os tipos e o conjunto de funções embutidas são os do livro, com pequenas alterações de nomes e de organização de pacotes.

**Decisão:** esta pasta documenta a terceira opção, por ser a única com código-fonte e comportamento verificáveis. A linguagem é tratada como "Arcane, a implementação de Monkey em Go", e não como uma linguagem original. A extensão `.arcane` não é prescrita pelo projeto: o repositório não define extensão de arquivo, porque só oferece um REPL; `.arcane` é convenção deste museu.

## Descrição

Arcane é uma linguagem interpretada, dinâmica e de tipagem forte em tempo de execução, com sete palavras reservadas: `fn`, `let`, `true`, `false`, `if`, `else`, `return`. Os valores são inteiros de 64 bits, strings, booleanos, arrays, hashes (objetos), funções e `null`. Não há ponto flutuante, não há laços (`for`, `while`), não há classes, não há exceções capturáveis e **não há sintaxe de comentário**: o lexer reconhece apenas os operadores `= + - ! * / < > == != , ; : ( ) { } [ ]` e trata qualquer outro caractere fora de string como token `ILLEGAL`.

A ausência de laços empurra toda repetição para recursão, e a ausência de comentários significa que estes arquivos `.arcane` são somente código: a explicação de cada tópico está neste README, não dentro dos programas. Essa é uma limitação da linguagem, não uma omissão da pasta.

Funções embutidas disponíveis: `len` (tamanho de string em bytes ou de array), `log` (imprime um valor por argumento, com quebra de linha, e devolve `null`), `first`, `last`, `rest` e `push` (as três últimas exigem array; `push` devolve um array novo, sem mutar o original).

## Arquivos

### Exemplos

1. `exemplo_1` — saída com `log` e concatenação de strings
2. `exemplo_2` — `let`, inteiros, booleanos, precedência e divisão inteira truncada
3. `exemplo_3` — `if`/`else` como expressão e como comando, incluindo a veracidade de `0`
4. `exemplo_4` — funções `fn`, `return`, funções de ordem superior e composição
5. `exemplo_5` — recursão com fatorial e Fibonacci
6. `exemplo_6` — arrays, indexação, `len`, `first`, `last`, `rest`, `push` imutável e índice fora dos limites
7. `exemplo_7` — hashes, acesso por chave, hash aninhado e chave ausente
8. `exemplo_8` — closures e currying
9. `exemplo_9` — strings: concatenação, repetição recursiva e `len` contando bytes
10. `exemplo_10` — algoritmos sobre arrays: soma, máximo, mapeamento e filtro recursivos

### Exercícios

Cada exercício é um programa completo, resolvido e distinto do exemplo correspondente:

1. `exercicio_1` — duas linhas de saída montadas por concatenação
2. `exercicio_2` — conversão de Celsius para Fahrenheit com inteiros
3. `exercicio_3` — classificação de um inteiro em positivo, negativo ou zero
4. `exercicio_4` — soma dos pares de 1 a 20 por recursão
5. `exercicio_5` — potência inteira recursiva
6. `exercicio_6` — inversão de um array com `push`
7. `exercicio_7` — busca linear que devolve índice ou `-1`
8. `exercicio_8` — total de um estoque guardado em hash
9. `exercicio_9` — MDC de Euclides e MMC derivado
10. `exercicio_10` — soma, média inteira, maior e menor de seis notas

## Como executar

O repositório oficial só oferece o REPL, que lê **uma linha por vez** e a avalia isoladamente. Linhas simples funcionam (`let a = 3; a * 2` imprime `6`), mas uma definição de função que ocupe mais de uma linha deixa o REPL em estado inconsistente: a linha seguinte derruba o processo com `panic: runtime error: invalid memory address or nil pointer dereference` (código de saída 2). Por isso `go run main.go` não executa os arquivos desta pasta. Para rodar arquivos, é preciso um programa que aplique os pacotes oficiais `lexer`, `parser`, `evaluator` e `object` ao conteúdo inteiro do arquivo. Foi exatamente isso que a validação desta pasta fez:

```sh
# 1. REPL oficial (uma linha por vez)
cd ARCANE-source && go run main.go

# 2. runner de arquivo: cmd/run/main.go usa lexer, parser e evaluator oficiais
go build -o arcane-run ./cmd/run
./arcane-run exemplo_1.arcane
```

O núcleo do runner está em `RELATORIO.md`, seção 5. Ele não altera nenhum pacote da linguagem: apenas lê o arquivo, chama `parser.ParseProgram` e `evaluator.Eval`, e devolve código de saída 1 em erro de sintaxe ou de execução.

## Escopo e limitações documentadas

- **Comentários:** não existem. O `README.md` oficial mostra `# Outputs: 15` ao lado de exemplos, mas `#` não é tratado pelo lexer; o caractere gera token `ILLEGAL` e o parser acusa erro. Os comentários do README oficial são anotações de documentação, não sintaxe. Por isso nenhum arquivo desta pasta tem comentários.
- **Comparação de strings:** só `+` (concatenação) é aceito entre strings. `"a" == "a"` produz o erro `unknown operator: STRING == STRING`; não há como comparar strings diretamente.
- **Operadores:** não há `%`, `<=`, `>=`, `&&`, `||`. Resto se calcula com `a - a / b * b` e conjunção com `if` aninhado.
- **Divisão:** inteira, truncada em direção a zero (`7 / 2` é `3`, `-7 / 2` é `-3`). Divisão por zero não é erro tratável: provoca pânico do Go e derruba o processo.
- **Laços:** inexistentes. Toda repetição é recursão; o avaliador não otimiza chamadas de cauda, então recursões profundas esgotam a pilha.
- **`len` de string:** conta **bytes**, não caracteres. `len("acao")` é `4` e `len("ação")` é `6`.
- **Índice e chave ausentes:** devolvem `null` em vez de erro (`xs[9]` fora de um array de 5 elementos imprime `null`).
- **`push`:** não muta o array recebido; devolve uma cópia com o elemento no fim.
- **Estado entre chamadas:** cada chamada de função cria um ambiente novo, então closures capturam variáveis, mas não acumulam estado mutável entre chamadas; um contador com `let n = n + passo` não funciona como em Scheme.
- **Hash como chave:** chaves válidas são inteiros, strings e booleanos; arrays e funções não podem ser chave.

## Validação executada

Os 20 programas foram executados com o interpretador oficial compilado a partir do código do repositório (Go 1.22.5 para linux/arm64), por meio de um runner que apenas encadeia `lexer` → `parser` → `evaluator`, sem alterar nenhum pacote da linguagem. Todos terminaram com código de saída 0 e produziram a saída esperada para o tópico. Duas afirmações negativas foram testadas: comentário com `#` falha no parser, e `"a" == "a"` falha no avaliador com `unknown operator: STRING == STRING`. O comando, as saídas e as ressalvas estão em `RELATORIO.md`.

## Referências

- Repositório oficial: <https://github.com/IORDACHE00/ARCANE>
- README do projeto (funções, arrays, objetos, closures, embutidas): <https://github.com/IORDACHE00/ARCANE/blob/source/README.md>
- Código do lexer e da tabela de tokens: <https://github.com/IORDACHE00/ARCANE/blob/source/lexer/lexer.go>, <https://github.com/IORDACHE00/ARCANE/blob/source/token/token.go>
- Funções embutidas: <https://github.com/IORDACHE00/ARCANE/blob/source/evaluator/builtins.go>
- Livro que define a linguagem base (Monkey): Thorsten Ball, *Writing an Interpreter in Go*, <https://interpreterbook.com/>
- Wiki Esolang, consulta sem resultados para "Arcane": <https://esolangs.org/w/api.php?action=query&list=search&srsearch=Arcane&format=json>
- Candidato descartado, sem código publicado: <https://arcane-lang.org>, <https://github.com/arcane-lang>
- **Comentários:** não existem. O `README.md` oficial mostra `# Outputs: 15` ao lado de exemplos, mas `#` não é tratado pelo lexer; o caractere gera token `ILLEGAL` e o parser responde `no prefix parse function for ILLEGAL found`. Os comentários do README oficial são anotações de documentação, não sintaxe. Por isso nenhum arquivo desta pasta tem comentários.
