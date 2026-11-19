# ACTION!

**Ano de criação:** 1983

## Sobre a linguagem

ACTION! é uma linguagem procedural compilada, criada por Clinton Parker e lançada pela OSS em 1983 para computadores Atari de 8 bits com processador 6502. Os arquivos-fonte usam normalmente a extensão `.ACT` (ou `.act` em sistemas que diferenciam maiúsculas e minúsculas). Um compilador como o `actionc` gera um executável Atari em formato XEX/load; o resultado é executado em um Atari ou emulador, não como um programa nativo genérico do sistema hospedeiro.

A linguagem tem tipos como `BYTE`, `INT`, `CARD` e `CHAR`, arrays indexados com parênteses (`dados(i)`) e inicializadores entre colchetes em declarações (`BYTE n=[0]`). `PrintE`, `PrintBE` e `Poke` são rotinas da biblioteca/runtime ACTION!, não palavras reservadas de uma linguagem moderna. Strings ACTION! têm representação própria (contada); não devem ser tratadas como strings C terminadas em NUL sem consultar o layout da implementação.

ACTION! não oferece `try/catch` ou `TRAP` como tratamento de exceções. O exemplo 7 demonstra verificação explícita de uma condição antes de executar a operação; erros também podem ser reportados pelas rotinas do runtime.

## Exemplos incluídos

1. **exemplo_1.act** — Olá Mundo
2. **exemplo_2.act** — variáveis e inicializadores
3. **exemplo_3.act** — condição `IF ... THEN ... FI`
4. **exemplo_4.act** — laço `FOR ... TO ... DO ... OD`
5. **exemplo_5.act** — procedimento com parâmetros
6. **exemplo_6.act** — declaração e acesso a array
7. **exemplo_7.act** — verificação explícita de erro
8. **exemplo_8.act** — string/array de caracteres
9. **exemplo_9.act** — expressão aritmética
10. **exemplo_10.act** — módulo nomeado

Os exercícios reforçam os mesmos conceitos: tipos, igualdade, incremento, funções, arrays, condições, indexação e resto (`MOD`).

## Como validar

A validação completa depende de um compilador ACTION! e do runtime/biblioteca para Atari. O `actionc` documenta, por exemplo, a compilação em modo de compatibilidade para um arquivo XEX e uma listagem ASM:

```sh
cargo run --bin actionc -- exemplo_1.act \
  --mode compatibility --output build/exemplo_1.xex \
  --listing build/exemplo_1.asm
```

Para executar em emulador, é necessário também o fluxo `actionc-run` e um emulador Atari compatível; a geração de ATR não equivale à execução no host. Neste repositório, os arquivos podem ser revisados estaticamente quando essas ferramentas não estiverem instaladas.
