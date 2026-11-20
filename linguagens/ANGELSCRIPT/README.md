# AngelScript

**Linhagem:** linguagens de script embutidas de sintaxe C-like (C, C++, Java), criada por Andreas Jonsson em 2003
**Linguagem desta pasta:** AngelScript, implementação de referência AngelCode, extensão `.as`

## Descrição

AngelScript é uma linguagem de script de tipagem estática, compilada para bytecode e executada por uma máquina virtual embutida em aplicações escritas em C++. Ela não tem processo próprio: não existe `angelscript arquivo.as` como existe `python arquivo.py`. Quem hospeda o script cria o motor (`asCreateScriptEngine()`), registra tipos e funções da aplicação, compila o módulo e executa a função escolhida. É por isso que AngelScript aparece em jogos e ferramentas (por exemplo, no motor de jogos e em pacotes de plugins) e não como linguagem de linha de comando.

A sintaxe é próxima de C++: chaves, ponto e vírgula, `//` e `/* */`, `if`/`else`, `switch`, `for`, `while`, `do-while`, funções globais, classes com construtor e destrutor, `interface`, herança simples e handles (`@`) com contagem de referência. A tipagem é estática e as conversões numéricas são explícitas ou por promoção, sem coerção silenciosa de inteiro para `bool`.

Três coisas que este projeto trata como parte do ambiente, e não do núcleo, porque dependem do hospedeiro:

- `string` vem do add-on `scriptstdstring` (`RegisterStdString()`), que liga o tipo ao `std::string` do C++;
- `array<T>` vem do add-on `scriptarray` (`RegisterScriptArray()`);
- `print()` não pertence a nenhum add-on: é registrada pela aplicação, como faz o exemplo `console` do SDK, com a assinatura `void print(const string &in)`.

## Arquivos

Os 20 programas são scripts completos, cada um com uma função global `void main()` que o hospedeiro chama. A extensão `.as` é a convenção do projeto e dos editores que reconhecem AngelScript; a linguagem não prescreve sufixo.

### Exemplos

1. `exemplo_1.as` — estrutura mínima: comentários, `void main()`, `print()` e `return`
2. `exemplo_2.as` — tipos primitivos (`int`, `uint`, `int64`, `float`, `double`, `bool`), `const` e conversões
3. `exemplo_3.as` — `if`/`else if`/`else` com condição `bool` e `switch` com `break` e `default`
4. `exemplo_4.as` — `for`, `while`, `do-while`, `break`, `continue` e laços aninhados
5. `exemplo_5.as` — funções: sobrecarga, argumento padrão, `&in`, `&out` e recursão
6. `exemplo_6.as` — `array<T>`: lista de inicialização, `insertLast`, `insertAt`, `sortAsc`, `find`, `foreach`
7. `exemplo_7.as` — classes: construtores, destrutor, atributo `private`, método `const` e propriedade `get_`/`set_`
8. `exemplo_8.as` — interfaces, handles (`@`), polimorfismo, `cast<>` e `array<IForma@>`
9. `exemplo_9.as` — strings: `length`, `substr`, `findFirst`, `insert`, `erase`, concatenação e `formatFloat`
10. `exemplo_10.as` — exceções com `try`/`catch`: divisão por zero, handle nulo, índice fora dos limites

### Exercícios

Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1.as` — cabeçalho de várias linhas com constantes `string` e concatenação
2. `exercicio_2.as` — tabela de Celsius para Fahrenheit com `double` e `formatFloat`
3. `exercicio_3.as` — classificação de notas em conceitos com `if`/`else` e contagem por `switch`
4. `exercicio_4.as` — soma dos pares de 1 a 20, tabuada com `while` e fatorial com `do-while`
5. `exercicio_5.as` — potência recursiva, sobrecarga e quociente/resto por parâmetros `&out`
6. `exercicio_6.as` — estatísticas de um `array<double>` e ordenação por troca escrita no script
7. `exercicio_7.as` — classe `ContaBancaria` com depósito, saque, transferência por handle e propriedade somente leitura
8. `exercicio_8.as` — interface `IAnimal` com duas implementações e chamadas polimórficas
9. `exercicio_9.as` — contagem de vogais, inversão de string e substituição de trecho com `substr`
10. `exercicio_10.as` — divisão segura com `try`/`catch` em laço, handle nulo e continuidade do fluxo

## Como executar

Não há binário oficial de linha de comando. O caminho usado para validar esta pasta foi compilar o SDK a partir do código-fonte e escrever um hospedeiro mínimo (`runas.cpp`) que registra `string`, `array<T>` e `print`, compila o arquivo e executa `void main()`:

```sh
git clone --depth 1 https://github.com/anjo76/angelscript.git
cd angelscript/sdk

g++ -O1 -std=c++11 \
  -I angelscript/include -I add_on/scriptstdstring -I add_on/scriptarray \
  -o runas runas.cpp \
  angelscript/source/*.cpp angelscript/source/as_callfunc_arm64_gcc.S \
  add_on/scriptstdstring/scriptstdstring.cpp \
  add_on/scriptstdstring/scriptstdstring_utils.cpp \
  add_on/scriptarray/scriptarray.cpp

./runas exemplo_1.as
```

O arquivo de apoio `runas.cpp` (código completo em `RELATORIO.md`, seção 5) faz, em ordem: `asCreateScriptEngine()`, `SetMessageCallback()`, `RegisterStdString()`, `RegisterScriptArray(engine, true)`, `RegisterStdStringUtils()`, registro de `void print(const string &in)`, `GetModule("script", asGM_ALWAYS_CREATE)`, `AddScriptSection()`, `Build()`, `GetFunctionByDecl("void main()")`, `CreateContext()`, `Prepare()`, `Execute()`. O trecho `as_callfunc_arm64_gcc.S` é necessário em ARM64; em x86-64 o SDK usa `as_callfunc_x64_gcc.cpp` e o arquivo não entra na linha de compilação.

## Escopo e limitações documentadas

- **`print()` é da aplicação.** Nenhum add-on do SDK registra `print`; o exemplo `console` do SDK a define no hospedeiro. Sem esse registro, os scripts não compilam, e a mensagem é `No matching symbol 'print'`.
- **`string` e `array<T>` são add-ons.** Sem `RegisterStdString()` não existe o tipo `string`; sem `RegisterScriptArray()` não existe `array<T>`. Os programas desta pasta dependem dos dois.
- **`main()` não é chamada automaticamente.** O hospedeiro precisa buscar `void main()` por declaração e preparar um contexto; a linguagem não define ponto de entrada.
- **`throw` não existe.** Verificado por compilação: `throw 1;` produz `Expected ';'`. Exceções vêm de erros de execução (divisão por zero, handle nulo, índice fora dos limites em `array<T>`) ou de funções registradas pela aplicação. O `catch` não declara variável e não há acesso ao objeto da exceção no script.
- **`&inout` exige tipo com suporte a handle.** `string &inout` é rejeitado com `Only object types that support object handles can use &inout`; para strings usam-se `&in` e `&out`. Os exemplos seguem essa regra.
- **`string` não aceita handles.** `string@` é rejeitado; para demonstrar acesso a handle nulo, `exemplo_10.as` e `exercicio_10.as` usam uma classe.
- **Atributo e propriedade não podem ter o mesmo nome.** `private double saldo;` junto de `double get_saldo() property` faz o compilador tratar o atributo como a propriedade e recusar a escrita (`The property has no set accessor`). Por isso os atributos têm nomes distintos (`saldoAtual`, `nomeTitular`).
- **Números:** `int` tem 32 bits; `int64` e `uint64` são necessários acima de 2 bilhões. `float` tem 32 bits e `double` 64; um literal com sufixo `f` é `float`, sem sufixo é `double`.
- **Formatação:** a conversão implícita de `double` para `string` na concatenação usa notação compacta (`3` em vez de `3.000000`); para casas decimais fixas os exemplos usam `formatFloat()` e `formatInt()`, do add-on `scriptstdstring`.
- **Strings são bytes.** `length()`, `substr()` e o operador de índice trabalham com bytes, não com caracteres Unicode; os exemplos evitam texto com acentuação para não misturar as duas noções.
- **Versão:** os programas foram validados com o SDK 2.40.0 (WIP) do repositório oficial. `formatFloat(valor, opcoes, largura, casas)` usa a assinatura das versões 2.36 ou superiores; em versões antigas a assinatura é `formatFloat(valor, casas, largura)`.

## Validação executada

Os 20 scripts foram compilados e executados pelo hospedeiro descrito acima, compilado com `g++ -O1 -std=c++11` a partir do SDK 2.40.0 WIP: 20 de 20 terminaram com código de execução `asEXECUTION_FINISHED` e produziram a saída esperada para o tópico. Nenhum script dependeu de `sortAsc()` para o algoritmo de ordenação do `exercicio_6.as`, que implementa a troca no próprio script. Detalhes, comandos e resultados estão em `RELATORIO.md`.

## Referências

- Site oficial: <https://www.angelcode.com/angelscript/>
- Repositório oficial: <https://github.com/anjo76/angelscript>
- Manual da linguagem: <https://angelcode.com/angelscript/sdk/docs/manual/doc_script.html>
- Sentenças e estruturas de controle: <https://angelcode.com/angelscript/sdk/docs/manual/doc_script_statements.html>
- Classes de script: <https://angelcode.com/angelscript/sdk/docs/manual/doc_script_class.html>
- Biblioteca padrão e add-ons: <https://angelcode.com/angelscript/sdk/docs/manual/doc_script_stdlib.html>
- Tipo `string` do add-on: <https://angelcode.com/angelscript/sdk/docs/manual/doc_script_stdlib_string.html>
- Documentação do pacote Debian `angelscript-doc`: <https://packages.debian.org/sid/angelscript-doc>
