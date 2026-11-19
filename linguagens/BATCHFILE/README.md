# BATCHFILE

## Variante e escopo

Esta pasta ensina arquivos `.bat` interpretados pelo **Windows Command Processor (`cmd.exe`) moderno**, com as extensões de comando normalmente habilitadas. “BATCHFILE” é o nome desta pasta, não uma especificação normativa única: scripts batch combinam comandos do shell, diretivas de controle e, neste material, uma chamada ao utilitário `SORT`.

Os exemplos que usam `IF` com comparadores, `FOR /L`, `SET /A` e sub-rotinas dependem das extensões do CMD. Portanto, não são apresentados como sintaxe portável para o `COMMAND.COM` de versões antigas do MS-DOS nem como PowerShell. Use os arquivos `.bat` desta pasta em um prompt do Windows; cada script define os próprios valores e não depende da execução prévia de outro.

**Marco histórico relacionado:** o PC-DOS 1.0 foi lançado em agosto de 1981. Esse marco não estabelece o ano de criação de toda a categoria de arquivos batch.

## Exemplos

1. [`exemplo_1.bat`](exemplo_1.bat) — exibir uma mensagem.
2. [`exemplo_2.bat`](exemplo_2.bat) — atribuir e expandir variáveis de ambiente; os valores não têm tipos declarados.
3. [`exemplo_3.bat`](exemplo_3.bat) — comparar um valor numérico com `IF`, incluindo os casos maior, igual e menor.
4. [`exemplo_4.bat`](exemplo_4.bat) — contar de 1 a 5 com `FOR /L`.
5. [`exemplo_5.bat`](exemplo_5.bat) — chamar uma sub-rotina identificada por rótulo; isso não é uma função tipada.
6. [`exemplo_6.bat`](exemplo_6.bat) — iterar sobre um conjunto textual de valores; não demonstra uma lista ou array nativo.
7. [`exemplo_7.bat`](exemplo_7.bat) — verificar com `IF ERRORLEVEL` o código retornado por uma sub-rotina controlada.
8. [`exemplo_8.bat`](exemplo_8.bat) — atribuir e exibir um valor textual simples, sem alegar manipulação avançada de strings.
9. [`exemplo_9.bat`](exemplo_9.bat) — calcular com `SET /A`.
10. [`exemplo_10.bat`](exemplo_10.bat) — ordenar linhas com o utilitário `SORT`; isso não é uma construção da linguagem nem um algoritmo de ordenação implementado em batch.

## Exercícios resolvidos

Cada arquivo abaixo é uma solução curta, autocontida e executável do objetivo indicado, não um placeholder:

1. [`exercicio_1.bat`](exercicio_1.bat) — exibir uma saudação personalizada.
2. [`exercicio_2.bat`](exercicio_2.bat) — armazenar dois valores em variáveis e exibi-los.
3. [`exercicio_3.bat`](exercicio_3.bat) — definir o valor 10 e exibir mensagens distintas para menor, igual ou maior que 10.
4. [`exercicio_4.bat`](exercicio_4.bat) — imprimir os números de 1 a 5 usando `FOR /L`.
5. [`exercicio_5.bat`](exercicio_5.bat) — chamar uma sub-rotina que exibe uma mensagem.
6. [`exercicio_6.bat`](exercicio_6.bat) — percorrer e exibir três valores de texto com `FOR`.
7. [`exercicio_7.bat`](exercicio_7.bat) — receber um código de retorno não zero de uma sub-rotina, detectá-lo e tratá-lo sem deixar o próprio exercício terminar com erro.
8. [`exercicio_8.bat`](exercicio_8.bat) — armazenar e exibir uma frase em uma variável textual.
9. [`exercicio_9.bat`](exercicio_9.bat) — calcular 6 × 7 com `SET /A` e exibir o resultado.
10. [`exercicio_10.bat`](exercicio_10.bat) — enviar três linhas ao utilitário `SORT` e exibir a ordem resultante.

## Comentários e codificação

Use `REM` para comentários em batch; `--` não é usado como comentário nos arquivos desta pasta. Os scripts estão em UTF-8, mas a exibição de caracteres acentuados depende da configuração de codificação do console Windows.

## Referências

- [Comandos do Windows](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)
- [IF](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/if) e [FOR](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/for)
- [SET](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/set_1), [REM](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/rem) e [CALL](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/call)
- [SORT](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/sort)
- [The MS-DOS Encyclopedia: ambiente de programação e diretivas batch](https://www.pcjs.org/documents/books/mspl13/msdos/encyclopedia/section2/) e [Computer History Museum: lançamento do MS-DOS](https://computerhistory.org/blog/microsoft-ms-dos-early-source-code/)
