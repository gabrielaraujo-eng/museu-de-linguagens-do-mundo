# Apex
**Linhagem:** linguagens de plataforma corporativa, derivada da sintaxe de Java e C#
**Linguagem desta pasta:** Apex, a linguagem proprietária da Salesforce, apresentada na prévia de 2006 e disponível em produção a partir de 2007
## Descrição
Apex é a linguagem de programação da plataforma Salesforce (Force.com). É fortemente tipada, orientada a objetos, com sintaxe semelhante à de Java e C#, e executa exclusivamente dentro da plataforma: o código é compilado nos servidores da Salesforce e roda em um ambiente multilocatário com limites de recursos impostos por transação, os *governor limits*. Duas características distinguem Apex de uma linguagem de uso geral: instruções de manipulação de dados (DML: `insert`, `update`, `delete`, `upsert`) e consultas SOQL escritas entre colchetes fazem parte da própria linguagem, e todo código de produção precisa de testes unitários anotados com `@isTest` para ser implantado.

Não confundir com o Oracle APEX (Application Express), produto homônimo e sem relação: o Apex desta pasta é o da Salesforce, e sua extensão de arquivo é `.cls`, a mesma usada no Metadata API para a classe Apex.
## Arquivos
Cada arquivo é uma classe Apex completa, e o nome do arquivo é igual ao nome da classe, exigência do Metadata API. Todos os exemplos e exercícios expõem um método `public static void executar()`, que é o ponto de entrada chamado pela janela *Execute Anonymous*; a única exceção é `exemplo_10`, que é uma classe de teste e por isso só roda pelo executor de testes.
### Exemplos
1. `exemplo_1` — estrutura mínima de uma classe e saída com `System.debug`
2. `exemplo_2` — `Integer`, `Long`, `Decimal`, `Double`, `String`, `Boolean`, `Date` e conversões
3. `exemplo_3` — `if`/`else if`/`else`, operador ternário e `switch on` com `when`
4. `exemplo_4` — `for` com contador, `for`-each, `while`, `do-while`, `break` e `continue`
5. `exemplo_5` — métodos estáticos, sobrecarga e recursão
6. `exemplo_6` — `List`, `Set` e `Map`, inclusive aninhados
7. `exemplo_7` — `try`/`catch`/`finally`, exceção própria e `MathException`/`DmlException`
8. `exemplo_8` — métodos de `String` (imutáveis) e percurso caractere a caractere
9. `exemplo_9` — `Math` e precisão de `Decimal` com `setScale` e `divide`
10. `exemplo_10` — DML, SOQL e classe de teste com `@isTest` e `Test.startTest()`
### Exercícios
Cada exercício é uma classe completa, resolvida e distinta, sobre o tópico correspondente:
1. `exercicio_1` — saudação personalizada, com tratamento de nome nulo ou em branco
2. `exercicio_2` — conversão de Celsius para Fahrenheit com `Decimal` e uma casa decimal
3. `exercicio_3` — classificação de notas com validação de faixa
4. `exercicio_4` — soma dos pares de 1 a 100 com `for` e contagem de ímpares com `while`
5. `exercicio_5` — potência inteira nas versões recursiva e iterativa
6. `exercicio_6` — média, maior, menor e valores distintos de uma lista de notas
7. `exercicio_7` — divisão protegida por exceção própria
8. `exercicio_8` — contagem de vogais e inversão de uma string
9. `exercicio_9` — hipotenusa, área do círculo e diferença absoluta
10. `exercicio_10` — ordenação por seleção e busca binária em `List<Integer>`
## Como executar
Apex não tem runtime local: é preciso uma org Salesforce, por exemplo uma Developer Edition gratuita em <https://developer.salesforce.com/signup>. Com a org aberta no Developer Console:

1. `File > New > Apex Class`, informe o nome sem extensão (por exemplo `exemplo_1`) e cole o conteúdo do arquivo.
2. `Debug > Open Execute Anonymous Window`, escreva a chamada e execute:

```apex
exemplo_1.executar();
```

O resultado aparece em `Debug > Open Log`, na aba de log. O log só é gerado com a coleta de depuração ativa para o usuário.

Com a CLI `sf` (Salesforce CLI, versão 2), a partir de um projeto criado com `sf project generate`:

```sh
# publica as classes na org (o arquivo precisa estar em force-app/main/default/classes)
sf project deploy start --source-dir force-app/main/default/classes --target-org minha-org

# executa comandos avulsos (o arquivo contém apenas a chamada, sem a classe)
sf apex run --file anonimo.apex --target-org minha-org

# executa a classe de teste do exemplo_10
sf apex run test --class-names exemplo_10 --target-org minha-org --wait 10
```

Para o `exemplo_10` não existe chamada em Execute Anonymous: classes anotadas com `@isTest` só podem ser invocadas por um executor de testes.
## Escopo e limitações documentadas
- **Não há execução fora da plataforma.** Apex é compilado e executado nos servidores da Salesforce; não existe compilador independente, e o código depende dos metadados da org (objetos, campos, permissões). Os arquivos desta pasta não podem ser "rodados" como um programa em C ou Python.
- **DML e SOQL exigem org e dados.** `exemplo_7` executa um `insert` de `Account` sem `Name` para provocar `DmlException`, e `exemplo_10` cria e consulta contas. Sem uma org com os objetos padrão `Account`, esses trechos não têm onde rodar. Os demais arquivos usam apenas `System.debug` e tipos da linguagem.
- **Testes e cobertura.** `exemplo_10` é uma classe de teste: usa `Test.startTest()`/`Test.stopTest()`, `System.assert` e `Database.insert(lista, false)`, e não conta no limite de 6 MB de código da org. Implantar código em produção exige cobertura mínima de 75% na org.
- **Governor limits.** Cada transação tem limites, por exemplo 100 consultas SOQL síncronas, 150 instruções DML e 6 MB de heap. Os exemplos são pequenos de propósito e não chegam perto desses limites.
- **Nomes de classe.** `exemplo_1`, `exercicio_7` e semelhantes são identificadores legais em Apex, que é insensível a maiúsculas e aceita sublinhado, mas fogem da convenção `PascalCase` usada no mercado. Foram mantidos para coincidir com os nomes de arquivo do museu, já que o Metadata API exige que o nome da classe seja igual ao do arquivo.
- **`System.debug`** grava no log de depuração, não na saída padrão; não há `print`/`println` em Apex.
- **Sem entrada de dados interativa.** Apex não lê da entrada padrão; dados vêm de SOQL, de chamadas externas ou de parâmetros de método, e por isso todos os exemplos recebem valores literais.
## Validação executada
Não houve compilação em org Salesforce, que é a única validação definitiva de Apex. O que foi executado: análise sintática dos 20 arquivos `.cls` com o parser ANTLR `@apexdevtools/apex-parser` 5.3.0 (`compilationUnit()` para cada arquivo), com 20 de 20 arquivos sem erro sintático; e uma checagem estrutural própria (nome da classe igual ao do arquivo, chaves e parênteses balanceados, presença de `executar()` ou de método `@isTest`, ausência de placeholders e de exercícios duplicados). O parser foi testado com arquivos inválidos de controle, para confirmar que ele de fato acusa erro. A verificação semântica de tipos, a resolução de sobrecarga e a execução dependem de uma org e não foram realizadas. Detalhes em `RELATORIO.md`.
## Referências
- Apex Developer Guide: <https://developer.salesforce.com/docs/platform/apex-dev/references/apex-dev/>
- Instrução `switch`: <https://developer.salesforce.com/docs/platform/apex-dev/references/apex-dev/langcon-apex-switch.html>
- DML, inserção e atualização: <https://developer.salesforce.com/docs/platform/apex-dev/references/apex-dev/langcon-apex-dml-examples-insert-update.html>
- SOQL e SOSL em Apex: <https://developer.salesforce.com/docs/platform/apex-dev/references/apex-dev/langcon-apex-soql.html>
- Anotação `@IsTest`: <https://developer.salesforce.com/docs/platform/apex-dev/references/apex-dev/apex-classes-annotation-istest.html>
- `Test.startTest` e `Test.stopTest`: <https://developer.salesforce.com/docs/platform/apex-dev/references/apex-dev/apex-testing-tools-start-stop-test.html>
- Parser de Apex usado na verificação: <https://github.com/apex-dev-tools/apex-parser>
