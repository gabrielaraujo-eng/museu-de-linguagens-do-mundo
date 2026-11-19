# Beef

Esta pasta reúne exemplos pequenos e exercícios de referência da linguagem **Beef**. O ano de criação foi omitido porque a auditoria não encontrou uma fonte primária que o confirme.

## Convenção e uso

Os arquivos-fonte usam a extensão `.bf`, atestada no repositório e nas orientações oficiais dos mantenedores. Os antigos pares `.beef` foram consolidados nesta convenção; mantenha apenas `.bf` para evitar duas versões concorrentes do mesmo material. Cada exemplo abaixo é apresentado como um programa de console com `public static int Main()` e retorno `0`; os exercícios `.bf` são soluções de referência para as tarefas descritas aqui.

A pasta não contém um workspace de compilação. Consulte as instruções do projeto Beef para criar ou abrir um workspace compatível antes de compilar os arquivos.

## Exemplos

1. [exemplo_1.bf](./exemplo_1.bf) — imprime uma saudação.
2. [exemplo_2.bf](./exemplo_2.bf) — declara e exibe um inteiro e uma string.
3. [exemplo_3.bf](./exemplo_3.bf) — testa uma condição com `if`.
4. [exemplo_4.bf](./exemplo_4.bf) — percorre uma sequência com `for`.
5. [exemplo_5.bf](./exemplo_5.bf) — define e chama um método expression-bodied.
6. [exemplo_6.bf](./exemplo_6.bf) — cria uma `List<int>`, adiciona elementos e lê um deles.
7. [exemplo_7.bf](./exemplo_7.bf) — retorna e trata `Result<uint>` com os casos `.Ok` e `.Err`; Beef não usa exceções ao estilo C#.
8. [exemplo_8.bf](./exemplo_8.bf) — cria uma string com `scope` e a exibe.
9. [exemplo_9.bf](./exemplo_9.bf) — calcula e exibe a raiz quadrada com `Math.Sqrt`.
10. [exemplo_10.bf](./exemplo_10.bf) — declara e usa um alias de tipo com `typealias`.

## Exercícios e objetivos

Os arquivos [exercicio_1.bf](./exercicio_1.bf) a [exercicio_10.bf](./exercicio_10.bf) contêm implementações de referência distintas; não são cópias de um único Hello World. Os objetivos são:

1. [exercicio_1.bf](./exercicio_1.bf) — Exibir uma saudação em Beef.
2. [exercicio_2.bf](./exercicio_2.bf) — Usar uma variável booleana para escolher entre duas mensagens.
3. [exercicio_3.bf](./exercicio_3.bf) — Selecionar uma mensagem com `switch` e um caso padrão.
4. [exercicio_4.bf](./exercicio_4.bf) — Fazer uma contagem regressiva com `while`.
5. [exercicio_5.bf](./exercicio_5.bf) — Definir um método auxiliar, chamá-lo e observar seu efeito.
6. [exercicio_6.bf](./exercicio_6.bf) — Inicializar um array fixo de inteiros e acessar seus elementos.
7. [exercicio_7.bf](./exercicio_7.bf) — Tratar os dois resultados de uma operação com `Result<uint>`.
8. [exercicio_8.bf](./exercicio_8.bf) — Declarar uma string e exibir seu comprimento.
9. [exercicio_9.bf](./exercicio_9.bf) — Calcular o quadrado de um inteiro usando operadores aritméticos. A chamada `Math.Abs` do fragmento anterior não foi mantida porque sua assinatura não foi confirmada pela auditoria.
10. [exercicio_10.bf](./exercicio_10.bf) — Declarar um tipo e acrescentar a ele um método por meio de `extension`.

## Limites de validação

Não há compilador Beef nem workspace Beef disponível no ambiente utilizado para esta revisão. Os arquivos foram revisados estaticamente, mas não se afirma que tenham sido compilados ou executados. A forma de `Result<T>` no exemplo 7 segue o padrão documentado oficialmente; ainda assim, a compilação deve ser confirmada em um workspace Beef.

## Referências oficiais

- [Guia de tratamento de erros](https://www.beeflang.org/docs/language-guide/errors/)
- [Guia de statements](https://www.beeflang.org/docs/language-guide/statements/)
- [Guia de tipos de dados](https://www.beeflang.org/docs/language-guide/datatypes/)
- [Guia de extensões de tipos](https://www.beeflang.org/docs/language-guide/datatypes/extensions/)
- [Guia de strings](https://www.beeflang.org/docs/language-guide/strings/)
- [Guia de expressões, alocação e arrays](https://www.beeflang.org/docs/language-guide/expressions/)
- [Repositório oficial BeefyTech](https://github.com/beefytech/Beef)
- [Exemplo-fonte `Program.bf` do projeto](https://raw.githubusercontent.com/beefytech/Beef/master/BeefTools/BeefCon/src/Program.bf)
- [Orientações dos mantenedores sobre arquivos-fonte](https://github.com/beefytech/Beef/blob/master/AGENTS.md)
