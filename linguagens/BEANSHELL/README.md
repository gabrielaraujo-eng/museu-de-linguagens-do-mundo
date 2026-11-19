# BEANSHELL

**Ano da primeira divulgação pública:** 1997. O trabalho no projeto começou antes disso. [3]

## Descrição

BeanShell é uma linguagem de scripting para Java e um interpretador de código-fonte com sintaxe semelhante à de Java, além de facilidades próprias para scripting. Pode ser usada interativamente ou embutida em aplicações Java; não é um shell de sistema operacional. [1] [2]

A JSR 274 foi uma proposta de padronização e está dormente; não é uma especificação final vigente. [4]

## Dialeto e execução

Os arquivos desta pasta são scripts BeanShell com extensão `.bsh`, escritos na sintaxe descrita pelo manual oficial. Não se declara uma versão específica: a auditoria não identificou uma versão-alvo nem um runtime BeanShell instalado para validar os scripts. As conclusões de compatibilidade são revisão estática baseada nas fontes citadas, não garantia de execução em todas as versões.

Cada arquivo é autônomo e não depende de executar os anteriores. Abra uma sessão do interpretador na pasta e carregue um arquivo por vez, por exemplo: `source("exemplo_1.bsh");`. O comando `source()` avalia o arquivo no contexto da sessão atual; para evitar estado de uma execução anterior, use uma sessão nova. [2]

## Exemplos incluídos

1. [exemplo_1.bsh](exemplo_1.bsh) — Olá, mundo
2. [exemplo_2.bsh](exemplo_2.bsh) — Variáveis e tipos
3. [exemplo_3.bsh](exemplo_3.bsh) — Condicional
4. [exemplo_4.bsh](exemplo_4.bsh) — Laço `for`
5. [exemplo_5.bsh](exemplo_5.bsh) — Definição e chamada de método
6. [exemplo_6.bsh](exemplo_6.bsh) — Lista
7. [exemplo_7.bsh](exemplo_7.bsh) — Tratamento de exceção observável
8. [exemplo_8.bsh](exemplo_8.bsh) — Concatenação de strings
9. [exemplo_9.bsh](exemplo_9.bsh) — Raiz quadrada
10. [exemplo_10.bsh](exemplo_10.bsh) — Algoritmo iterativo: fatorial

## Exercícios

Os arquivos abaixo são soluções de referência autônomas. Tente implementar cada objetivo antes de consultar o respectivo `.bsh`.

1. [exercicio_1.bsh](exercicio_1.bsh) — Exibir uma saudação.
2. [exercicio_2.bsh](exercicio_2.bsh) — Declarar um estado booleano e exibir seu valor.
3. [exercicio_3.bsh](exercicio_3.bsh) — Usar `if/else` para exibir uma mensagem conforme um estado booleano inicializado no próprio arquivo.
4. [exercicio_4.bsh](exercicio_4.bsh) — Inicializar um contador e fazer uma contagem regressiva com `while`.
5. [exercicio_5.bsh](exercicio_5.bsh) — Definir e chamar um método sem parâmetros que exiba uma mensagem.
6. [exercicio_6.bsh](exercicio_6.bsh) — Inserir um par chave/valor em um `Map` e exibir o valor recuperado.
7. [exercicio_7.bsh](exercicio_7.bsh) — Receber um `Object` em um método e tratar tanto o caso nulo quanto o não nulo.
8. [exercicio_8.bsh](exercicio_8.bsh) — Exibir o comprimento de uma string inicializada no próprio arquivo.
9. [exercicio_9.bsh](exercicio_9.bsh) — Exibir o valor absoluto de um inteiro negativo.
10. [exercicio_10.bsh](exercicio_10.bsh) — Comparar dois inteiros e exibir o maior.

## Fontes

[1]: https://beanshell.org/intro.html "BeanShell Introduction"
[2]: https://beanshell.org/manual/bshmanual.html "BeanShell User's Manual"
[3]: https://beanshell.org/manual/intro.html "BeanShell Manual: introdução e histórico do projeto"
[4]: https://jcp.org/en/jsr/detail?id=274 "JSR 274: The BeanShell Scripting Language"
