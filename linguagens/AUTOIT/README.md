# AUTOIT
**Linhagem:** linguagem de automação de GUI para Windows, criada por Jonathan Bennett em 1999
**Linguagem desta pasta:** AutoIt v3 (arquivos `.au3`, interpretador `AutoIt3.exe`)

## Descrição
O AutoIt nasceu em 1999 como uma ferramenta para automatizar teclado e mouse em janelas do Windows — daí o nome — e cresceu até se tornar uma linguagem de script de uso geral. A série v3, de 2004, é a que permanece em uso: sintaxe de estilo BASIC, tipagem dinâmica, variáveis prefixadas com `$`, funções nativas para janelas, processos, arquivos e registro do Windows, e criação de interfaces gráficas sem editor visual. Bibliotecas adicionais chegam por `#include <Nome.au3>`, que é uma inclusão textual resolvida na compilação do script. Um arquivo `.au3` roda pelo interpretador `AutoIt3.exe` ou é convertido em `.exe` autônomo pelo `Aut2Exe`.

A linguagem não tem função `main`: o script é executado de cima para baixo, e as funções podem ser chamadas antes de sua definição textual porque os nomes são resolvidos na compilação. Também não há exceções: o tratamento de erros é feito por valores de retorno, pela macro `@error` e pela função `SetError`, que precisam ser consultados imediatamente depois de cada chamada.

## Arquivos
Todos os scripts são programas completos e executáveis, com comentários explicativos em português.

### Exemplos
1. `exemplo_1.au3` — estrutura mínima de um script: `#include`, `ConsoleWrite`, `MsgBox` e macros
2. `exemplo_2.au3` — variáveis, escopo `Local`/`Global`/`Const` e tipos dinâmicos com `VarGetType`
3. `exemplo_3.au3` — controle de fluxo com `If`/`ElseIf`/`Else`, `Select`/`Case` e `Switch`
4. `exemplo_4.au3` — laços `For`/`Next` com `Step`, `While`/`WEnd`, `Do`/`Until`, `ExitLoop` e `ContinueLoop`
5. `exemplo_5.au3` — funções, parâmetros por valor e `ByRef`, valor padrão, `Static` e recursão
6. `exemplo_6.au3` — arrays 1D e 2D, `UBound`, `ReDim`, `StringSplit` e `_ArraySort`/`_ArrayAdd`
7. `exemplo_7.au3` — erros com `SetError`/`@error`, falha de `FileOpen`, fim de arquivo e `OnAutoItExitRegister`
8. `exemplo_8.au3` — strings: `StringLen`, `StringMid`, `StringInStr`, `StringReplace`, `StringStripWS`, `StringFormat` e expressão regular
9. `exemplo_9.au3` — matemática: `Abs`, `Int`, `Round`, `Mod`, `Sqrt`, `^`, trigonometria, `Log`/`Exp` e `Random`
10. `exemplo_10.au3` — conceito avançado: janela com `GUICreate`, botões, laço de mensagens com `GUIGetMsg` e ordenação por trocas

### Exercícios
Cada exercício é um programa resolvido e distinto, sobre o tópico do exemplo correspondente:

1. `exercicio_1.au3` — saudação em duas linhas com `ConsoleWrite` e `MsgBox`
2. `exercicio_2.au3` — tabela Celsius/Fahrenheit com função de conversão e `StringFormat`
3. `exercicio_3.au3` — classificação de inteiros em positivo, negativo ou zero e em par ou ímpar
4. `exercicio_4.au3` — soma dos pares de 1 a 20, conferida pela fórmula da progressão aritmética
5. `exercicio_5.au3` — fatorial recursivo com validação de argumento por `SetError`
6. `exercicio_6.au3` — inversão de um vetor de cinco posições por troca nas extremidades
7. `exercicio_7.au3` — divisão protegida contra divisor zero e contra argumento não numérico
8. `exercicio_8.au3` — contagem de vogais e verificação de palíndromo em strings
9. `exercicio_9.au3` — hipotenusa, área e perímetro do círculo com `Sqrt` e `Round`
10. `exercicio_10.au3` — maior, menor e média de seis notas, com contagem de notas acima da média

## Como executar
O AutoIt roda apenas no Windows. Depois de instalar o AutoIt v3, o interpretador fica em `C:\Program Files (x86)\AutoIt3\AutoIt3.exe`:

```bat
"C:\Program Files (x86)\AutoIt3\AutoIt3.exe" exemplo_1.au3
```

No editor SciTE4AutoIt3, basta abrir o arquivo e pressionar F5: a saída de `ConsoleWrite` aparece no painel de saída. Fora do editor, `ConsoleWrite` escreve na saída padrão quando o script é chamado a partir de um console.

Para gerar um executável autônomo, use o `Aut2Exe` (a opção `/console` cria um executável de console, necessário para ver a saída de `ConsoleWrite`):

```bat
"C:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2Exe.exe" /in exemplo_1.au3 /out exemplo_1.exe /console
```

O exemplo 10 abre uma janela e depende de interação: clique em "Ordenar" e depois em "Fechar".

## Escopo e limitações
- **Somente Windows:** `AutoIt3.exe` e `Aut2Exe.exe` são binários para Windows. Não existe runtime oficial para Linux ou macOS, e o Wine não é um alvo suportado. Por isso os programas desta pasta não puderam ser executados no ambiente de auditoria (Linux); a validação foi estática e está descrita abaixo.
- **Saída de texto:** `ConsoleWrite` só é visível no painel do SciTE ou em um console. `MsgBox` e as janelas de `GUICreate` exigem uma sessão interativa com desktop; em serviço ou sessão sem usuário, essas chamadas falham.
- **Sem exceções:** não há `try`/`catch`. O padrão é `SetError(código, extended, retorno)` na função que falha e leitura de `@error` pelo chamador. Como quase toda função nativa reescreve `@error`, o teste precisa ser a primeira coisa depois da chamada — os exemplos 7 e 9 e o exercício 7 mostram esse cuidado.
- **Arrays:** os índices começam em 0 e vão até `UBound() - 1`. `StringSplit` é a exceção histórica: devolve array 1-based com a contagem no elemento `[0]`, a menos que se passe `$STR_NOCOUNT`.
- **Passagem de parâmetros:** por valor, salvo `ByRef` explícito. Alterar um array dentro de uma função sem `ByRef` não afeta o array do chamador.
- **Nomes e comparação:** nomes de variáveis e de funções não diferenciam maiúsculas de minúsculas, e `$x` e `$X` são a mesma variável. Para strings, `=` ignora a caixa e `==` a diferencia.
- **Aritmética:** o operador `/` sempre produz ponto flutuante; a divisão inteira é feita com `Int()`.
- **Constantes:** nomes como `$MB_OK`, `$FO_READ`, `$STR_NOCOUNT` e `$GUI_EVENT_CLOSE` só existem se a biblioteca correspondente for incluída (`MsgBoxConstants.au3`, `FileConstants.au3`, `StringConstants.au3`, `GUIConstantsEx.au3`).
- **Codificação:** os arquivos `.au3` desta pasta são ASCII puro, sem acentos e sem BOM. O AutoIt lê arquivos sem BOM na página de código ANSI do Windows, o que corromperia acentos; manter o código-fonte em ASCII elimina essa ambiguidade. O texto acentuado aparece no `README.md`, que é Markdown em UTF-8.
- **Versão de referência:** a sintaxe usada é a da série AutoIt v3.3.x. O comentário sobre `Map` no exemplo 6 vale a partir da 3.3.16; nenhum script depende desse recurso.

## Validação executada
Não houve execução: não existe runtime de AutoIt viável no Linux usado na auditoria, e simular com Wine não produziria evidência confiável. A validação foi estática, feita pelo script `verificar.py` desta pasta, que analisa os 20 arquivos `.au3` e verifica:

- balanceamento de blocos `If`/`EndIf`, `For`/`Next`, `While`/`WEnd`, `Do`/`Until`, `Func`/`EndFunc`, `Select`/`EndSelect`, `Switch`/`EndSwitch` e `#cs`/`#ce`;
- toda variável `$nome` usada foi declarada, atribuída, recebida como parâmetro ou é constante de biblioteca incluída;
- toda função chamada existe no arquivo ou é função nativa/UDF conhecida, e as UDFs (`_ArraySort`, `_ArrayToString`, `_ArrayAdd`) têm o `#include <Array.au3>` correspondente;
- parênteses e aspas balanceados por linha, ausência de palavras-chave inválidas (`End If`, `End Func`) e de marcadores de placeholder;
- inexistência de dois arquivos com o mesmo corpo de código.

Resultado: 20 scripts analisados, 0 erros, nenhum par duplicado. O `verificar.py` é uma checagem sintática e estrutural, não um interpretador: ele não prova que cada chamada nativa recebe argumentos do tipo certo nem que a janela do exemplo 10 se comporta como esperado em tempo de execução.

## Referências
- Documentação oficial do AutoIt v3 (referência de funções): <https://www.autoitscript.com/autoit3/docs/>
- Palavras-chave da linguagem: <https://www.autoitscript.com/autoit3/docs/keywords.htm>
- Macros (`@error`, `@CRLF`, `@ScriptDir`, `@SW_SHOW`): <https://www.autoitscript.com/autoit3/docs/macros.htm>
- Tipos de dados: <https://www.autoitscript.com/autoit3/docs/intro/lang_datatypes.htm>
- Suporte a Unicode e codificação de scripts: <https://www.autoitscript.com/autoit3/docs/intro/unicode.htm>
- Site oficial e downloads: <https://www.autoitscript.com/site/autoit/>
