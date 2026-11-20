# AutoHotkey v2
**Linhagem:** AutoHotkey, linguagem de script para automação de desktop no Windows, derivada do AutoIt v2
**Linguagem desta pasta:** AutoHotkey v2, na forma definida pela documentação oficial da série 2.0
## Descrição
AutoHotkey é uma linguagem de script interpretada, criada para automatizar a interface do Windows: registrar atalhos de teclado e mouse (hotkeys), expandir abreviações de texto (hotstrings), enviar teclas para outras janelas, manipular janelas e processos e rodar qualquer código de apoio em uma linguagem de propósito geral. A primeira versão pública é de 2003; o README anterior desta pasta indicava 2002, data do AutoIt v2 que serviu de base. A série 2.0 tornou-se estável em 20 de dezembro de 2022 e é a linguagem usada em todos os arquivos desta pasta.

A diferença entre v1 e v2 não é cosmética: v2 exige parênteses nas chamadas de função (`MsgBox("texto")` em vez de `MsgBox, texto`), removeu a vírgula dos comandos (`Loop 5`, não `Loop, 5`), eliminou variáveis com `%` no nome (`%var%` deixa de ser referência indireta) e substituiu as variáveis de saída dos comandos por valores de retorno (`StringUpper(s)` devolve a string convertida, em vez de escrever em uma variável). Os arquivos aqui usam exclusivamente a sintaxe v2 e começam com `#Requires AutoHotkey v2.0`, diretiva que impede que um interpretador v1 tente executá-los.
## Arquivos
Todos os arquivos têm a extensão `.ahk`, a única reconhecida pelo interpretador do AutoHotkey. Cada exemplo e cada exercício é um script completo e independente: pode ser executado sozinho, sem imports nem bibliotecas externas.
### Exemplos
1. `exemplo_1` — estrutura mínima do script, `MsgBox` e valor de retorno de uma caixa de diálogo
2. `exemplo_2` — variáveis sem declaração, tipos String/Integer/Float, conversões e variáveis `A_`
3. `exemplo_3` — `if`/`else if`/`else`, operador ternário, operadores lógicos e `InputBox`
4. `exemplo_4` — `Loop` com e sem contagem, `while`, `for` em Array e em Map, `break` e `continue`
5. `exemplo_5` — funções com valores padrão, parâmetro variádico, passagem por referência e recursão
6. `exemplo_6` — `Array` e `Map`: inserção, remoção, contagem e iteração
7. `exemplo_7` — `try`/`catch`/`finally`, exceção personalizada derivada de `Error` e `throw`
8. `exemplo_8` — `StrLen`, `Trim`, `SubStr`, `InStr`, `StrReplace`, `StrSplit`, `StringUpper` e `Format`
9. `exemplo_9` — operadores aritméticos, `**`, `Mod`, `Sqrt`, `Round`, `Floor`, `Ceil`, Bhaskara e juros compostos
10. `exemplo_10` — classe com `__New` e método, ordenação por trocas, hotkey `^j`, hotkey `^!d` e hotstrings
### Exercícios
Cada exercício é um programa completo e resolvido, distinto dos demais:
1. `exercicio_1` — duas linhas de saída com concatenação e escape `` `n ``
2. `exercicio_2` — conversão de Celsius para Fahrenheit com `InputBox` e validação de entrada
3. `exercicio_3` — classificação de um inteiro em positivo, negativo ou zero, e par ou ímpar
4. `exercicio_4` — soma dos números pares de 1 a 20 com `Loop` e `continue`, conferida com `while`
5. `exercicio_5` — potência inteira por função recursiva, comparada ao operador `**`
6. `exercicio_6` — inversão de um Array de cinco posições sem alterar o original
7. `exercicio_7` — divisão protegida contra divisor zero com `throw ValueError` e `try`/`catch`
8. `exercicio_8` — contagem de vogais e palavras, com `Map` usado como contador de frequência
9. `exercicio_9` — média, maior, menor e quantidade de notas acima da média
10. `exercicio_10` — agenda em `Map` com consulta, inserção, remoção e listagem
## Como executar
AutoHotkey é exclusivo do Windows (Windows 7 ou superior, segundo a documentação oficial). Não há interpretador oficial para Linux ou macOS, e nenhuma das alternativas de terceiros implementa a linguagem v2 de forma completa. O procedimento na máquina Windows é:

```bat
:: instalar o AutoHotkey v2 pelo instalador oficial (autohotkey.com)
:: executar um script da pasta
AutoHotkey64.exe exemplo_1.ahk
```

Também é possível dar duplo clique no arquivo `.ahk` depois da instalação. Scripts com hotkeys permanecem ativos na bandeja do sistema até serem encerrados pelo menu do ícone; scripts que só mostram caixas de diálogo terminam ao fechar a última janela. Para verificar a versão do interpretador instalado, use `AutoHotkey64.exe /ErrorStdOut /validate` ou consulte o item "About" no menu do ícone da bandeja.

Como os scripts desta pasta abrem caixas de diálogo modais (`MsgBox`, `InputBox`), a execução precisa ser interativa: não há saída em console, e a captura de texto para comparação automática exigiria reescrever as saídas com `FileAppend` ou `OutputDebug`.
## Escopo e limitações documentadas
- **Somente Windows:** o interpretador depende de APIs do Windows (Win32, COM, hooks de teclado). Este repositório é mantido em Linux, portanto os arquivos não puderam ser executados.
- **Hotkeys e hotstrings exigem sessão gráfica:** `^j`, `^!d` e as expansões de texto só funcionam com um desktop ativo; em execução remota sem sessão interativa elas não disparam.
- **Saída:** `MsgBox` e `InputBox` são janelas, não fluxo padrão. Não existe `print`/`echo` embutido; para gerar arquivos, o exemplo usaria `FileAppend(texto, "saida.txt")`, que em v2 recebe o texto como primeiro argumento.
- **Sem módulos:** AutoHotkey não tem sistema de pacotes. Reutilização se faz com `#Include` de outros `.ahk` ou com bibliotecas copiadas para a pasta do script.
- **Diferenças v1/v2 relevantes para leitura:** vírgula após o nome do comando foi removida; `MsgBox, texto` e `%var%` são sintaxe v1 e apareceriam como erro em v2; `StringUpper, var, var` virou função com retorno; `#IfWinActive` virou `#HotIf`; rótulos e `Gosub` foram removidos em favor de funções.
- **`A_Clipboard`:** substitui `Clipboard` do v1 e é uma variável embutida normal; `ClipWait` continua existindo como função.
## Validação executada
Não houve execução. AutoHotkey é exclusivo do Windows e o ambiente usado para revisar esta pasta é Linux, sem interpretador viável; portanto nenhum resultado de execução é afirmado aqui.

A verificação feita foi estática e consistiu em: (1) conferência da sintaxe v2 na documentação oficial (páginas de hotkeys, `MsgBox`, `InputBox` e `FileAppend`); (2) checagem automática, por script Python, de que os 21 arquivos têm a diretiva `#Requires AutoHotkey v2.0`, chaves e parênteses balanceados, aspas fechadas e ausência de construções v1 como `MsgBox,`, `Loop,`, `%var%`, `StringUpper,`, `#IfWinActive` e rótulos com `Goto`/`Gosub`; (3) revisão manual da coerência entre enunciado, código e comentário em cada arquivo. Essa checagem detecta erros de forma, não de semântica: um nome de função inexistente ou um caminho inválido passaria por ela. A execução em uma máquina Windows com AutoHotkey v2 instalado continua pendente e é o próximo passo natural da auditoria.
## Referências
- Documentação oficial do AutoHotkey v2: <https://www.autohotkey.com/docs/v2/>
- Página da série v2 (data do v2.0.0 estável): <https://www.autohotkey.com/v2/>
- Hotkeys e hotstrings: <https://www.autohotkey.com/docs/v2/Hotkeys.htm> e <https://www.autohotkey.com/docs/v2/Hotstrings.htm>
- `MsgBox`: <https://www.autohotkey.com/docs/v2/lib/MsgBox.htm>
- `InputBox`: <https://www.autohotkey.com/docs/v2/lib/InputBox.htm>
- `FileAppend`: <https://www.autohotkey.com/docs/v2/lib/FileAppend.htm>
- Lista de mudanças do v1.1 para o v2.0: <https://www.autohotkey.com/docs/v2/v1-changes.htm>
