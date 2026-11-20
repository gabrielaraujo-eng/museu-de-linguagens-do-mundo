# ALICE (Alice ML)

**Linhagem:** Standard ML
**Primeiro lançamento do sistema:** 2003 (anúncio da versão 1.0 na lista oficial do projeto)
**Implementação de referência:** Alice ML 1.4, do grupo de Programação de Sistemas da Universidade de Saarland
**Extensão de fonte:** `.aml`

## Descrição

Alice ML é uma linguagem funcional desenvolvida no grupo de Programação de Sistemas da Universidade de Saarland. Ela é baseada em Standard ML e acrescenta recursos que a documentação oficial descreve como extensões ao núcleo de Standard ML: avaliação preguiçosa por meio de *futures* e *promises*, concorrência, módulos e pacotes de primeira classe, componentes compilados separadamente, distribuição (inclusive aplicação remota de funções) e programação com restrições (*constraint programming*).

Como herda Standard ML, a linguagem tem avaliação estrita por padrão, inferência de tipos com polimorfismo de Hindley-Milner, funções como valores de primeira classe, casamento de padrões, exceções e estruturas de dados persistentes (listas, vetores, tuplas, registros). As frases digitadas no toplevel interativo são encerradas por ponto e vírgula.

## Arquivos

Cada arquivo `.aml` desta pasta é uma sequência de frases do toplevel de Alice ML, na forma documentada no manual: declarações e expressões terminadas por `;`. Os arquivos não são componentes compiláveis por `alicec` (ver "Como executar").

### Exemplos

1. `exemplo_1.aml` — saída de texto com `TextIO.print` e com `print`; literal de string com escape UTF-8
2. `exemplo_2.aml` — declarações `val`, inferência de tipos, anotação `: int`, tuplas
3. `exemplo_3.aml` — `if ... then ... else ...`, cadeia de condicionais e tipos dos ramos
4. `exemplo_4.aml` — repetição por recursão: contagem regressiva e soma com acumulador (recursão de cauda)
5. `exemplo_5.aml` — funções sobre par de argumentos, função de ordem superior e aplicação
6. `exemplo_6.aml` — listas: `nil`, `::`, `@`, casamento de padrões, `List.length` e `List.foldl`
7. `exemplo_7.aml` — exceções: `exception` própria com valor, `raise`, `handle` e `Div` de `General`
8. `exemplo_8.aml` — strings: `^`, `String.size`, `substring`, `map`, `str` e `concatWith`
9. `exemplo_9.aml` — aritmética inteira (`div`, `mod`, menos unário `~`), potência recursiva e `Math`
10. `exemplo_10.aml` — ordenação por inserção com casamento de padrões e verificação da ordem

### Exercícios

Cada exercício é um programa completo e resolvido, com o enunciado no comentário inicial:

1. `exercicio_1.aml` — saudação personalizada por concatenação de strings
2. `exercicio_2.aml` — `string` e `int` anotados, cálculo do ano de nascimento e `Int.toString`
3. `exercicio_3.aml` — conceito A/B/C/D por condicionais, aplicado com `List.app`
4. `exercicio_4.aml` — fatorial recursivo com acumulador para 0 até 6
5. `exercicio_5.aml` — média, mínimo e máximo de um par de inteiros
6. `exercicio_6.aml` — `List.filter` e `List.map` sobre os números de 1 a 8
7. `exercicio_7.aml` — exceção própria `IdadeInvalida` com validação de intervalo e `handle`
8. `exercicio_8.aml` — contagem de vogais percorrendo a string com `String.sub`
9. `exercicio_9.aml` — hipotenusa com `Math.sqrt`, média de reais e conversão Celsius/Fahrenheit
10. `exercicio_10.aml` — ordenação alfabética de strings com o comparador `String.compare`

## Como executar

Os arquivos são entradas para o toplevel, não componentes. No toplevel de Alice ML, cada frase termina com `;` e o sistema responde com o tipo e o valor do resultado:

```sh
alice            # abre o toplevel interativo de Alice ML
```

Depois basta colar o conteúdo do arquivo, ou alimentar o toplevel pela entrada padrão:

```sh
alice < exemplo_1.aml
```

Para o fluxo de componentes, que é diferente, o manual documenta compilar uma fonte que declara um componente com `alicec` e executá-la com `alicerun`:

```sh
alicec Main.aml
alicerun Main
```

Esse fluxo exige uma fonte no formato de componente (por exemplo `structure Main = struct ... end`) e não se aplica às frases soltas desta pasta.

## Escopo e limitações documentadas

- **Formato dos arquivos:** frases de toplevel. Elas foram escritas para poderem ser avaliadas em sequência e também verificadas por uma implementação de Standard ML, já que usam apenas o núcleo herdado. Nenhum arquivo usa `Future`, `Package`, `Component` ou `Thread`, cujas semânticas exigem o runtime de Alice ML.
- **Comentários:** os arquivos usam comentários `(* ... *)` de Standard ML, aceitos por Alice ML. Alice também define comentários de linha iniciados por `(*)`, que não são sintaxe de Standard ML e por isso não foram usados; `--` não é marcador de comentário desta linguagem.
- **Strings e acentuação:** o literal de string de Standard ML admite apenas ASCII imprimível, e o léxico de Alice segue essa restrição. Por isso os textos impressos são ASCII, e as palavras acentuadas aparecem como escapes decimais de bytes UTF-8 (`"Ol\195\161"` produz `Olá`), como em `exemplo_1.aml` e `exercicio_1.aml`.
- **Divisão inteira:** `div` arredonda para baixo e `mod` acompanha esse arredondamento; por isso `~17 div 5` vale `~4` e `~17 mod 5` vale `3`.
- **Ordenação:** a estrutura `List` de Alice ML documenta `List.sort : ('a * 'a -> order) -> 'a list -> 'a list`, além de `List.isSorted`. Os exemplos 10 e o exercício 10 implementam a ordenação por inserção para mostrar o algoritmo; a função de biblioteca não é usada porque a implementação de Standard ML disponível para validação não a oferece.
- **Ausência de laços imperativos:** o núcleo funcional não tem `for`/`while`; repetição é expressa por recursão, como nos exemplos 4 e 9 e nos exercícios 4 e 8.

## Validação executada

Não foi possível executar os arquivos com Alice ML: os binários `alice`, `alicec` e `alicerun` da versão 1.4 não estão disponíveis como pacote no ambiente usado, e a compilação a partir do código-fonte depende de uma instalação antiga de SML/NJ. A verificação executada foi feita com **Poly/ML 5.7.1**, implementação de Standard ML que cobre o subconjunto usado nos arquivos (o mesmo núcleo que Alice ML herda):

```sh
poly --use exemplo_1.aml < /dev/null
```

Os 20 programas foram avaliados nessa implementação e os 20 terminaram com código de saída 0, produzindo a saída esperada para o tópico. Os comandos e as saídas completas estão em `RELATORIO.md`. A sintaxe específica de Alice ML usada nos arquivos se limita ao formato de frases de toplevel e aos comentários `(* ... *)`, ambos documentados no manual da linguagem; nenhum recurso exclusivo de Alice ML foi empregado, de modo que a execução obtida não comprova o comportamento de `futures`, pacotes, componentes ou distribuição.

## Referências

- Página do projeto Alice ML: <https://www.ps.uni-saarland.de/alice/>
- Manual, "A Tour to Wonderland": <https://www.ps.uni-saarland.de/alice/manual/tour.html>
- Manual, "Syntactic Enhancements": <https://www.ps.uni-saarland.de/alice/manual/sugar.html>
- Manual, estrutura `List`: <https://www.ps.uni-saarland.de/alice/manual/library/list.html>
- Manual, estrutura `General` (exceção `Div`): <https://www.ps.uni-saarland.de/alice/manual/library/general.html>
- Manual, índice da biblioteca: <https://www.ps.uni-saarland.de/alice/manual/library/index.html>
- Download do sistema (versão 1.4): <https://www.ps.uni-saarland.de/alice/download.html>
- Anúncio da primeira versão do sistema (6 de janeiro de 2003): <https://www.ps.uni-saarland.de/alice/alice-users/0000.html>
