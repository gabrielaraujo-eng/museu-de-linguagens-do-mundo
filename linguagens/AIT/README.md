# Ait

Ait é uma linguagem concatenativa experimental para programação criativa. Em um programa, valores e palavras são processados em uma pilha: por exemplo, `2 3 +` coloca a soma na pilha. A implementação upstream `ait-lang` interpreta arquivos Ait por uma CLI de Node.js e descreve o projeto como ainda em desenvolvimento. As fontes oficiais consultadas não confirmam o ano de criação 1994, por isso esta documentação não atribui um ano à linguagem.

A sintaxe demonstrada nesta pasta segue o [README do projeto upstream](https://github.com/mollerse/ait-lang/blob/13efd470c51dc539df33fa724ee4ba2e8e2abc14/README.md), no commit `13efd470c51dc539df33fa724ee4ba2e8e2abc14`.

## Elementos básicos

- Comentários começam com `#` e seguem até o fim da linha.
- Literais de texto podem ser escritos entre aspas simples ou duplas. O ponto `.` remove o valor do topo da pilha e o imprime na saída padrão.
- `42 -> x` guarda o valor do topo da pilha na variável `x`; escrever `x` lê esse valor.
- Uma palavra definida pelo usuário usa a forma `nome: ... ;`, como `quadrado: dup * ;`.
- Colchetes criam uma citação, que pode ser executada por palavras de controle como `ifte`, `times` e `linrec`.
- O runtime inclui agregados como `[ 1 2 3 ]`, além de operações matemáticas e de ordenação.

A implementação upstream classifica o módulo de manipulação de strings como instável. Por isso, o exemplo 8 demonstra um literal de texto e sua saída, sem depender da palavra `replace`. A pasta não apresenta `print`, `if`, declarações de tipos nem `try/catch` como sintaxe de Ait.

## Como executar

O upstream documenta Node.js 6 ou superior e a instalação pelo npm. Com `ait-lang` instalado, execute os arquivos a partir da raiz deste repositório:

```sh
npm install -g ait-lang
ait-lang linguagens/AIT/exemplo_1.ait
```

Para executar todos os arquivos da pasta:

```sh
for arquivo in linguagens/AIT/exemplo_*.ait linguagens/AIT/exercicio_*.ait; do
  ait-lang "$arquivo"
done
```

## Exemplos

Cada arquivo contém um comentário em Ait com o objetivo do programa.

1. `exemplo_1.ait` — imprime `Olá, Mundo!`.
2. `exemplo_2.ait` — guarda e lê o valor `42` por uma variável.
3. `exemplo_3.ait` — compara o valor `42` com `10` e seleciona um ramo com `ifte`; imprime `Maior`.
4. `exemplo_4.ait` — soma `1` dez vezes com `times`; imprime `10`.
5. `exemplo_5.ait` — define `quadrado` e calcula `5²`; imprime `25`.
6. `exemplo_6.ait` — mede o agregado `[ 1 2 3 ]`; imprime `3`.
7. `exemplo_7.ait` — calcula `7!` usando `linrec`; imprime `5040`.
8. `exemplo_8.ait` — imprime um literal de texto; não usa o módulo instável de manipulação de strings.
9. `exemplo_9.ait` — calcula `2³` com `pow`; imprime `8`.
10. `exemplo_10.ait` — ordena `[ 3 1 2 ]`; imprime `[ 1 2 3 ]`.

## Exercícios

Os arquivos `exercicio_1.ait` a `exercicio_10.ait` contêm propostas curtas como comentários `#` e uma solução executável. Cada solução usa código próprio:

1. Imprimir `Ait`.
2. Somar os valores guardados em duas variáveis; resultado `42`.
3. Testar se `5` é menor que `10`; imprimir `Abaixo do limite`.
4. Somar `2` três vezes; resultado `6`.
5. Definir `cubo` e calcular `3³`; resultado `27`.
6. Imprimir o último elemento de `[ 4 7 9 ]`; resultado `9`.
7. Calcular `5!` com `linrec`; resultado `120`.
8. Imprimir um literal de texto.
9. Subtrair `4` de `9`; resultado `5`.
10. Ordenar `[ 4 1 3 ]`; resultado `[ 1 3 4 ]`.

## Validação

Os 20 exemplos e exercícios foram executados individualmente com a CLI construída a partir do repositório oficial `ait-lang`, commit `13efd470c51dc539df33fa724ee4ba2e8e2abc14`, pacote `0.3.3`. Nesta validação, Node.js `v22.23.4` e npm `10.9.9` foram usados: `npm test` passou com 403 testes e `npm run build` concluiu sem erro. Cada arquivo desta pasta terminou com código de saída zero e produziu a saída indicada acima.

O projeto upstream é experimental. A validação acima se refere ao commit e ao ambiente registrados, e não garante compatibilidade de todas as versões futuras do runtime.
