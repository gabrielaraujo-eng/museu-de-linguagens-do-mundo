# ABC

**Período:** desenvolvida ao longo dos anos 1980; descrita e publicada em referência pública em 1987.

## Descrição

Esta pasta contém exemplos e exercícios de ABC, uma linguagem imperativa, interpretada e interativa, organizada para aprendizado progressivo. ABC funciona em um ambiente persistente: localizações, comandos e funções podem permanecer disponíveis entre interações. Por isso, alguns arquivos são pequenos *rulelists* (sequências de comandos) para inserir no ambiente, e não programas independentes de um compilador tradicional.

ABC não usa declarações convencionais de variáveis. A atribuição usa `PUT expressão IN localização`, e o sistema verifica a consistência dos tipos. Os cinco tipos da linguagem são Numbers, Texts, Compounds, Lists e Tables. A indentação após `:` delimita blocos; comentários começam com `\\` e vão até o fim da linha.

A extensão `.abc` é apenas a convenção adotada por este repositório; não foi confirmada como extensão normativa da linguagem.

## Exemplos incluídos

1. **exemplo_1.abc** — saída de texto (Olá Mundo)
2. **exemplo_2.abc** — localizações e tipos
3. **exemplo_3.abc** — alternativa com `SELECT`
4. **exemplo_4.abc** — repetição com `FOR`
5. **exemplo_5.abc** — função retornadora
6. **exemplo_6.abc** — lista e `INSERT`
7. **exemplo_7.abc** — verificação com `CHECK`
8. **exemplo_8.abc** — concatenação de textos
9. **exemplo_9.abc** — soma e atribuição
10. **exemplo_10.abc** — localização compartilhada em comando

## Exercícios incluídos

1. **exercicio_1.abc** — saída de texto
2. **exercicio_2.abc** — expressão aritmética
3. **exercicio_3.abc** — teste com `IF`
4. **exercicio_4.abc** — repetição com `FOR`
5. **exercicio_5.abc** — função de soma
6. **exercicio_6.abc** — lista
7. **exercicio_7.abc** — verificação com `CHECK`
8. **exercicio_8.abc** — concatenação
9. **exercicio_9.abc** — função matemática `root`
10. **exercicio_10.abc** — localização compartilhada em comando

## Como usar

Leia os arquivos em ordem. Cada um contém um fragmento curto que pode ser inserido no ambiente ABC; os arquivos que usam uma localização ou função já inicializada deixam essa preparação explícita. `WRITE ... /` solicita o término explícito da linha de saída.

A implementação `abc`/`abc-unix` não está instalada neste ambiente, portanto estes arquivos não foram executados aqui. A verificação realizada é estática, conferindo as formas documentadas: `SELECT` para alternativas, `HOW TO RETURN` para funções, `SHARE` apenas no início de um `HOW TO`, indentação dos blocos e inicialização das localizações usadas. Para executar os exemplos, use uma implementação ABC compatível; a implementação Unix histórica pode exigir ambiente 32-bit.
