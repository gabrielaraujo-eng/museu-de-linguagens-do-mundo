# ALGOL 60

**Linhagem:** ALGOL (International Algebraic Language), proposta em 1958
**Linguagem desta pasta:** ALGOL 60, conforme o *Revised Report on the Algorithmic Language ALGOL 60* (1963)

## Descrição

ALGOL 60 é a linguagem definida pelo relatório de 1960 e pelo relatório revisado de 1963. O documento de 1958 (ALGOL 58) é a origem da linhagem, mas não é a linguagem demonstrada aqui: os programas desta pasta seguem a gramática do relatório revisado. ALGOL 60 introduziu blocos com escopo léxico, recursão, parâmetros por nome e por valor, `if`/`then`/`else`, laços `for` com `step`/`until`/`while` e a distinção entre procedimentos e funções tipadas. A linguagem não define entrada e saída no núcleo: o relatório deixa a ligação de canais a dispositivos para a implementação.

## Arquivos

Cada tópico aparece em duas extensões, `exemplo_N.alg` e `exemplo_N.algol`, com exatamente o mesmo programa. As extensões não são prescritas pelo relatório: `.alg` é a convenção de ferramentas históricas e do tradutor usado na validação, e `.algol` é uma convenção descritiva adotada por este projeto. Manter os dois arquivos idênticos evita sugerir dialetos distintos.

### Exemplos

1. `exemplo_1` — estrutura mínima de um programa em bloco
2. `exemplo_2` — declaração e atribuição de `integer`, `real` e `Boolean`
3. `exemplo_3` — seleção com `if`, `then` e `else`
4. `exemplo_4` — laço `for` com `step` positivo e negativo
5. `exemplo_5` — procedimento com resultado e recursão
6. `exemplo_6` — vetor com limites entre colchetes e acumulação
7. `exemplo_7` — sinalização de erro com o procedimento de ambiente `fault`
8. `exemplo_8` — `string` como especificador de parâmetro formal
9. `exemplo_9` — funções matemáticas do ambiente padrão
10. `exemplo_10` — ordenação por trocas e o declarador `own`

### Exercícios

Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1` — saída em duas linhas com `outstring`/`newline`
2. `exercicio_2` — conversão de Celsius para Fahrenheit com `real`
3. `exercicio_3` — classificação de um inteiro em positivo, negativo ou zero
4. `exercicio_4` — soma dos pares de 1 a 20 com `for`
5. `exercicio_5` — procedimento com resultado que calcula potência inteira
6. `exercicio_6` — inversão de um vetor de cinco posições
7. `exercicio_7` — proteção de divisão contra divisor nulo com `fault`
8. `exercicio_8` — strings recebidas como parâmetros de procedimento
9. `exercicio_9` — hipotenusa e área com `sqrt`
10. `exercicio_10` — maior, menor e média de um vetor de seis notas

## Como executar

A implementação usada para validar esta pasta é o tradutor `jff-algol`, de Jan van Katwijk, que converte ALGOL 60 para C e chama o compilador C: <https://github.com/JvanKatwijk/algol-60-compiler>. Não existe sufixo nem comando de shell comum a todos os compiladores de ALGOL 60; os passos abaixo valem para essa implementação.

```sh
gcc -O2 -w -c runtime.c -o runtime.o && ar rcs lib_jff.a runtime.o
gcc -O2 -w -I. frontend.c -o jff-a2c -lm -DHEADER='"caminho/jff_header.h"' \
  -DOPERATOR_E='"caminho/operator_e"' -DOPERATOR_F='"caminho/operator_f"' \
  -DPRELUDE_E='"caminho/prelude_e"' -DPRELUDE_F='"caminho/prelude_f"'
gcc -O2 -w -I. jff-algol.c -o jff-algol -lm -DHEADER='"caminho/jff_header.h"' \
  -DOPERATOR_E='"caminho/operator_e"' -DOPERATOR_F='"caminho/operator_f"' \
  -DPRELUDE_E='"caminho/prelude_e"' -DPRELUDE_F='"caminho/prelude_f"' \
  -DRUNTIME='"caminho/lib_jff.a"' -DINDENT='"cat"' -DCCOMPILER='"gcc"' \
  -DACOMPILER='"caminho/jff-a2c"'

./jff-algol exemplo_1.alg
./exemplo_1
```

## Escopo e limitações documentadas

- **Entrada e saída:** `outstring`, `outinteger`, `outreal`, `newline` e `space` pertencem ao ambiente do `jff-algol` (arquivo `prelude_e`), não ao núcleo do relatório. O canal `1` é a saída padrão nessa implementação. `fault` e `stop` também são procedimentos de ambiente, usados para sinalizar e encerrar; ALGOL 60 não tem exceções capturáveis.
- **Strings:** o relatório de referência delimita strings com acento grave inicial e apóstrofo final. O `jff-algol` aceita apenas aspas duplas, e essa é a forma usada nos arquivos para que eles sejam executáveis pela implementação escolhida. Os programas evitam depender de concatenação de strings adjacentes, que o tradutor não implementa.
- **`string` não é tipo de variável:** aparece somente como especificador de parâmetros formais, como no relatório.
- **`own`:** conserva o valor entre reentradas no bloco e começa em zero na primeira entrada; não é sinônimo do `static` de C.
- **Formato numérico:** `outreal` imprime com nove casas decimais e `outinteger` imprime um espaço à direita, conforme a implementação.

## Validação executada

Os 20 programas foram traduzidos por `jff-algol` e executados após a compilação do C gerado: 20 de 20 terminaram com código 0 e produziram a saída esperada para o tópico. O processo completo está registrado no relatório de auditoria da pasta no Drive e no corpo do pull request correspondente.

## Referências

- Revised Report on the Algorithmic Language ALGOL 60: <https://dl.acm.org/doi/10.1145/366193.366201>
- Transcrição do relatório revisado: <https://www.algol60.org/reports/algol60_rr.pdf>
- Relatório revisado modificado pelo IFIP WG 2.1: <https://www.masswerk.at/algol60/modified_report.htm>
- Preliminary Report on the International Algebraic Language (1958): <https://dl.acm.org/doi/10.1145/377924.594925>
- Tradutor `jff-algol`: <https://github.com/JvanKatwijk/algol-60-compiler>
