# AppleScript

**Linhagem:** linguagem de script da Apple, apresentada em 1993 com o System 7
**Linguagem desta pasta:** AppleScript 2.0 ou superior, conforme o *AppleScript Language Guide* da Apple

## Descrição

AppleScript é a linguagem de automação da Apple, distribuída com o sistema Mac OS desde 1993 e ainda presente no macOS atual. Ela é uma linguagem interpretada e compilada para um formato intermediário próprio: o texto-fonte é convertido por `osacompile` em um script compilado, executado pelo componente do sistema `osascript` ou pelo Script Editor. A sintaxe imita o inglês e se apoia em três ideias: classes de valores com tipagem dinâmica (`integer`, `real`, `text`, `boolean`, `date`, `list`, `record`), *handlers* (sub-rotinas) e blocos `tell` que enviam comandos a aplicativos por meio de Apple events. O núcleo da linguagem é pequeno; comandos usados nos exemplos como `display dialog`, `display notification` e `round` pertencem às Standard Additions, a biblioteca padrão que acompanha o sistema.

Diferentemente de linguagens de propósito geral, boa parte do vocabulário de AppleScript vem dos dicionários de script dos aplicativos: cada aplicativo declara os comandos e classes que aceita. Por isso os arquivos desta pasta evitam depender de aplicativos específicos e usam apenas o núcleo da linguagem e as Standard Additions, que existem em qualquer instalação do macOS.

## Arquivos

Cada tópico aparece em duas extensões, `exemplo_N.applescript` e `exemplo_N.scpt` (e o mesmo para os exercícios), com exatamente o mesmo texto de programa.

- `.applescript` é a extensão convencional para **texto-fonte** legível, editável em qualquer editor de texto. É o formato que se abre no Script Editor e que se compila com `osacompile`.
- `.scpt` é a extensão do **script compilado** do AppleScript: um arquivo binário no formato de script da Apple, gerado por `osacompile` ou pelo Script Editor ao salvar. Ele não é texto legível e não pode ser editado como texto-fonte.

Neste projeto, porém, os dois arquivos de cada par contêm o mesmo texto-fonte AppleScript, por convenção do projeto: o `.scpt` daqui não é um binário compilado, e sim uma cópia do `.applescript` com a extensão do formato compilado. Isso mantém a paridade com as demais pastas do museu (que também repetem cada programa em duas extensões) e deixa explícito que o conteúdo publicado é o texto-fonte. Para obter um `.scpt` real, compile o `.applescript` correspondente no macOS.

### Exemplos

1. `exemplo_1` — estrutura mínima de um script, comentários e `display dialog`
2. `exemplo_2` — variáveis, classes de valores e coerção com `as`
3. `exemplo_3` — controle de fluxo com `if`, `else if` e `else`
4. `exemplo_4` — as formas de `repeat`, `exit repeat` e a sequência de Collatz
5. `exemplo_5` — handlers, recursão e parâmetro rotulado com `given`
6. `exemplo_6` — listas, registros, índices negativos e `text item delimiters`
7. `exemplo_7` — erros com `try`, `on error` e a instrução `error`
8. `exemplo_8` — texto, `words`, `offset`, `text N thru M` e delimitadores
9. `exemplo_9` — `^`, `div`, `mod`, `round` e arredondamento por handler
10. `exemplo_10` — ordenação por inserção sobre uma cópia da lista

### Exercícios

Cada exercício é um script completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1` — notificação de boas-vindas com `display notification`
2. `exercicio_2` — conversão de Celsius para Fahrenheit com uma casa decimal
3. `exercicio_3` — classificação de números em positivo, negativo ou zero
4. `exercicio_4` — soma e contagem dos pares de 1 a 20 com `mod`
5. `exercicio_5` — potência inteira calculada com `repeat`, sem o operador `^`
6. `exercicio_6` — inversão de uma lista de cinco itens com contador decrescente
7. `exercicio_7` — divisão protegida contra divisor zero com `try`/`error`
8. `exercicio_8` — contagem de palavras e frase com a ordem das palavras invertida
9. `exercicio_9` — média, maior e menor de seis notas, devolvidos em um record
10. `exercicio_10` — busca linear que devolve a posição ou zero

## Como executar

A única implementação de AppleScript é a da Apple, disponível exclusivamente no macOS. Os comandos abaixo são os do sistema, não um interpretador alternativo:

```sh
# Compilar o texto-fonte em um script compilado (formato .scpt)
osacompile -o exemplo_1.scpt exemplo_1.applescript

# Executar o script compilado
osascript exemplo_1.scpt

# Alternativa: executar direto do texto-fonte, sem gerar arquivo
osascript exemplo_1.applescript

# Alternativa: executar uma linha avulsa
osascript -e 'display dialog "Olá, mundo!"'
```

O Script Editor (`/Applications/Utilities/Script Editor.app`) abre, compila e executa os arquivos `.applescript`. Os scripts que chamam `display dialog` ou `display notification` precisam de uma sessão gráfica do macOS; quando executados por SSH ou por um agente sem interface, `display dialog` falha e apenas o `log` produz saída.

## Escopo e limitações documentadas

- **Sem dependência de aplicativos:** nenhum arquivo usa `tell application` para controlar um aplicativo específico. Apenas o núcleo da linguagem e as Standard Additions (`display dialog`, `display notification`, `round`) são usados, de modo que os scripts não dependem de versões de terceiros instaladas.
- **`display dialog` exige interface gráfica:** é o único ponto dos exemplos que precisa de sessão de usuário. O `log` repete a mesma informação no console do Script Editor e no log unificado, o que permite conferir os resultados sem a janela.
- **Registros são imutáveis:** não se atribui a um campo de um record já criado; o exemplo 6 cria um record novo com o operador `&`, que funde registros.
- **Texto é imutável nos elementos:** `set character 1 of t to ...` é erro; alterações de texto produzem um novo texto por concatenação ou por `text N thru M`.
- **Comparação de texto:** por padrão ignora diferenças de caixa; `considering case` restaura a comparação exata, como mostrado no exemplo 8.
- **Números:** `integer` e `real` são classes distintas; a divisão de inteiros com `/` produz `real`, e `div`/`mod` produzem inteiros. `round` é comando das Standard Additions, com o parâmetro `rounding`.
- **Mensagens de erro do sistema:** números e textos de erros levantados pelo próprio AppleScript variam com a versão e o idioma do sistema; por isso o exemplo 7 apenas repassa a mensagem capturada, sem afirmar um texto fixo.

## Validação executada

Não houve compilação nem execução: `osacompile` e `osascript` existem somente no macOS, e não há runtime viável de AppleScript em Linux. A validação desta pasta foi exclusivamente estática e está descrita em `RELATORIO.md`: conferência da sintaxe de cada construção contra o *AppleScript Language Guide* (blocos `if`/`repeat`/`try`/`tell`/handler com fechamento correspondente, forma dos comandos `display dialog` e `display notification`, uso de `text item delimiters`), verificação automatizada de balanceamento de blocos, parênteses, aspas e chaves, ausência de marcadores de placeholder e igualdade byte a byte entre cada `.applescript` e o `.scpt` correspondente.

## Referências

- AppleScript Language Guide (Apple, documentação arquivada): <https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html>
- AppleScript Language Guide — Control Statements: <https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_control_statements.html>
- AppleScript Language Guide — About Handlers: <https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/conceptual/ASLR_about_handlers.html>
- AppleScript Language Guide — Class Reference (text, list, record): <https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_classes.html>
- Mac Automation Scripting Guide — Displaying Dialogs and Alerts: <https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/DisplayDialogsandAlerts.html>
- Mac Automation Scripting Guide — Displaying Notifications: <https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/DisplayNotifications.html>
