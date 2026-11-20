# Apache Ant

**Linhagem:** ferramenta de build baseada em Java, derivada do projeto Jakarta da Apache Software Foundation
**Ferramenta desta pasta:** Apache Ant 1.10.14, com buildfiles XML

## Descrição

Apache Ant é uma ferramenta de automação de build escrita em Java: em vez de compilar código, ela lê um arquivo XML (o *buildfile*) e executa as tarefas descritas nele. O buildfile tem um elemento `<project>` com `name`, `default` e `basedir`, e dentro dele um ou mais `<target>`, cada um agrupando tarefas como `<mkdir>`, `<javac>`, `<jar>`, `<copy>`, `<zip>` e `<exec>`. Ant nasceu em 2000 como alternativa ao `make`, justamente para não depender da sintaxe de shell do sistema: os alvos são nomeados, declaram dependências em `depends` e são executados uma única vez por build, mesmo que vários alvos os requisitem.

A linguagem de build é declarativa e não é uma linguagem de programação de uso geral. Não existem laços, funções, aritmética nem variáveis mutáveis: propriedades são imutáveis (a primeira definição vence) e a repetição é expressa por coleções de recursos, como `<fileset>` e `<path>`. Os exemplos desta pasta mostram como resolver, com os recursos nativos do Ant, os mesmos tópicos que outras pastas do museu resolvem com `if`, `for` e funções.

## Arquivos

Todos os arquivos são buildfiles XML independentes, autossuficientes: cada um cria no disco os arquivos de que precisa, dentro do diretório em que o Ant é executado. Os nomes `exemplo_N.xml` e `exercicio_N.xml` seguem a convenção da pasta; o Ant não exige nenhuma extensão específica, e o nome tradicional é `build.xml`.

### Exemplos

1. `exemplo_1` — estrutura mínima: `<project>`, alvo padrão, `<echo>` e propriedades embutidas do Ant
2. `exemplo_2` — propriedades: imutabilidade, `location`, valor composto, ambiente e sobrescrita por `-D`
3. `exemplo_3` — `<condition>` com `equals`, `isset` e `and`, `<tstamp>` e criação de diretórios com `<mkdir>`
4. `exemplo_4` — repetição sem laço: um `<fileset>` alimenta `<copy>` e `<delete>` para cada arquivo
5. `exemplo_5` — blocos reutilizáveis com `<macrodef>`, incluindo atributo com valor padrão
6. `exemplo_6` — coleções de dados: `<fileset>`, `<path>` com `refid` e `<pathconvert>`
7. `exemplo_7` — validação: `<available>`, `<antversion>`, `<fail>` com condição aninhada e alvos `if`/`unless`
8. `exemplo_8` — texto: `<replace>` de tokens, `<loadfile>`, `<contains>` e `<matches>`
9. `exemplo_9` — medidas: `<length>` com `mode="all"`, `<resourcecount>` e comparação numérica em condição
10. `exemplo_10` — pipeline completo: `<javac>`, `<jar>` com manifesto, `<zip>` e `<exec>`

### Exercícios

Cada exercício é um buildfile completo e distinto, resolvido sobre o tópico correspondente:

1. `exercicio_1` — dois alvos, alvo padrão e impressão dos dados do projeto
2. `exercicio_2` — propriedades com valor padrão sobrescrevível por `-D` e arquivo de identificação gerado
3. `exercicio_3` — controle de fluxo com `if` e `unless` sobre uma propriedade derivada de `<istrue>`
4. `exercicio_4` — lote de quatro capítulos copiado por `<fileset>` e conferido com `<resourcecount>`
5. `exercicio_5` — macro de log com três atributos, chamada três vezes com níveis diferentes
6. `exercicio_6` — pacote `<zip>` com apenas os `.md` de uma pasta, mais listagem por `<pathconvert>`
7. `exercicio_7` — pré-requisito verificado com `<available>` e `<fail>`, mais um alvo de falha proposital
8. `exercicio_8` — cópia com `<filterset>` substituindo marcadores `@TOKEN@` e conferência do resultado
9. `exercicio_9` — validação de comprimento com `<length>`, contagem de arquivos e soma de bytes
10. `exercicio_10` — projeto Java com duas classes, jar com manifesto, documentação copiada, zip e execução

## Como executar

É necessário um JDK (para as tarefas de compilação) e o Apache Ant. No Debian e no Ubuntu:

```sh
sudo apt-get install -y ant default-jdk
ant -version
```

Cada arquivo é executado individualmente, a partir do diretório em que se deseja criar as pastas de trabalho:

```sh
ant -f exemplo_1.xml          # executa o alvo padrão
ant -f exemplo_1.xml -p       # lista os alvos e suas descrições
ant -f exemplo_1.xml ajuda    # executa um alvo específico
ant -f exercicio_3.xml -Ddetalhado=true   # define uma propriedade pela linha de comando
```

Alvos auxiliares de limpeza, presentes em quase todos os arquivos, apagam as pastas criadas pelo build:

```sh
ant -f exemplo_10.xml limpar
```

## Escopo e limitações documentadas

- **Sem laços:** não há `for` nem `while`. A repetição vem de coleções (`<fileset>`, `<dirset>`, `<filelist>`) aplicadas por tarefas de conjunto. Laços explícitos exigiriam a biblioteca externa ant-contrib (`<for>`), que não faz parte do núcleo e não é usada nesta pasta.
- **Sem funções:** o equivalente é `<macrodef>`, com parâmetros declarados em `<attribute>` e referenciados como `@{nome}`; propriedades continuam sendo `${nome}`.
- **Sem aritmética:** não há soma nem comparação entre propriedades. Medidas vêm de `<length>` e `<resourcecount>`, e a comparação é sempre contra um número fixo (`when="greater"`, `when="less"`, `count="4"`).
- **Propriedades imutáveis:** a primeira definição vence. Valores passados com `-D` têm precedência sobre os definidos no buildfile.
- **`if` e `unless` testam existência:** os atributos dos alvos verificam se a propriedade está *definida*, não se o valor é verdadeiro. Por isso os arquivos usam `<condition>` sem `value` para criar propriedades que só existem quando o teste é verdadeiro, e `<istrue>` quando o valor textual precisa ser interpretado.
- **`<length>`:** o atributo `mode` aceita `all` (soma o tamanho de todos os recursos) e `each` (um valor por recurso, exigindo `property` com `%`); não existe `sum` nesta versão. `mode="all"` é o que soma bytes de um `<fileset>`.
- **Falhas:** Ant não tem exceções capturáveis. A falha é uma `BuildException`, gerada por `<fail>` ou por qualquer tarefa com `failonerror="true"`; o build para e retorna código diferente de zero.
- **Autossuficiência:** os arquivos geram seus próprios fontes e dados com `<echo file="...">`, para que possam ser executados em qualquer diretório vazio.

## Validação executada

Os 20 buildfiles foram executados com Apache Ant 1.10.14 sobre OpenJDK 21.0.13.1, cada um em um diretório temporário isolado, com dois comandos por arquivo: `ant -f build.xml -p` (listagem de alvos) e `ant -f build.xml` (execução do alvo padrão). Resultado: 20 de 20 bem formados, 20 de 20 com listagem de alvos correta e 20 de 20 com build bem-sucedido, incluindo a compilação Java e a execução das classes em `exemplo_10` e `exercicio_10`. Os caminhos de falha também foram exercitados: `ant -f exercicio_7.xml simular-falha`, `ant -f exemplo_7.xml falhar-de-proposito` e `ant -f exercicio_9.xml -Didentificador=ant` terminam com `BUILD FAILED` e a mensagem esperada.

## Referências

- Manual do Apache Ant: <https://ant.apache.org/manual/>
- Escrevendo um buildfile (`project`, `target`, propriedades, `path`): <https://ant.apache.org/manual/using.html>
- Lista de tarefas do núcleo: <https://ant.apache.org/manual/tasklist.html>
- Condições (`condition`, `equals`, `isset`, `istrue`, `available`, `length`, `resourcecount`): <https://ant.apache.org/manual/Tasks/conditions.html>
- Tarefa `length`: <https://ant.apache.org/manual/Tasks/length.html>
- Tarefa `macrodef`: <https://ant.apache.org/manual/Tasks/macrodef.html>
- Tarefa `exec`: <https://ant.apache.org/manual/Tasks/exec.html>
