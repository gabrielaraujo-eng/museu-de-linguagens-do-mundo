# ASYMPTOTE

**Ano de criação:** 2004
**Autores:** Andy Hammerlindl, John C. Bowman e Tom Prince (Universidade de Alberta)
**Extensão dos arquivos:** `.asy`

## A linguagem

Asymptote é uma linguagem de descrição de gráficos vetoriais, criada em 2004 como uma alternativa tecnicamente mais forte ao MetaPost. A sintaxe é deliberadamente parecida com a de C: declarações de tipo explícitas, blocos entre chaves, funções com `return` e operadores como `++`. Sobre essa base, a linguagem oferece tipos próprios de desenho: `pair` (par ordenado de reais), `path` (caminho, possivelmente fechado com `cycle`), `pen` (cor, espessura, tracejado, transparência), `picture` (a figura corrente) e `transform` (translação, escala, rotação).

Diferentemente de uma linguagem de propósito geral, um programa Asymptote não tem função `main`: as instruções de nível superior são executadas em ordem e o resultado é a figura acumulada em `currentpicture`. Ao final do arquivo a figura é emitida implicitamente; a função `shipout` permite emitir antes do fim ou gerar várias páginas. A saída padrão é PostScript ou PDF, com SVG, PNG e até 3D (PRC/WebGL) disponíveis; a biblioteca `graph` acrescenta eixos, marcas de escala e o desenho de funções reais.

Textos e fórmulas são compostos pelo LaTeX por padrão, o que permite rótulos matemáticos, mas cria uma dependência externa: sem uma instalação de TeX o programa compila e desenha, porém os rótulos falham.

## Arquivos

### Exemplos

1. `exemplo_1.asy` — primeiro desenho: `unitsize`, `pair`, `path`, `draw`, `dot`, `label` e `write`
2. `exemplo_2.asy` — variáveis dos tipos `int`, `real`, `pen` e `path`; preenchimento e transformações
3. `exemplo_3.asy` — controle de fluxo com `if`, `else if` e `else`, classificando pontos por quadrante
4. `exemplo_4.asy` — laços `for` (crescente e decrescente) e `while`; polígono regular por coordenadas polares
5. `exemplo_5.asy` — funções definidas pelo usuário, valor padrão de parâmetro e gráficos com `import graph`
6. `exemplo_6.asy` — `struct` com construtor `operator init` e métodos; arrays de estruturas e de `pen`
7. `exemplo_7.asy` — ausência de exceções: pré-condições com `assert` e códigos de erro devolvidos por função
8. `exemplo_8.asy` — strings: `length`, `substr`, concatenação com `+` e formatação com `format`
9. `exemplo_9.asy` — matemática: `pi`, `sin`, `cos`, `exp`, `log`, `sqrt` e marcas de escala em múltiplos de `pi/2`
10. `exemplo_10.asy` — recursão: árvore fractal binária com sete níveis e contagem de segmentos

### Exercícios

Cada exercício é um programa completo e independente, com enunciado no cabeçalho e resultado verificado no terminal:

1. `exercicio_1.asy` — quadrado com vértices rotulados, diagonal e cálculo de perímetro, área e diagonal
2. `exercicio_2.asy` — planta baixa com dimensões em metros e em pés, com cotas desenhadas
3. `exercicio_3.asy` — semáforo de três estados decidido por `if`/`else if`/`else`, com estado inválido tratado
4. `exercicio_4.asy` — hexágono regular decomposto em seis triângulos, com área somada comparada à fórmula exata
5. `exercicio_5.asy` — gráfico de `f(x) = x^3 - 3x`, raízes pelo método da bisseção e reta tangente
6. `exercicio_6.asy` — `struct Ponto`, nuvem de pontos, caixa envolvente e centroide
7. `exercicio_7.asy` — validação de uma tabela de notas com descarte de valores fora de `[0, 10]` e `assert` final
8. `exercicio_8.asy` — gráfico de barras com rótulos montados por `substr`, `format` e concatenação
9. `exercicio_9.asy` — círculo trigonométrico com arco de 30 graus, seno e cosseno projetados
10. `exercicio_10.asy` — ordenação por seleção dos pontos pela distância à origem e poligonal do percurso

## Como executar

A implementação usada para validar esta pasta é o Asymptote 2.87, empacotado no Debian/Ubuntu:

```sh
sudo apt-get install -y asymptote texlive-latex-base ghostscript
asy -f pdf exemplo_1.asy                 # gera exemplo_1.pdf
asy -f png exemplo_1.asy                 # gera exemplo_1.png
asy -f pdf -o /tmp/saida_1 exemplo_1.asy # nome de saída sem extensão
```

O argumento de `-o` deve vir sem extensão: `-o saida.pdf` produz `saida.pdf.pdf`. A opção `-f` escolhe o formato (`pdf`, `ps`, `eps`, `svg`, `png`). Os programas também imprimem resultados numéricos no terminal com `write`, o que permite conferir os cálculos sem abrir a figura.

## Escopo e limitações documentadas

- **Sem função `main`:** o corpo do arquivo é o programa. O desenho é emitido ao final; `shipout()` força a emissão antes, e `newpage()` abre uma nova página.
- **Saída de texto:** `write` aceita **um único argumento**. Para compor uma linha com vários valores é preciso concatenar com `+` e converter cada valor com `string(...)`.
- **`format`:** nesta versão a função aceita a cadeia de formato e **apenas um** valor. Vários valores exigem concatenação de chamadas.
- **`string(pair)` não existe:** pares ordenados precisam ser convertidos campo a campo (`p.x`, `p.y`); os arquivos que imprimem pares definem a função auxiliar `texto(pair)`.
- **Aritmética inteira:** o resto da divisão é o operador `%`; `mod` não é palavra reservada.
- **Sem exceções:** não há `try`/`catch`. `assert(condição, mensagem)` aborta o programa com código de erro; por isso os exemplos tratam casos inválidos com `if` e códigos de retorno antes de recorrer a `assert`.
- **Rótulos e LaTeX:** `label` compõe o texto com LaTeX. Os rótulos desta pasta usam apenas ASCII e evitam `^`, `_`, `%` e acentos, que exigiriam modo matemático ou escape e quebrariam a compilação sem TeX. Comentários e o README ficam em português com acentuação normal.
- **Cores e canetas:** usam-se `rgb(r, g, b)`, `gray(n)` e atributos como `linewidth`, `dashed` e `opacity`. Nomes de cor não padronizados variam entre versões e foram evitados.
- **PNG:** a conversão para bitmap depende de um renderizador externo (Ghostscript); PDF e SVG não têm essa dependência.

## Validação executada

Os 20 programas foram compilados individualmente com `asy -f pdf` e `asy -f png`, exigindo código de saída 0 e arquivo de imagem gerado. Resultado final: **20 de 20 aprovados nos dois formatos**, com figuras entre 4,6 kB e 9,8 kB em PDF e entre 0,7 kB e 3,9 kB em PNG. O detalhamento dos comandos, dos erros encontrados e das correções está em `RELATORIO.md`.

## Referências

- Página oficial do Asymptote: <https://asymptote.sourceforge.io/>
- Manual de referência (versão atual): <https://asymptote.sourceforge.io/doc/index.html>
- Comandos de desenho (`draw`, `fill`, `clip`, `label`, `shipout`): <https://asymptote.sourceforge.io/doc/Drawing-commands.html>
- Repositório oficial: <https://github.com/vectorgraphics/asymptote>
