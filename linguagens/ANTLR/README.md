# ANTLR 4

**Linhagem:** ANTLR (ANother Tool for Language Recognition), criado por Terence Parr em 1989
**Linguagem desta pasta:** gramáticas ANTLR 4 na sintaxe de arquivo `.g4`, verificadas com a ferramenta 4.13.2

## Descrição

ANTLR é um gerador de analisadores sintáticos a partir de gramáticas. A partir da versão 4, a ferramenta adota reconhecimento descendente com adaptação preditiva (ALL(*)), o que dispensa a escrita de predicados sintáticos manuais: a gramática declara as regras e a ferramenta decide as alternativas em tempo de análise. A linguagem da pasta é a linguagem de gramáticas do ANTLR 4, não uma linguagem de programação de propósito geral: cada arquivo `.g4` descreve como reconhecer uma linguagem, e o ANTLR gera, a partir dele, um lexer e um parser em Java, Python, C++, Go, JavaScript, C# e outros alvos.

Uma gramática ANTLR 4 tem uma estrutura fixa. O arquivo começa por `grammar Nome;` (gramática combinada, com lexer e parser no mesmo arquivo) ou por `lexer grammar Nome;` / `parser grammar Nome;`. O nome declarado deve ser igual ao nome do arquivo, sem a extensão. Regras de parser são escritas em minúsculas, regras de lexer em maiúsculas, e as regras `fragment` não geram tokens: servem apenas para compor outras regras de lexer. Alternativas são separadas por `|`, os operadores `*`, `+` e `?` indicam repetição e opcionalidade, rótulos de elemento (`nome=REGRA`) e rótulos de alternativa (`# Nome`) dão nomes aos pedaços da árvore, e comandos de lexer como `-> skip`, `-> channel(HIDDEN)`, `-> pushMode(...)` e `-> more` alteram o destino dos tokens. Blocos `@header` e `@members` (ou `@parser::members`, `@lexer::members`) inserem código do alvo no arquivo gerado. A regra `WS : [ \t\r\n]+ -> skip ;` é a forma usual de descartar espaços em branco.

## Arquivos

São vinte gramáticas: dez exemplos e dez exercícios resolvidos. Cada arquivo tem nome igual ao `grammar` declarado e abre com um comentário que descreve o tópico e mostra uma entrada aceita.

### Exemplos

1. `exemplo_1.g4` — anatomia de uma gramática combinada: regra de parser, `EOF`, `IDENT`, comentário descartado e `WS`
2. `exemplo_2.g4` — expressões aritméticas com recursão à esquerda, precedência pela ordem das alternativas, `<assoc=right>` na potência e rótulos `#`
3. `exemplo_3.g4` — mini linguagem de comandos: declaração, atribuição, `se`/`senao`, `enquanto` e bloco entre chaves
4. `exemplo_4.g4` — arquivo CSV com `?`, `*`, `+`, campo vazio (alternativa vazia) e aspas duplicadas como escape
5. `exemplo_5.g4` — funções tipadas com parâmetros, regras `fragment` e comentários em `-> channel(HIDDEN)`
6. `exemplo_6.g4` — JSON conforme a RFC 8259, com recursão, fragmentos encadeados e escapes `\uXXXX`
7. `exemplo_7.g4` — tolerância a erros: `@header`, `@parser::members`, ação embutida e token coringa `DESCONHECIDO : . ;`
8. `exemplo_8.g4` — cadeias de caracteres com escapes, concatenação e funções de texto (`tamanho`, `maiusculo`)
9. `exemplo_9.g4` — expressões matemáticas com fatorial pós-fixo, potência associativa à direita, constantes e notação científica
10. `exemplo_10.g4` — algoritmo com vetor, laço `para ... de ... ate ... faca`, troca de posições e expressão indexada

### Exercícios

Cada exercício é uma gramática completa e distinta, resolvida, sobre o tópico indicado:

1. `exercicio_1.g4` — linha de comando com opções curtas, opções longas `--chave=valor` e argumentos
2. `exercicio_2.g4` — calculadora com variáveis, decimal e hexadecimal, potência e resto
3. `exercicio_3.g4` — condições booleanas com `!`, `&&`, `||` e comparações na precedência usual
4. `exercicio_4.g4` — data e hora no estilo ISO 8601, com fração de segundo e fuso
5. `exercicio_5.g4` — arquivo de configuração INI com seções, pares chave/valor e comentários
6. `exercicio_6.g4` — expressões com operadores bit a bit e literais hexadecimal, binário e octal
7. `exercicio_7.g4` — subconjunto de SQL de leitura: `SELECT`, `WHERE` com `AND`/`OR`/`NOT` e `ORDER BY`
8. `exercicio_8.g4` — expressões regulares: alternância, grupos, classes, âncoras e quantificadores
9. `exercicio_9.g4` — subconjunto de DOT (Graphviz): grafo direcionado, nós, arestas e atributos
10. `exercicio_10.g4` — MiniAlgol: programa nomeado, declarações, vetores, `:=`, laço, escrita e bloco `inicio ... fim`

## Como executar

A validação desta pasta usa o jar completo oficial, que inclui a ferramenta, o runtime Java e o `TestRig` (a "grun"):

```sh
curl -O https://www.antlr.org/download/antlr-4.13.2-complete.jar
java -jar antlr-4.13.2-complete.jar -o gerado exemplo_6.g4   # gera o lexer, o parser e os listeners
javac -cp antlr-4.13.2-complete.jar -d gerado/classes gerado/*.java
echo '{"a": [1, true]}' > entrada.json
java -cp antlr-4.13.2-complete.jar:gerado/classes \
     org.antlr.v4.gui.TestRig exemplo_6 json -tree entrada.json
```

O primeiro argumento do `TestRig` é o nome da gramática (igual ao nome do arquivo) e o segundo é a regra inicial; `-tokens` mostra a lista de tokens, `-tree` imprime a árvore sintática e `-gui` abre a visualização gráfica. Para gerar código em outra linguagem, acrescente `-Dlanguage=Python3` (ou `Cpp`, `Go`, `JavaScript`, `CSharp`) e use o runtime correspondente.

## Escopo e limitações documentadas

- **Gramáticas combinadas:** os vinte arquivos são gramáticas combinadas (`grammar Nome;`), com lexer e parser no mesmo arquivo. Modos de lexer (`mode`, `pushMode`) existem no ANTLR 4, mas a ferramenta os recusa em gramática combinada; o erro real é `error(120): lexical modes are only allowed in lexer grammars`. Demonstrar modos exigiria um arquivo `lexer grammar`, que não teria regras de parser, por isso nenhum exemplo desta pasta usa modos.
- **Verificação sintática, não semântica:** as gramáticas reconhecem a forma das entradas. Regras de negócio como "mês entre 1 e 12", "tag de fechamento igual à de abertura" ou "variável declarada antes do uso" precisam de um listener ou visitor, e isso está anotado nos arquivos correspondentes (`exercicio_4`, `exercicio_9`, `exercicio_10`).
- **Palavras-chave em maiúsculas:** em `exercicio_7` e `exercicio_9`, as palavras-chave são reconhecidas em maiúsculas. Tokens literais são definidos antes das regras de lexer, então um identificador escrito exatamente como uma palavra-chave vira a palavra-chave.
- **Espaços em branco:** em `exercicio_8` os espaços são ignorados (modo estendido, como em `x` de PCRE); um espaço literal deve ser escrito como `\ `.
- **Ações embutidas:** `exemplo_7` contém ações em Java (`@parser::members`, `{ registrar(...) }`). Elas são específicas do alvo Java e não fazem parte da linguagem de gramáticas em si.
- **Rótulos de alternativa:** quando uma regra usa `# Rótulo`, cada alternativa precisa do seu próprio rótulo, e o nome da regra não pode ser reutilizado como rótulo de elemento — foi exatamente o erro `label hora conflicts with rule with same name` encontrado durante a validação.

## Validação executada

As vinte gramáticas foram processadas pela ferramenta 4.13.2 (jar completo), o código Java gerado foi compilado com `javac` e vinte e duas entradas de exemplo foram analisadas com o `TestRig`. Resultado: 20 de 20 gramáticas geradas sem erro e sem aviso, 297 classes compiladas sem erro e 22 de 22 análises concluídas sem mensagem de erro. Os comandos e as correções aplicadas estão em `RELATORIO.md`.

## Referências

- Repositório oficial do ANTLR 4: <https://github.com/antlr/antlr4>
- Documentação da linguagem de gramáticas (metagramática): <https://github.com/antlr/antlr4/blob/master/doc/grammars.md>
- Página oficial de downloads: <https://www.antlr.org/download.html>
- Livro de referência: Terence Parr, *The Definitive ANTLR 4 Reference*, 2. ed., Pragmatic Bookshelf, 2013
- Especificação do JSON (RFC 8259): <https://www.rfc-editor.org/rfc/rfc8259>
- Linguagem DOT (Graphviz): <https://graphviz.org/doc/info/lang.html>
