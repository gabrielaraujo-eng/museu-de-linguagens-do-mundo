# AMPL

**Linguagem:** AMPL, *A Mathematical Programming Language*
**Natureza:** linguagem de modelagem algébrica para problemas de otimização, não linguagem de propósito geral
**Autores:** Robert Fourer, David M. Gay e Brian W. Kernighan; projetada e implementada por volta de 1985

## Descrição

AMPL não é uma linguagem de programação de uso geral. É uma linguagem declarativa para escrever modelos de otimização na mesma forma em que eles aparecem no papel: conjuntos, parâmetros, variáveis de decisão, uma função objetivo e restrições. O modelo é separado dos dados, e a resolução é delegada a um solver externo (HiGHS, CBC, Gurobi, CPLEX, MINOS, Ipopt, entre outros). A linguagem também tem um ambiente de comandos, com `solve`, `display`, `printf`, `for` e `if`, usado para controlar a execução e emitir relatórios.

As construções centrais são:

- `set` — coleção de nomes ou de números que indexa o modelo. Conjunto não é lista genérica: a ordem só é significativa quando o conjunto é declarado `ordered`.
- `param` — dado numérico ou simbólico, escalar ou indexado (`param custo {ORIGENS, DESTINOS}`).
- `var` — variável de decisão, com domínio contínuo, `integer` ou `binary`, e limites declarados (`var x {P} >= 0, <= u[p]`).
- `maximize` / `minimize` — função objetivo, com nome, referenciável depois da resolução.
- `subject to` — restrições, opcionalmente indexadas por conjuntos.
- `data` — bloco com os valores dos parâmetros.
- `check` — condição de consistência dos dados, testada antes de chamar o solver.

## Sobre a extensão `.ampl` usada nesta pasta

A documentação oficial e o plugin de editor da AMPL adotam `.mod` para modelos, `.dat` para dados e `.run` para scripts. Esta pasta mantém a extensão `.ampl` por convenção do projeto: o comando `include` da AMPL aceita qualquer nome de arquivo, de modo que a extensão não impede a execução. Para seguir a convenção oficial, basta renomear cada arquivo para `.mod` — todos são autocontidos e trazem o próprio bloco `data`, portanto não dependem de um `.dat` separado.

## Arquivos

### Exemplos

Cada exemplo é um modelo completo, com dados, resolução e exibição do resultado.

1. `exemplo_1.ampl` — estrutura mínima de um modelo linear: `param`, `var`, `maximize`, `subject to`, `data`, `solve`, `display`
2. `exemplo_2.ampl` — conjuntos, parâmetros indexados e mix de produção
3. `exemplo_3.ampl` — variáveis com dois índices e restrições indexadas: transporte
4. `exemplo_4.ampl` — variáveis `binary`: mochila
5. `exemplo_5.ampl` — variáveis `integer`: produção em lotes indivisíveis
6. `exemplo_6.ampl` — conjunto `ordered`, `first`, `prev` e balanço de estoque multiperíodo
7. `exemplo_7.ampl` — parâmetro `symbolic` e relatório formatado com `printf` e `for`
8. `exemplo_8.ampl` — expressões, funções internas e linearização de valor absoluto
9. `exemplo_9.ampl` — validação de dados com a instrução `check`
10. `exemplo_10.ampl` — modelo não linear: ajuste por mínimos quadrados

### Exercícios

Cada exercício é um problema de modelagem distinto, completo e resolvido, com o resultado obtido registrado em comentário no fim do arquivo.

1. `exercicio_1.ampl` — mix de produção com dois recursos escassos
2. `exercicio_2.ampl` — dieta de custo mínimo com restrições nutricionais
3. `exercicio_3.ampl` — designação de tarefas com variáveis binárias
4. `exercicio_4.ampl` — seleção de projetos com orçamento e dependência lógica
5. `exercicio_5.ampl` — escalonamento de equipes em turnos circulares
6. `exercicio_6.ampl` — localização de instalações com custo fixo
7. `exercicio_7.ampl` — contratação e demissão ao longo de quatro meses
8. `exercicio_8.ampl` — espaço de prateleira e relatório por categoria
9. `exercicio_9.ampl` — mistura com verificação de consistência por `check`
10. `exercicio_10.ampl` — despacho econômico com custo quadrático

## Como executar

Com a AMPL instalada, abra o interpretador no diretório desta pasta:

```sh
ampl
```

No prompt `ampl:`, escolha um solver disponível e carregue o arquivo:

```ampl
option solver highs;
include exemplo_1.ampl;
```

Como cada arquivo já contém `solve` e `display`, a saída aparece imediatamente. Para executar um arquivo por vez em sessões separadas, use um processo novo para cada um, evitando colisão de nomes já declarados.

O fluxo clássico com arquivos separados é equivalente:

```ampl
model problema.mod;
data problema.dat;
option solver highs;
solve;
display x;
```

Sem um solver configurado, `solve` falha com a mensagem `No solver specified` — a AMPL interpreta e valida o modelo, mas não resolve. Modelos com variáveis inteiras exigem solver de programação inteira; o exemplo 10 e o exercício 10 exigem solver para objetivos quadráticos.

## Escopo e limitações documentadas

- **Comentários:** o marcador é `#` até o fim da linha, ou `/* ... */`. `--` não é comentário em AMPL; uma linha iniciada por `--` é erro de sintaxe.
- **Conjuntos não são listas:** conjuntos não têm ordem implícita nem operações de lista. Ordem só existe em conjuntos `ordered`, com `first`, `last`, `next`, `prev` e `ord`. Não há função genérica de ordenação.
- **Sem constructos de linguagem geral:** não há classes, exceções capturáveis nem bibliotecas de terceiros dentro do modelo. A validação de dados é feita com `check`; tratamento de erros do lado do cliente pertence à API (`amplpy`), não à linguagem.
- **Strings:** aparecem como valores de parâmetros `symbolic` e em comandos de saída (`print`, `printf`). Não são um tipo de variável de decisão.
- **Separação modelo/solver:** a AMPL não resolve nada por conta própria. A solução depende do solver escolhido; relatórios de "optimal" vêm do solver, não da linguagem.
- **Licença:** a distribuição usada na validação é a versão de demonstração, com limite de tamanho de problema. Os modelos desta pasta são pequenos e cabem nesse limite.

## Validação executada

Os 20 modelos foram lidos e resolvidos pela AMPL de verdade, não apenas inspecionados:

```
AMPL Version 20261109 (Linux-1, 64-bit), demo license
HiGHS 1.15.1
```

Para cada arquivo, em processo separado:

```sh
printf 'option solver highs;\ninclude exemplo_1.ampl;\nquit;\n' | ampl
```

Resultado: 20 de 20 arquivos terminaram com código 0 e o solver reportou `optimal solution` em todos. As soluções ótimas estão registradas em comentário no fim de cada arquivo e conferem com o resultado impresso na execução.

## Referências

- AMPL, *Quick Introduction*: <https://dev.ampl.com/ampl/introduction.html>
- AMPL Book (edição Python): <https://book.ampl.com/>
- *AMPL: A Modeling Language for Mathematical Programming* (livro clássico): <https://ampl.com/wp-content/uploads/BOOK.pdf>
- Capítulo 5, *Simple Sets and Indexing*: <https://ampl.com/wp-content/uploads/Chapter-5-Simple-Sets-and-Indexing-AMPL-Book.pdf>
- Capítulo 8, *Linear Programs: Variables, Objectives and Constraints*: <https://ampl.com/wp-content/uploads/Chapter-8-Linear-Programs-Variables-Objectives-and-Constraints-AMPL-Book.pdf>
- Instalação da AMPL: <https://dev.ampl.com/ampl/install.html>
- Solver HiGHS para AMPL: <https://ampl.com/products/solvers/open-source-solvers/>
