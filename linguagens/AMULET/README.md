# Amulet

**Linhagem:** ML (funcional, tipagem estrita com inferência)
**Implementação de referência:** `amc`, compilador oficial do projeto Amulet, que gera código Lua
**Origem:** projeto Amulet, associado à Universidade de Birmingham

## Descrição

Amulet é uma linguagem funcional da tradição ML: estritamente tipada, com inferência de tipos pervasiva, avaliação estrita e funções curryficadas. O compilador `amc` oferece compilação em lote para Lua e um REPL. O desenvolvimento do projeto está encerrado e o repositório oficial foi arquivado, mas a distribuição binária 1.0.0.0 ainda funciona e foi a usada para validar esta pasta.

O nome canônico usado nas fontes do projeto é "Amulet", não "AMULET". A extensão `.am` desta pasta é uma convenção do museu: os exemplos oficiais do projeto usam `.ml`, e o compilador aceita qualquer nome de arquivo, como a validação abaixo demonstra.

Sobre a data de criação: não há, nas fontes consultadas, um registro inequívoco do início do projeto. O repositório público foi criado em 2017 e há um texto do autor publicado em 2018; por isso esta pasta não afirma um ano de criação.

## Arquivos

Todos os arquivos são módulos Amulet compiláveis: no nível superior só existem declarações, e os efeitos aparecem ligados ao padrão `let () = ...`. Cada programa importa o prelude explicitamente com `open import "prelude.ml"`, necessário na compilação em lote (no REPL ele já vem carregado).

### Exemplos

1. `exemplo_1.am` — saudação com `put_line` e a forma de um módulo executável
2. `exemplo_2.am` — variáveis, anotações de tipo, inferência, tuplas e registros
3. `exemplo_3.am` — `if`/`then`/`else` como expressão, comparações e operadores lógicos
4. `exemplo_4.am` — repetição por recursão (`let rec`), recursão de cauda e blocos `begin ... end`
5. `exemplo_5.am` — funções, currying, aplicação parcial e funções de ordem superior
6. `exemplo_6.am` — listas, `Cons`/`::`, correspondência de padrões e funções do prelude
7. `exemplo_7.am` — erros com `Exception.try_`, `option` e `error`
8. `exemplo_8.am` — strings com concatenação `^` e conversão com `show`
9. `exemplo_9.am` — operadores distintos para `int` e `float`
10. `exemplo_10.am` — ordenação: algoritmo próprio e a função `sort` da biblioteca

### Exercícios

Cada exercício é um programa completo, resolvido e distinto, com o enunciado em comentário no topo do arquivo:

1. `exercicio_1.am` — saudação personalizada em duas linhas
2. `exercicio_2.am` — conversão de Celsius para Fahrenheit com `float`
3. `exercicio_3.am` — classificação de nota com cadeia de `if`
4. `exercicio_4.am` — soma dos pares de 1 a 20 por recursão de cauda
5. `exercicio_5.am` — potência inteira recursiva e aplicação parcial
6. `exercicio_6.am` — triplo dos elementos, filtro de ímpares e soma
7. `exercicio_7.am` — divisão inteira protegida por `Exception.try_`
8. `exercicio_8.am` — montagem de frase com `^` e `show`
9. `exercicio_9.am` — área de círculo em `float` e média inteira com `//`
10. `exercicio_10.am` — ordenação por inserção, conferência com `sort` e extremos da lista

## Como executar

A distribuição binária oficial 1.0.0.0 traz `amc` e as bibliotecas. No ambiente de validação desta pasta o binário é x86-64 e o sistema é aarch64, então ele foi executado com `qemu-x86_64-static`; em uma máquina x86-64 o comando é apenas `amc`.

```sh
sudo ./install.sh                    # instala amc em /usr e as bibliotecas em /usr/lib/amuletml
amc compile exemplo_1.am -o exemplo_1.lua
lua5.3 exemplo_1.lua
```

Para carregar um arquivo no ambiente interativo:

```sh
amc repl exemplo_1.am
```

A compilação produz Lua; a execução do artefato gerado exige um interpretador Lua (aqui, `lua5.3`). O `amc` também oferece `amc static`, que embute o interpretador Lua em um executável nativo.

## Notas de sintaxe verificadas

- **Comentários:** `(* ... *)`, aninháveis. `--` não é comentário em Amulet.
- **Topo de arquivo:** apenas declarações. Uma expressão solta como `print "oi"` não compila; use `let () = ...`.
- **Strings:** não há instância `show` para `string`, portanto `print "texto"` é erro de tipo. Para strings use `put_line`; `print` aplica `show` e serve para números, listas e tuplas.
- **Números:** `+ - *` e `//` (divisão inteira) para `int`; `+. -. *. /.` para `float`. A barra `/` sobre inteiros devolve `float`, e `**` também devolve `float` — para potência inteira use recursão.
- **Listas:** literal `[1, 2, 3]`, construtor `Cons (x, xs)`. O operador `::` funciona em expressões, mas não em padrões; nos padrões é preciso escrever `Cons (x, resto)`.
- **Tipos aplicados:** a aplicação é prefixa, como em `list int` e `option int` (e não `int list`).
- **Biblioteca:** no escopo de um módulo que importa o prelude, nesta versão, funcionam `filter`, `foldl`, `length`, `sort` e `head`; `map`, `last` e `sort_by` não estão disponíveis (erro E1001). Os arquivos usam apenas o que foi verificado ou escrevem a função no próprio arquivo.
- **Erros:** `Exception.try_` devolve `option`; `Some v` em caso de sucesso e `None` quando uma exceção foi lançada. `error "msg"` lança `UserError`; `//` lança `DivideBy0`.

## Validação executada

Os 20 programas foram compilados com `amc compile` (versão 1.0.0.0) e executados com `lua5.3`: 20 de 20 compilaram e 20 de 20 produziram a saída esperada. Comandos e resultados completos estão em `RELATORIO.md`.

## Referências

- Página oficial: <https://amulet.works/>
- Tutorial "Getting Started": <https://amulet.works/tutorials/01-intro.html>
- Instalação: <https://amulet.works/tutorials/00-installing.html>
- Repositório oficial (arquivado): <https://github.com/amuletml/amulet>
- Gramática: <https://github.com/amuletml/amulet/blob/master/src/Parser.y>
- Lexer: <https://github.com/amuletml/amulet/blob/master/src/Parser/Lexer.x>
- Prelude: <https://github.com/amuletml/amulet/blob/master/lib/prelude.ml>
- Biblioteca de listas: <https://github.com/amuletml/amulet/blob/master/lib/amulet/list.ml>
- Biblioteca de exceções: <https://github.com/amuletml/amulet/blob/master/lib/amulet/exception.ml>
- Texto do autor sobre a linguagem: <https://amelia.how/posts/the-amulet-programming-language.html>
