# ARC

**Ano de criação:** 2001 (distribuição de referência: Arc 3.2, de 2008)
**Criadores:** Paul Graham e Robert Morris
**Paradigma:** funcional, dialeto de Lisp; código e dados têm a mesma forma (listas entre parênteses)

## Descrição

Arc é um dialeto de Lisp criado por Paul Graham e Robert Morris. O objetivo declarado
dos autores era ter um Lisp muito conciso, com nomes curtos (`def`, `let`, `each`,
`prn`) e sem a parafernália de bibliotecas e declarações dos Lisps tradicionais. Tudo
em Arc é uma expressão que devolve um valor: não há comandos, nem palavras-chave de
declaração de tipo, nem `cond` (usa-se `if` com várias vias).

Esta pasta reúne 10 exemplos progressivos e 10 exercícios resolvidos, todos em código
Arc executável, com comentários em português. Os comentários usam `;` até o fim da linha.

## Sintaxe essencial

| Forma | Significado |
| --- | --- |
| `(= x 10)` | atribuição no escopo atual; no topo cria variável global |
| `(let x 10 corpo)` | ligação local de uma variável |
| `(withs (a 1 b 2) corpo)` | várias ligações locais em sequência |
| `(def f (a (o b 2)) corpo)` | define função; `(o nome padrão)` é parâmetro opcional |
| `(def f args corpo)` | `args` solto recolhe todos os argumentos em uma lista |
| `(fn (x) ...)` | função anônima |
| `(if t1 v1 t2 v2 ... vfinal)` | seleção; o último argumento sozinho é o caso contrário |
| `(when teste corpo)` / `(unless teste corpo)` | corpo condicional |
| `(while teste corpo)` | repetição com teste no início |
| `(for i 1 10 corpo)` | contagem de 1 a 10, inclusive nas duas pontas |
| `(each x sequência corpo)` | percurso de listas, strings, tabelas e alists |
| `(cons a b)`, `(car p)`, `(cdr p)`, `(list ...)` | pares e listas |
| `(obj chave valor ...)`, `(table)` | tabelas (hash) |
| `(pr ...)` / `(prn ...)` | impressão sem / com quebra de linha |
| `(iso a b)` | igualdade de conteúdo (listas, strings) |
| `(is a b)` | identidade (números, símbolos, o mesmo objeto) |
| `(err ...)` / `(on-err tratador corpo)` / `(errsafe expr)` | sinalizar, capturar e ignorar erros |

Duas regras que costumam surpreender quem vem de outras linguagens:

- **Só `nil` é falso.** `0`, `""` e a lista `(1 2 3)` são verdadeiros. A verdade canônica
  é o símbolo `t`. Não se escreve `(t)` nem `(nil)`: são valores, não chamadas.
- **A divisão de inteiros é exata.** `(/ 7 2)` devolve `7/2`, não `3`. Para truncar,
  use `(trunc (/ 7 2))`.

## Exemplos

1. `exemplo_1.arc` — Olá, Mundo com `prn`, `pr` e o valor de retorno da impressão
2. `exemplo_2.arc` — variáveis (`=`, `let`, `withs`), tipos (`type`, `isa`) e números exatos
3. `exemplo_3.arc` — `if` com várias vias, `when`, `unless`, `case`, `iflet` e a regra de verdade
4. `exemplo_4.arc` — `while`, `for`, `each` (listas, strings, alists), `repeat` e laços aninhados
5. `exemplo_5.arc` — `def`, parâmetros opcionais e variádicos, recursão, `fn` e `map`
6. `exemplo_6.arc` — pares, listas, alists e tabelas com `obj` e `table`
7. `exemplo_7.arc` — `err`, `on-err` e `errsafe`; validação defensiva de argumentos
8. `exemplo_8.arc` — `len`, `cut`, `pos`, `string`, `coerce`, `split`, `upcase` e `each` sobre string
9. `exemplo_9.arc` — aritmética variádica, `mod`, `expt`, `sqrt`, `min`/`max`, média e primos
10. `exemplo_10.arc` — ordenação por inserção, `sort` nativo, busca binária e Fibonacci com memoização

## Exercícios

Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1.arc` — relatório formatado com cabeçalho e tabela alinhada (`pr`/`prn`)
2. `exercicio_2.arc` — conversão de Celsius para Fahrenheit com validação de tipo
3. `exercicio_3.arc` — classificação de inteiros em quatro faixas (`if`, `when`, `unless`, `case`)
4. `exercicio_4.arc` — soma dos pares de 1 a 50 por `for` e por `while`, conferindo os resultados
5. `exercicio_5.arc` — funções com parâmetro opcional, variádico, função como argumento e recursão
6. `exercicio_6.arc` — inversão de lista sem `rev`, contagem de ocorrências e tabela de frequências
7. `exercicio_7.arc` — divisão segura com `err`/`on-err`/`errsafe`, um erro por par sem abortar o resto
8. `exercicio_8.arc` — contagem de vogais e remoção de vogais percorrendo a string caractere a caractere
9. `exercicio_9.arc` — MDC por Euclides, MMC, redução sobre listas e conferência `mdc * mmc = a * b`
10. `exercicio_10.arc` — mínimo, máximo, soma, média e mediana de notas, devolvidos como alist

## Como executar

A distribuição oficial é o `arc3.2.tar`, disponível em <http://www.arclanguage.org/arc3.2.tar>.
Ela é escrita para MzScheme/PLT Scheme e começa com `(require mzscheme)`, módulo que o
Racket atual (6.x em diante) não oferece mais; por isso o Arc 3.2 não inicia em um Racket
moderno. O caminho usado nesta pasta é o fork **Anarki**, mantido para Racket 7.7 ou superior:

```sh
raco pkg install sha
curl -sSL -o anarki.tar.gz https://codeload.github.com/arclanguage/anarki/tar.gz/refs/heads/master
tar xzf anarki.tar.gz && cd anarki-master
racket -t boot.rkt -e '(anarki-init-in-main-namespace-verbose) (aload-with-main-settings "caminho/exemplo_1.arc")'
```

No Arc 3.2 oficial o carregamento é feito no prompt do interpretador:

```sh
racket -f as.scm        # em instalações antigas de PLT Scheme/MzScheme
arc> (load "exemplo_1.arc")
```

A extensão `.arc` é a convenção do próprio Arc para arquivos de código; não há etapa de
compilação — o arquivo é lido e avaliado forma por forma.

## Escopo e limitações documentadas

- **`for`:** o `(for i 1 10 corpo)` deste material é a macro do Arc 3.2. O Anarki renomeou
  essa macro para `up` e deu outro significado a `for` (contador com teste e atualização).
  Por isso os dois arquivos que usam `for` foram executados no Anarki em cópias com a
  substituição textual `(for ` → `(up `; os demais rodaram sem alteração.
- **Erros:** Arc não tem `try/catch`. `(err ...)` sinaliza e `on-err` captura; o tratador
  recebe o objeto de condição, cuja representação textual difere entre implementações
  (Arc 3.2 e Anarki). Os exemplos imprimem descrições fixas em vez do objeto bruto.
- **Listas de associação:** `alref` e `cadr` esperam listas de dois elementos
  (`(list 'porta 8080)`), não pares pontilhados (`(cons 'porta 8080)`); o par pontilhado
  faz `cadr` falhar. Os exemplos seguem a forma com `list`.
- **Caracteres não são funções:** `(pos #\a s)` não funciona, porque Arc aplica o teste a
  cada elemento; é preciso passar uma função, como `(pos (fn (c) (iso c #\a)) s)`.
- **Números:** não há promoção automática para ponto flutuante; resultados racionais
  aparecem como `7/2`, `493/5`, `15/2`. `trunc` e `round` convertem para inteiro.
- **Saída:** `pr` imprime strings sem aspas dentro de listas, o que pode gerar espaços
  duplicados aparentes em resultados de `split`.
- **Sem `cond`:** toda seleção múltipla é feita com `if` de várias vias, `case` ou `iflet`.

## Validação executada

Os 20 programas (10 exemplos e 10 exercícios) foram executados no Anarki sobre Racket 8.10:
20 de 20 terminaram com código de saída 0 e produziram a saída esperada para o tópico.
O Arc 3.2 oficial não foi executado, porque depende de `(require mzscheme)`. Comandos,
saídas e divergências estão detalhados em `RELATORIO.md`.

## Referências

- Distribuição oficial Arc 3.2: <http://www.arclanguage.org/arc3.2.tar>
- Código-fonte da linguagem (usado para confirmar a sintaxe): `arc.arc` e `ac.scm` do pacote acima
- Site oficial e tutorial: <http://arclanguage.org/> e <http://www.arclanguage.org/tutorial>
- Ensaio de Paul Graham sobre Arc: <http://paulgraham.com/arc.html>
- Anarki, fork mantido para Racket moderno: <https://github.com/arclanguage/anarki>
