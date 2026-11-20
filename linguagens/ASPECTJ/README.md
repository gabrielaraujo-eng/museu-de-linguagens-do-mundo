# AspectJ
**Ano de criação:** 2001 (Xerox PARC; projeto Eclipse desde 2005)

## Descrição
AspectJ é uma extensão orientada a aspectos da linguagem Java, criada por Gregor Kiczales e colaboradores no Xerox PARC. Ela acrescenta ao Java três construções que não existem na linguagem original: *join points* (pontos bem definidos da execução, como chamadas e execuções de métodos), *pointcuts* (expressões que selecionam conjuntos de join points) e *advice* (código que roda antes, depois ou em volta desses pontos). Um **aspecto** empacota pointcuts e advice em uma unidade modular, de modo que um interesse transversal — registro em log, medição de tempo, controle de acesso, cache — fique em um só lugar em vez de espalhado pelas classes.

Além do advice dinâmico, AspectJ tem *crosscutting estático*: declarações inter-tipo que adicionam campos e métodos a classes existentes, `declare parents` para alterar a hierarquia de tipos e `declare warning`/`declare error` para produzir mensagens de compilação a partir de pointcuts. A linguagem aceita duas sintaxes equivalentes: a nativa (`aspect Nome { ... }`) e a anotada (`@Aspect`, `@Pointcut`, `@Before`, `@Around`), conhecida como estilo @AspectJ.

Os arquivos desta pasta usam a extensão `.aj` e são compilados com o compilador `ajc`, que gera bytecode Java comum e pode ser executado em qualquer JVM.

## Exemplos
Cada arquivo é autocontido: contém as classes Java de apoio e o aspecto, de modo que compila e executa sozinho.

1. `exemplo_1` — estrutura mínima: `pointcut`, advice `before` e `after` em torno do `main` ("Olá Mundo")
2. `exemplo_2` — tipos primitivos e de referência; pointcut com `target(...)` e `args(...)`; `after ... returning`
3. `exemplo_3` — `call(...)` versus `execution(...)` no mesmo método e a ordem dos join points
4. `exemplo_4` — advice `around` com `proceed(...)`: substituir o resultado e trocar argumentos
5. `exemplo_5` — tratamento de erros com `after() returning (T)` e `after() throwing (T)`
6. `exemplo_6` — contexto do join point: `this`, `target`, `args`, `thisJoinPoint` e o pointcut condicional `if(...)`
7. `exemplo_7` — recursão e laço, rastreio com `within(...)` e `cflow(...)`
8. `exemplo_8` — declaração inter-tipo: campos e métodos acrescentados a uma classe existente
9. `exemplo_9` — `declare parents`, `declare warning`, `declare error` e `declare precedence`
10. `exemplo_10` — estilo `@AspectJ` com `@Aspect`, `@Pointcut`, `@Before`, `@Around` e `@AfterReturning`

## Exercícios
Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente.

1. `exercicio_1` — contador de chamadas: quantas vezes `tic()` executou, impresso no fim do `main`
2. `exercicio_2` — cronômetro com `around`: tempo gasto por `somaAte(int)`
3. `exercicio_3` — validação de argumento: `around` lança `IllegalArgumentException` e não chama `proceed`
4. `exercicio_4` — memoização: `around` com mapa de resultados reduz as execuções de `fib(10)` de 177 para 11
5. `exercicio_5` — registro de falhas com `after() throwing`, mantendo a exceção visível ao `main`
6. `exercicio_6` — log formatado de entrada e saída de métodos, com `args(...)` e `returning`
7. `exercicio_7` — controle de acesso: só a classe autorizada abre o cofre (`call(...)` com `!within(...)`)
8. `exercicio_8` — desconto em produtos via declaração inter-tipo de campo e métodos
9. `exercicio_9` — ordenação de alunos: `declare parents` acrescenta `Comparable`/`Serializable` e um ITD fornece `compareTo`
10. `exercicio_10` — monitor de desempenho em estilo `@AspectJ`: conta execuções, alerta métodos lentos e resume no fim

## Como executar
A implementação usada para validar esta pasta é o compilador `ajc` 1.9.22.1, distribuído no `aspectjtools.jar` do projeto Eclipse AspectJ (Java 21 no ambiente de teste).

```sh
# obtenção do compilador (Maven Central)
curl -LO https://repo1.maven.org/maven2/org/aspectj/aspectjtools/1.9.22.1/aspectjtools-1.9.22.1.jar
curl -LO https://repo1.maven.org/maven2/org/aspectj/aspectjrt/1.9.22.1/aspectjrt-1.9.22.1.jar

# compilação de um exemplo (cada arquivo é autocontido)
java -cp aspectjtools-1.9.22.1.jar org.aspectj.tools.ajc.Main \
  -source 17 -target 17 -cp aspectjrt-1.9.22.1.jar -d out exemplo_7.aj

# execução (a biblioteca de runtime do AspectJ é necessária)
java -cp out:aspectjrt-1.9.22.1.jar Ex7Principal
```

O script `validate.sh` desta pasta repete o processo para os 20 arquivos, compilando cada um em um diretório separado e executando sua classe `main`.

## Escopo e limitações documentadas
- **Nível de fonte:** o `ajc` assume `-source 1.4` para arquivos `.aj` quando nada é informado, e nesse nível genéricos, `for` aprimorado e anotações são rejeitados. Os comandos acima fixam `-source 17 -target 17`; sem isso, os exemplos 9 e 10 e os exercícios 4, 9 e 10 não compilam.
- **Tipos públicos:** o `ajc` 1.9.22 aplica a regra do `javac` de que um tipo público precisa estar em arquivo de mesmo nome. Como os arquivos se chamam `exemplo_N.aj` e `exercicio_N.aj`, as classes e os aspectos são declarados sem modificador de acesso (visibilidade de pacote); a classe `main` continua executável pela JVM.
- **`proceed(...)`:** o valor devolvido tem o tipo declarado no advice `around`, não `Object`. Em um `around` que declara `int`, `proceed(...)` já é `int`; em um `around` que declara `Object`, é preciso converter o resultado.
- **Precedência:** dois advice do mesmo aspecto sobre o mesmo join point precisam de ordem determinável; se um deles for `around`, o compilador responde `circular advice precedence`. O exemplo 10 e o exercício 10 evitam a sobreposição; o exemplo 9 mostra `declare precedence` entre aspectos distintos.
- **`after ... throwing` não suprime a exceção:** ele apenas observa. Para alterar o fluxo é necessário `around` (ou `declare soft`).
- **`declare warning`/`declare error`** só se manifestam quando o pointcut casa com algum join point do código compilado; o `declare error` do exemplo 9 aponta para uma API que não é usada no arquivo e, por isso, não interrompe a compilação.
- **Estilo @AspectJ:** exige `aspectjrt.jar` no classpath de compilação e de execução; o `ajc` faz o entrelaçamento (*weaving*) em tempo de compilação, sem `aop.xml`.

## Validação executada
Os 20 programas foram compilados com `ajc` 1.9.22.1 e executados na JVM 21: 20 de 20 compilaram e terminaram com código de saída 0, produzindo a saída esperada para o tópico. O exemplo 9 e o exercício 9 emitem, como pretendido, os avisos de `declare warning` durante a compilação. Comandos e resultados completos estão em `RELATORIO.md`.

## Referências
- AspectJ Programming Guide (Eclipse Foundation): <https://eclipse.dev/aspectj/doc/released/progguide/>
- Semântica dos pointcuts: <https://eclipse.dev/aspectj/doc/released/progguide/semantics-pointcuts.html>
- Semântica do advice: <https://eclipse.dev/aspectj/doc/released/progguide/semantics-advice.html>
- Declarações inter-tipo: <https://eclipse.dev/aspectj/doc/released/progguide/semantics-interType.html>
- Página do projeto: <https://eclipse.dev/aspectj/>
- Código-fonte e versões: <https://github.com/eclipse-aspectj/aspectj/releases>
- Kiczales, G. et al. *An Overview of AspectJ*. ECOOP 2001: <https://doi.org/10.1007/3-540-45337-7_18>
