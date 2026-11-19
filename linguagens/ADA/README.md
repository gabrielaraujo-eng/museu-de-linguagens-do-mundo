# Ada

**Ano de criação:** 1983

## Descrição

Ada é uma linguagem de programação compilada, de tipagem forte, com suporte a exceções, tipos derivados e concorrência. Esta pasta apresenta exemplos progressivos de sintaxe Ada, incluindo procedimentos executáveis e tarefas. SPARK é um subconjunto separado de Ada e não é usado como sinônimo aqui.

## Convenção de arquivos

Os exemplos são unidades de programa completas. Cada procedimento tem uma unidade com o mesmo nome do arquivo, sem distinção de maiúsculas e minúsculas: por exemplo, `exemplo_1.adb` contém `procedure Exemplo_1`. A extensão `.adb` é a convenção GNAT para corpos de procedimentos, funções e pacotes; `.ads` é usada para especificações separadas, que não são necessárias nestes exemplos.

## Exemplos

1. `exemplo_1.adb` — Olá, mundo
2. `exemplo_2.adb` — Variáveis e tipos
3. `exemplo_3.adb` — Controle de fluxo
4. `exemplo_4.adb` — Laços e saída de inteiros
5. `exemplo_5.adb` — Função local
6. `exemplo_6.adb` — Vetores
7. `exemplo_7.adb` — Tratamento de exceções
8. `exemplo_8.adb` — Concatenação de strings
9. `exemplo_9.adb` — Operações aritméticas
10. `exemplo_10.adb` — Tipo de tarefa e rendezvous

## Exercícios

Os dez `exercicio_*.adb` repetem e ampliam esses conceitos: procedimentos, aritmética, condicionais, laços, funções, arrays, blocos de exceção, strings, `Sqrt` qualificado e tarefas. Nenhum item é um fragmento isolado; declarações ficam na parte declarativa e comandos ficam entre `begin` e `end`.

## Como validar

Com GNAT instalado, valide um programa completo com: `gnatmake -gnat2022 linguagens/ADA/exercicio_2.adb`. Para uma checagem sem gerar objeto, use `gcc -c -gnat2022 -gnatc linguagens/ADA/exercicio_2.adb`; o `gcc` só é uma validação Ada quando inclui o frontend GNAT e essas opções. `gcc -c` genérico, sem GNAT, não comprova sintaxe Ada.

Neste ambiente de auditoria, `gnatmake`, `gnat` e `gprbuild` não estão instalados, e o GCC não possui `gnat1`; portanto os fontes foram verificados estaticamente quanto a nomes, extensões, estrutura de unidades e imports, sem alegar compilação ou execução.
