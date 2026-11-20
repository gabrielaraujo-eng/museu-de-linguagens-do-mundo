# AutoLISP
**Linhagem:** Lisp (John McCarthy, 1958-1960) → AutoLISP, dialeto embutido no AutoCAD desde 1986
**Linguagem desta pasta:** AutoLISP conforme o *AutoLISP Reference* da Autodesk (documentação do AutoCAD 2024-2026)
## Descrição
AutoLISP é o dialeto de Lisp que roda dentro do AutoCAD. Não é Common Lisp: é um interpretador pequeno, com escopo dinâmico, sem macros, sem `let`, sem `setf`, sem `format` e sem classes. Toda a linguagem está na notação de parênteses: `(função argumento ...)`, com comentários de `;` até o fim da linha. O que distingue AutoLISP de outros Lisps é o acesso direto ao desenho: pontos, entidades, seleções, variáveis de sistema e comandos do próprio AutoCAD podem ser lidos e executados de dentro do código, por meio de `getpoint`, `ssget`, `entget`, `getvar`/`setvar` e `command`.

Os programas desta pasta cobrem, em ordem, a forma mínima de uma função, variáveis e tipos, controle de fluxo, os três laços (`repeat`, `while`, `foreach`), definição de funções com variáveis locais e recursão, listas e pares pontilhados, o tratamento de erros baseado em `*error*`, strings, matemática e geometria de coordenadas, e por fim um algoritmo recursivo (quicksort) cujo resultado é desenhado no desenho.
## Arquivos
Todos os arquivos são AutoLISP puro: usam apenas funções do núcleo documentado, sem `vl-*` (Visual LISP) e sem extensões de outras plataformas CAD. Cada arquivo é autônomo e pode ser carregado isoladamente.
### Exemplos
1. `exemplo_1.lsp` — "Olá, Mundo" com `defun c:` e `princ`; por que o `(princ)` final silencia o valor de retorno
2. `exemplo_2.lsp` — `setq`, tipos do núcleo (`INT`, `REAL`, `STR`, `LIST`), `type`, divisão sempre real e variáveis locais contra globais
3. `exemplo_3.lsp` — `if` com e sem a parte "senão", `cond`, `progn`, `and`/`or` com curto-circuito, e a regra de que só `nil` é falso
4. `exemplo_4.lsp` — `repeat`, `while`, `foreach` e o padrão de acumulador; consumo de lista com `cdr`
5. `exemplo_5.lsp` — `defun` com argumentos e lista de locais após a barra, recursão (`fatorial`), função passada a `mapcar`/`apply` e um comando `FAT`
6. `exemplo_6.lsp` — anatomia de listas (`car`/`cdr`/`cadr`/`nth`/`length`/`last`), `cons`/`append`/`reverse`, pares pontilhados com `assoc`, `mapcar` com duas listas
7. `exemplo_7.lsp` — tratamento de erros com `*error*`: guardar, instalar, restaurar; cancelamento do usuário contra erro real; divisão protegida
8. `exemplo_8.lsp` — `strcat`, `strlen`, `substr` (índice a partir de 1), `strcase`, `ascii`/`chr`, `atoi`/`atof`/`itoa`/`rtos`
9. `exemplo_9.lsp` — `sqrt`, `expt`, `fix`, `rem`, trigonometria em radianos, `distance`/`angle`/`polar` e o comando `RETANGULO` com `command`
10. `exemplo_10.lsp` — quicksort recursivo com partições e `append`, verificação de ordenação e desenho da polilinha derivada do resultado
### Exercícios
Cada exercício é um programa completo e resolvido, distinto dos exemplos, sobre o tópico de mesmo número:
1. `exercicio_1.lsp` — saudação em duas linhas com `getstring` e `strcat`, tratando nome vazio
2. `exercicio_2.lsp` — conversão Celsius/Fahrenheit com `getreal` e `rtos`, nas duas direções
3. `exercicio_3.lsp` — classificação de um real em positivo, negativo ou zero e teste de "é inteiro?" com `equal` e tolerância
4. `exercicio_4.lsp` — soma dos pares de 1 a 20 com `while` e `rem`, conferida por uma versão com `repeat`
5. `exercicio_5.lsp` — potência inteira por laço (sem `expt`), tabela de potências e `initget` para entrada obrigatória
6. `exercicio_6.lsp` — inversão de lista com acumulador `cons` e teste de palíndromo com `equal`
7. `exercicio_7.lsp` — média de medidas com proteção contra lista vazia e restauração de `OSMODE`/`CMDECHO` pelo `*error*`
8. `exercicio_8.lsp` — contagem de vogais percorrendo a string com `substr` e `strcase`, em duas estratégias
9. `exercicio_9.lsp` — distância, ângulo em graus e ponto médio entre dois pontos, desenhando linha e círculo
10. `exercicio_10.lsp` — maior, menor, média e contagem abaixo da média com `apply`, `mapcar` e `foreach`
## Como executar
AutoLISP não tem interpretador de linha de comando independente: ele existe dentro do AutoCAD (Windows e macOS) e em CADs compatíveis que implementam a mesma API. Não há runtime viável em Linux. No AutoCAD:
```text
1. APPLOAD  -> escolha o arquivo .lsp  (ou arraste o arquivo para a janela do desenho)
2. alternativa pela linha de comando:  (load "exemplo_1.lsp")
3. execute a função pura:              (mensagem-ola)
4. execute o comando registrado:       OLA
```
Os comandos definidos nesta pasta, com o prefixo `c:` exigido pelo AutoCAD, são: `OLA`, `FAT`, `TESTE_ERRO`, `PEDE_NUMERO`, `RETANGULO`, `ESCADA`, `SAUDACAO`, `CELSIUS`, `CLASSIFICAR`, `SOMA_PARES`, `POTENCIA`, `INVERTER_LISTA`, `MEDIA`, `VOGAIS`, `MEDIR`, `NOTAS`. Os nomes usam apenas letras, dígitos e sublinhado, para não colidir com a interpretação de opções da linha de comando.
## Escopo e limitações documentadas
- **Codificação:** os arquivos `.lsp` são mantidos em ASCII puro, inclusive nas mensagens impressas, para que o texto apareça igual em qualquer página de código do AutoCAD. Por isso os comentários aparecem sem acentuação; este README e o relatório da pasta usam acentuação normal em UTF-8.
- **`command` é síncrono e antigo:** `(command "_.PLINE" ...)` envia a sequência de respostas ao comando como se fosse digitada; `""` equivale a Enter. O sublinhado antes do nome garante o nome internacional do comando. `command-s` e `vl-cmdf` são alternativas mais recentes e não foram usadas aqui.
- **Sem exceções capturáveis:** AutoLISP não tem `try`/`catch`. O único gancho é a função guardada em `*error*`, chamada pelo AutoCAD quando a execução é interrompida; ela recebe a mensagem como string. `vl-catch-all-apply` pertence ao Visual LISP e ficou fora do escopo.
- **Inteiros de 32 bits:** o intervalo seguro vai de -2147483648 a 2147483647, o que limita `fatorial` a 12! — daí a validação no comando `FAT`.
- **Escopo dinâmico:** variáveis não declaradas depois da barra são globais ao documento; variáveis locais nascem `nil` e desaparecem ao fim da chamada. Não há fechamentos (closures) léxicos.
- **Verdade e falsidade:** apenas `nil` é falso. `0`, `""` e a lista vazia (que também é `nil`) exigem cuidado; por isso os testes usam `null`, `equal` e comparações explícitas.
- **Comparação:** `=` serve para números e strings; `eq` para símbolos; `equal` para listas e para reais com tolerância (`(equal a b 0.001)`).
- **Portabilidade:** o código usa só funções do núcleo do AutoCAD. BricsCAD, ZWCAD e GstarCAD implementam subconjuntos parecidos, mas não foram testados aqui.
## Validação executada
Não houve execução em AutoCAD nem em nenhum CAD: a pasta foi validada por (a) verificação estática de todos os 20 arquivos `.lsp` — parênteses e aspas balanceados, `defun` com lista de parâmetros bem formada, no máximo uma barra separando locais, comandos `c:` sem argumentos, e conferência de que todo símbolo em posição de função pertence ao núcleo documentado ou é definido no próprio arquivo — e (b) execução de 82 casos de teste sobre as funções puras (sem `command`, `getpoint`, `getvar`), por meio de um mini-interpretador do subconjunto puro escrito para esta auditoria. Os 82 casos passaram e os 20 arquivos passaram na checagem estática. As funções que dependem do editor (`command`, `getpoint`, `getdist`, `getreal`, `getint`, `getstring`, `setvar`, `getvar`, `initget`) não foram executadas por nenhum AutoCAD: foram apenas lidas e revisadas contra a documentação da Autodesk. Detalhes e ressalvas estão em `RELATORIO.md`.
## Referências
- *AutoLISP Reference* (Autodesk), verbete `defun` — a barra dos locais precisa de espaço dos dois lados: <https://help.autodesk.com/cloudhelp/2026/HUN/AutoCAD-AutoLISP-Reference/files/GUID-5269529D-A013-4AB4-AAB7-DBA1C7CA73EB.htm>
- *About Using Defun to Define a Function* (AutoLISP): <https://help.autodesk.com/view/ACDLT/2026/ENU/?caas=caas/documentation/ACD/2014/ENU/files/GUID-9EDF48C2-1678-4DC3-BFD6-9D1DEAC525F0-htm.html>
- *To declare local variables* (AutoLISP): <https://help.autodesk.com/cloudhelp/2024/HUN/AutoCAD-LT-AutoLISP/files/GUID-89387281-599B-493F-AA3D-85DA4D6029B6.htm>
- *command* (AutoLISP): <https://help.autodesk.com/view/ACDLT/2024/ENU/?guid=GUID-1C989B35-2C5A-47EC-A0C9-71998EDFB157>
- *princ* (AutoLISP): <https://help.autodesk.com/view/OARX/2024/ENU/?guid=GUID-7DDA298B-A97C-49C9-94BA-46C77B50AE99>
- Lee Mac, *Error Handling* (uso de `*error*` em rotinas AutoLISP): <https://lee-mac.com/errorhandling.html>
