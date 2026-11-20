# Alloy

## Descrição

Alloy é uma linguagem **declarativa de modelagem**, baseada em lógica de primeira ordem e em relações, criada no Software Design Group do MIT e mantida hoje pelo projeto AlloyTools. Um arquivo Alloy não é um programa imperativo: ele descreve estruturas (conjuntos, relações e restrições) e é analisado pelo **Alloy Analyzer**, que procura instâncias que satisfaçam o modelo ou contraexemplos para uma propriedade.

O Analyzer não executa o modelo passo a passo. Ele traduz o modelo, dentro de um escopo finito, para uma fórmula booleana e a entrega a um solucionador SAT:

- `run P` procura uma **instância** de `P` (uma estrutura concreta que satisfaça o modelo);
- `check A` procura um **contraexemplo** de `A`; se não encontra, `A` vale no escopo testado;
- `for N` limita o número de átomos por assinatura e `for N Int` fixa a largura de bits dos inteiros.

A versão atual da linguagem é a **Alloy 6**, que acrescenta assinaturas e campos mutáveis (`var`) e operadores temporais (`always`, `eventually`, `after`, `until`, `'`). A extensão de arquivo prescrita é `.als`.

## Arquivos

Todos os arquivos usam a extensão `.als` e foram validados com o Alloy 6.2.0. Cada exemplo é um módulo Alloy completo e comentado; cada exercício traz o enunciado em comentário no topo do arquivo e, em seguida, uma resolução completa.

### Exemplos

1. `exemplo_1.als` — assinatura (`sig`, `one sig`), fato e primeiro `run` com escopo
2. `exemplo_2.als` — campos relacionais e inteiros com escopo finito (`for 8 Int`)
3. `exemplo_3.als` — predicados com argumentos e chamada de predicado dentro de predicado
4. `exemplo_4.als` — quantificação (`all`, `some`, `no`, `one`, `lone`, `disj`) e cardinalidade `#`
5. `exemplo_5.als` — funções (`fun`), composição de funções e condicional como expressão
6. `exemplo_6.als` — estrutura de dados relacional: lista ligada com `lone`, `~`, `*` e `^`
7. `exemplo_7.als` — assertions, contraexemplo devolvido por `check` e inconsistência detectada por `run`
8. `exemplo_8.als` — texto sem tipo `String`: palavra como relação posição → letra com `util/ordering`
9. `exemplo_9.als` — aritmética de inteiros (`add`, `sub`, `mul`, `div`, `rem`) e estouro de escopo
10. `exemplo_10.als` — Alloy 6: `var sig`, `enum`, `always`, `after`, `eventually` e escopo `for N steps`

### Exercícios

Cada exercício é um modelo distinto, resolvido e executável, sobre o tópico correspondente:

1. `exercicio_1.als` — assinaturas, campo, transposta `~` e escopo de busca
2. `exercicio_2.als` — campos inteiros, restrição de faixa e escolha justificada do bit-width
3. `exercicio_3.als` — três predicados encadeados (aprovação, reprovação, recuperação)
4. `exercicio_4.als` — um quantificador diferente por fato, subconjunto (`sig ... in ...`) e cardinalidade
5. `exercicio_5.als` — funções compostas (`soma3`, `media3`, `maximo`, `minimo`) e verificação por `run`
6. `exercicio_6.als` — árvore binária com aciclicidade e `check` de propriedade estrutural
7. `exercicio_7.als` — `check` que falha (com contraexemplo) e modelo corrigido que passa
8. `exercicio_8.als` — texto modelado por relações e `check` de invariante entre duas palavras
9. `exercicio_9.als` — estouro em 4 bits, mesmo cálculo em 5 bits e paridade do dobro
10. `exercicio_10.als` — ordem total com `util/ordering` e `check` de totalidade e transitividade

## Como executar

A validação desta pasta usou a distribuição oficial `org.alloytools.alloy.dist.jar` (versão 6.2.0), que exige Java 17 ou superior. A interface gráfica é iniciada com `java -jar org.alloytools.alloy.dist.jar`; a linha de comando executa os comandos `run` e `check` de um módulo:

```sh
# listar os comandos do modelo
java -jar org.alloytools.alloy.dist.jar commands exemplo_1.als

# executar o primeiro comando e imprimir a solução no terminal
java -jar org.alloytools.alloy.dist.jar exec -f -o - exemplo_1.als

# executar um comando específico pelo índice ou pelo nome
java -jar org.alloytools.alloy.dist.jar exec -f -o - -c 0 exemplo_7.als
java -jar org.alloytools.alloy.dist.jar exec -f -o - -c todosAdultos exemplo_7.als
```

Sem `-c`, o `exec` roda o primeiro comando do arquivo. A opção `-o -` envia a solução para o terminal; sem ela, o resultado é gravado em um diretório com o nome do arquivo. Quando um comando não tem solução, nenhuma tabela é impressa: em `run` isso significa modelo inconsistente no escopo, e em `check` significa que não há contraexemplo.

## Escopo e limitações documentadas

- **Não há entrada/saída nem efeitos.** Alloy não imprime nada: o resultado de uma análise é uma instância (ou a ausência dela). "Olá Mundo" em Alloy é um modelo mínimo com um `run`, não uma mensagem.
- **Não há laços nem atribuição.** `all`, `some` e `no` são quantificadores sobre conjuntos, não repetição; campos são relações, não variáveis mutáveis (mutabilidade só existe com `var`, na Alloy 6).
- **Não há `String`.** Texto precisa ser modelado com assinaturas e relações, como em `exemplo_8.als` e `exercicio_8.als`.
- **Não há exceções.** Não existe `try/catch`: o análogo é um predicado insatisfazível (modelo inconsistente) ou um contraexemplo devolvido por `check`.
- **Não há comando `sort`.** Ordenação é uma relação de ordem modelada e verificada, como em `exercicio_10.als`; não há rotina de ordenação embutida.
- **Inteiros são finitos.** `for N Int` fixa a largura em bits: 4 bits cobrem -8 a 7, 5 bits cobrem -16 a 15, 8 bits cobrem -128 a 127. Valores fora do intervalo provocam estouro por aritmética modular (demonstrado em `exemplo_9.als` e `exercicio_9.als`).
- **`util/ordering` fixa o escopo exatamente.** O parâmetro do módulo é declarado `exactly`, portanto `run ... for 3` com `open util/ordering[T]` significa exatamente 3 átomos de `T`, não "até 3".
- **A análise é limitada pelo escopo.** `check` sem contraexemplo prova a propriedade apenas até o tamanho testado; não é uma prova para todos os tamanhos.

## Validação executada

Os 20 modelos foram executados com o Alloy 6.2.0 em Java 21, com cada comando analisado separadamente: **34 comandos, 0 erros de sintaxe, 0 avisos do Analyzer**. Todos os `run` encontraram instância, exceto o predicado deliberadamente contraditório de `exemplo_7.als`, e todos os `check` se comportaram como documentado (incluindo o contraexemplo esperado de `exemplo_7.als` e de `exercicio_7.als`). Os comandos e as saídas reais estão registrados em `RELATORIO.md`.

## Referências

- Site oficial do projeto Alloy: <https://alloytools.org/>
- Sobre a linguagem e sua origem no Software Design Group do MIT: <https://alloytools.org/about.html>
- Referência da linguagem (gramática, assinaturas, fatos, predicados, funções, comandos): <https://alloytools.org/spec.html>
- Documentação e distribuição da Alloy 6: <https://alloytools.org/documentation.html>
- Novidades da Alloy 6 (mutabilidade e lógica temporal): <https://alloytools.org/alloy6.html>
- Repositório oficial e requisitos de execução: <https://github.com/AlloyTools/org.alloytools.alloy>
