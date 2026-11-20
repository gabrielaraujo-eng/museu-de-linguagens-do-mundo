# AUGEAS

**Linhagem:** linguagem de lentes de configuração do projeto Augeas, iniciado em 2007
**Linguagem desta pasta:** a linguagem de lentes do Augeas, na sintaxe aceita pelo `augparse` da versão 1.14.1 (augeas-tools)

## Descrição

Augeas é uma biblioteca C que lê e grava arquivos de configuração sem perder o que não entende. O programador não escreve um analisador sintático imperativo: escreve uma **lente**, um programa declarativo que descreve ao mesmo tempo a sintaxe do arquivo e a árvore de nós que ele representa. A mesma lente serve para ler (`get`) e para gravar (`put`), e o Augeas garante que trechos não modelados continuem intactos no arquivo final. As lentes distribuídas ficam em `/usr/share/augeas/lenses/dist/*.aug` e cobrem dezenas de formatos reais, como `/etc/hosts`, `/etc/fstab`, `/etc/ssh/sshd_config` e `crontab`.

A linguagem tem tipos próprios: `lens` (uma lente), `regexp` (uma expressão regular), `string`, `tree` (uma árvore literal, usada nos testes) e `filter` (a lista de arquivos que a lente governa). Um arquivo de lente declara `module Nome = autoload xfm`, define `let lns = ...`, define `let filter = ...` e liga os dois com `let xfm = transform lns filter`. As construções centrais são:

- `[ ... ]` cria um nó na árvore; dentro dele há exatamente uma chave (`key`, `label` ou `seq`);
- `store` guarda o texto no valor do nó; `value` fixa um valor constante; `del` descarta o texto e, com dois argumentos, sabe recriá-lo;
- `.` concatena lentes, `|` escolhe entre alternativas, `?`, `*` e `+` repetem;
- `Util.*` (por exemplo `Util.del_str`, `Util.del_ws_spc`, `Util.del_opt_ws`, `Util.eol`, `Util.empty`, `Util.comment`, `Util.comment_noindent`, `Util.stdexcl`), `Sep.*`, `Rx.*`, `Build.key_value_line` formam a biblioteca de apoio. (Não existe módulo `R` na 1.14.1: comentários vêm de `Util.comment` e `Util.comment_noindent`.)

## Arquivos

Esta pasta contém apenas arquivos `.aug`: cada um é um módulo de lente completo, com `module`, `autoload xfm`, `filter`, `xfm` e testes `test ... get/put` executáveis. O nome do módulo corresponde ao nome do arquivo (`exemplo_1.aug` contém `module Exemplo_1`), que é a convenção que o Augeas usa para carregar lentes.

### Exemplos

1. `exemplo_1` — lente mínima para um arquivo `chave = valor`, com comentários e linhas vazias
2. `exemplo_2` — separação entre ruído (comentário, linha vazia) e dado, com `Util.comment` e `Util.empty`
3. `exemplo_3` — valores entre aspas, com `Util.del_str` recriando as aspas na gravação
4. `exemplo_4` — listas: `seq` para linhas numeradas e `label` para valores repetidos
5. `exemplo_5` — seções no estilo INI, com o nome da seção como nó pai
6. `exemplo_6` — blocos aninhados com recursão (`let rec`) e `del` com dois argumentos
7. `exemplo_7` — diretivas com valor opcional (bandeira sem valor e `chave = valor`)
8. `exemplo_8` — lentes prontas: `Build.key_value_line`, `Build.flag_line` e `Sep.space_equal`
9. `exemplo_9` — números com `Rx.decimal` e texto fixo escrito por `del` com valor padrão
10. `exemplo_10` — `label` repetido e filtro com vários `incl` mais `Util.stdexcl`

### Exercícios

Cada exercício é uma lente completa, resolvida e distinta, sobre o tópico correspondente, com testes de leitura e de gravação:

1. `exercicio_1` — `/etc/hosts`: endereço como chave e apelidos como filhos
2. `exercicio_2` — `/etc/fstab`: seis campos, cada um com rótulo próprio
3. `exercicio_3` — pares `chave: valor` com valor que contém espaços
4. `exercicio_4` — `servidor = host:porta`, com `Util.del_str` para os dois-pontos
5. `exercicio_5` — lista de valores separados por vírgula
6. `exercicio_6` — `crontab`: cinco campos de tempo e o comando até o fim da linha
7. `exercicio_7` — registro com campos separados por barra vertical
8. `exercicio_8` — registro no estilo `/etc/passwd`, com campos vazios permitidos
9. `exercicio_9` — lista entre colchetes, com colchetes como delimitadores
10. `exercicio_10` — valores `sim`/`nao` com comentário no fim da linha

## Como executar

A ferramenta de validação é o `augparse`, que analisa o módulo, verifica os tipos das lentes e executa os testes declarados no próprio arquivo:

```sh
sudo apt-get install -y augeas-tools
cd linguagens/AUGEAS
augparse -I . exemplo_1.aug    # sem saída e código 0 significa lente válida e testes aprovados
```

Para experimentar uma lente sobre um arquivo real, sem tocar no sistema:

```sh
printf 'nome = museu\n' > /tmp/exemplo1.conf
printf 'print /files/tmp/exemplo1.conf\nset /files/tmp/exemplo1.conf/nome augeas\nsave\n' > /tmp/cmds.txt
augtool -I . --transform "Exemplo_1.lns incl /tmp/exemplo1.conf" -f /tmp/cmds.txt
cat /tmp/exemplo1.conf
```

Saída obtida: `/files/tmp/exemplo1.conf/nome = "museu"`, depois `Saved 1 file(s)`, e o arquivo passa a conter `nome = augeas`.

## Escopo e limitações documentadas

- **Nomes de nó numéricos:** `seq "x"` gera rótulos `1`, `2`, `3` (o nome `x` serve de contador interno), e não `x[1]`. Por isso as expressões de caminho nos testes usam `*[1]` em vez de `1`, já que o `augparse` recusa caminhos que começam por dígito.
- **`counter`:** segundo a documentação, `counter` apenas declara e reinicia um contador; quem usa o valor do contador como rótulo é `seq`. Usar `counter` como chave dentro de `[ ... ]` produziu, na 1.14.1, nós sem rótulo. Por isso os exemplos usam `seq` e `label`.
- **Escapes em regexp:** dentro de uma lente, `\\.` não casa uma barra invertida (o `augparse` a trata como ponto literal). Os exemplos não interpretam sequências de escape; o `exemplo_3` documenta isso e guarda o texto como está. Pelo mesmo motivo, um `]` literal dentro de classe de caracteres é escrito na primeira posição (`[^] \t,\n]`).
- **Comentários dentro de seções:** no `exemplo_5`, comentários e linhas vazias ficam no nível superior, como em `sshd.aug`; uma repetição dentro de outra repetição seria ambígua para o motor de lentes.
- **Indentação:** a lente reconhece espaços na leitura, mas não os inventa na gravação. Um nó criado em um bloco aninhado sai sem indentação, como mostra o teste do `exemplo_6`.
- **Filtros:** os caminhos em `incl` são apenas declarações (`/etc/exemplo1.conf` etc.); nada é lido ou escrito durante a validação, porque `augparse` só analisa a lente.
- **Caminhos absolutos:** `util.aug` e as demais bibliotecas são resolvidas pelo próprio Augeas; `-I .` é necessário para que o módulo do diretório atual seja encontrado.

## Validação executada

Os 20 arquivos `.aug` foram analisados com `augparse -I . arquivo.aug` na versão 1.14.1: 20 de 20 terminaram com código 0, sem mensagem de erro de tipo e com todos os testes `get`/`put` aprovados. Os comandos, as falhas encontradas no caminho e as correções aplicadas estão em `RELATORIO.md`.

## Referências

- Documentação oficial das lentes e da linguagem: <https://augeas.net/docs/lenses.html>
- Referência da linguagem de lentes (tipos, `key`, `store`, `del`, `seq`): <https://augeas.net/docs/references/lenses/files/augeas-aug.html>
- Repositório oficial: <https://github.com/hercules-team/augeas>
- Lentes distribuídas, usadas como modelo (`util.aug`, `sep.aug`, `build.aug`, `sshd.aug`): <https://github.com/hercules-team/augeas/tree/master/lenses>
