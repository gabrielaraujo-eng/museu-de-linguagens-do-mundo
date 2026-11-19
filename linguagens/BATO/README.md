# BATO

## Dialeto e convenções adotados

Bato é uma linguagem de scripting para ensino, em filipino e baseada em Ruby, conforme o [repositório do mantenedor](https://github.com/jjuliano/bato). Neste diretório, usamos a sintaxe reconhecida pelo parser do projeto. Entre as formas documentadas estão `mag_print`, `kapag`, `kung_hindi`, `wakas`, `para_sa`, `na_nasa`, `ganito_gawin`, `ang`, `ibalik`, `simula` e `agapan`, conforme o [mapeamento de palavras-chave](https://raw.githubusercontent.com/jjuliano/bato/master/lib/bato/ruby_parser_patches.rb) e os [testes do tradutor](https://raw.githubusercontent.com/jjuliano/bato/master/spec/bato/tagatala_spec.rb).

Atribuições, expressões aritméticas, arrays e métodos como `Array#sort` vêm da sintaxe ou da biblioteca Ruby subjacente; não são declarações de tipos nem recursos exclusivos de Bato. Veja a [documentação Ruby de `Array`](https://docs.ruby-lang.org/en/master/Array.html).

O repositório mantém a extensão `.bato` usada pelos arquivos existentes. A [documentação oficial](https://jjuliano.github.io/bato/) mostra arquivos `.bt`; o [lançador oficial](https://raw.githubusercontent.com/jjuliano/bato/master/bin/bato) lê os caminhos recebidos como argumentos e não aparenta exigir uma extensão específica.

Não foi encontrada fonte primária que confirme 2013 como ano de criação. O [histórico de versões no RubyGems](https://rubygems.org/api/v1/versions/bato.json) registra a publicação da versão `0.0.2` em 28 de junho de 2016; essa data não estabelece quando o projeto foi criado.

## Exemplos

Os exemplos apresentam programas curtos em ordem temática. Comentários de código usam `#`, como nos exemplos do [projeto oficial](https://jjuliano.github.io/bato/).

1. [`exemplo_1.bato`](exemplo_1.bato) — saída de texto com `mag_print`.
2. [`exemplo_2.bato`](exemplo_2.bato) — atribuição e exibição de um inteiro e uma string; não há declaração estática de tipos neste exemplo.
3. [`exemplo_3.bato`](exemplo_3.bato) — condicional com valor inicializado e as formas `kapag` e `kung_hindi`.
4. [`exemplo_4.bato`](exemplo_4.bato) — repetição sobre o intervalo `1..5` com `para_sa`, `na_nasa` e `ganito_gawin`.
5. [`exemplo_5.bato`](exemplo_5.bato) — definição e chamada de método com `ang` e `ibalik`.
6. [`exemplo_6.bato`](exemplo_6.bato) — criação e exibição de um array Ruby.
7. [`exemplo_7.bato`](exemplo_7.bato) — tratamento de erro com `simula` e `agapan`.
8. [`exemplo_8.bato`](exemplo_8.bato) — métodos de string `baliktad` e `haba` documentados pelo projeto.
9. [`exemplo_9.bato`](exemplo_9.bato) — expressão aritmética e exibição do resultado.
10. [`exemplo_10.bato`](exemplo_10.bato) — ordenação com `Array#sort`, método padrão Ruby que retorna os elementos ordenados em um novo array; não é uma implementação própria de algoritmo de ordenação.

## Exercícios

Cada arquivo contém uma tarefa identificada em comentário e uma solução de referência. Os objetivos são distintos:

1. [`exercicio_1.bato`](exercicio_1.bato) — exibir uma mensagem de boas-vindas.
2. [`exercicio_2.bato`](exercicio_2.bato) — atribuir nome e idade a variáveis e exibir os valores.
3. [`exercicio_3.bato`](exercicio_3.bato) — decidir se uma nota inicializada atinge o limite de aprovação.
4. [`exercicio_4.bato`](exercicio_4.bato) — percorrer de 1 a 5 e exibir o dobro de cada número.
5. [`exercicio_5.bato`](exercicio_5.bato) — definir e chamar um método que devolve o dobro de um número.
6. [`exercicio_6.bato`](exercicio_6.bato) — criar e exibir uma lista de frutas.
7. [`exercicio_7.bato`](exercicio_7.bato) — capturar e exibir um erro de divisão por zero.
8. [`exercicio_8.bato`](exercicio_8.bato) — exibir o comprimento de uma string usando `haba`.
9. [`exercicio_9.bato`](exercicio_9.bato) — exibir o resultado de uma expressão com precedência aritmética.
10. [`exercicio_10.bato`](exercicio_10.bato) — ordenar uma lista com `Array#sort` da biblioteca padrão Ruby.

## Validação e limites

O runtime `bato` e as ferramentas `ruby` e `gem` não estavam disponíveis durante esta revisão. Por isso, os arquivos foram conferidos estaticamente com as fontes acima, mas não foram executados neste ambiente.

## Fontes

- [1] [Repositório oficial do Bato](https://github.com/jjuliano/bato)
- [2] [Documentação oficial do Bato](https://jjuliano.github.io/bato/)
- [3] [Mapeamento de palavras-chave do parser Bato](https://raw.githubusercontent.com/jjuliano/bato/master/lib/bato/ruby_parser_patches.rb)
- [4] [Testes do tradutor e da sintaxe Bato](https://raw.githubusercontent.com/jjuliano/bato/master/spec/bato/tagatala_spec.rb)
- [5] [Lançador oficial de linha de comando](https://raw.githubusercontent.com/jjuliano/bato/master/bin/bato)
- [6] [Documentação Ruby de `Array`](https://docs.ruby-lang.org/en/master/Array.html)
- [7] [Histórico de versões de Bato no RubyGems](https://rubygems.org/api/v1/versions/bato.json)
