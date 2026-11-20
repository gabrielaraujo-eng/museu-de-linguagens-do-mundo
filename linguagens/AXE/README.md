# Axe Parser

**Linhagem:** Axe Parser, linguagem compilada para as calculadoras TI-83 Plus, TI-83 Plus Silver Edition, TI-84 Plus e TI-84 Plus Silver Edition, criada por Kevin Horowitz ("Quigibo") a partir de 2010
**Linguagem desta pasta:** Axe Parser, conforme o *Complete User's Guide* versão 1.1.2 (fevereiro de 2012) e a *Axe Parser Command List* mantida em <https://axe.eeems.ca/Commands.html>

## Descrição

Axe Parser é uma linguagem de programação compilada que roda dentro da própria calculadora. O programador escreve o fonte no editor de programas da TI, com os mesmos tokens do TI-BASIC, e o aplicativo Axe Parser traduz esse fonte para código de máquina Z80 executável. O resultado é um programa nativo, sem interpretador e sem shell obrigatório: a velocidade fica próxima da assembly, mas o código continua editável na calculadora, ao contrário da assembly pura.

A linguagem não é o TI-BASIC. Os tokens são reaproveitados com significado diferente: `Disp` recebe um ponteiro, `^` é o operador de resto e não de potência, `For(` conta iterações, `{...}` lê um byte no endereço indicado e `→` grava em variável. A avaliação de expressões é estritamente da esquerda para a direita, sem precedência de operadores, o que torna os parênteses obrigatórios em quase toda conta. Números são inteiros de 16 bits, sem casas decimais.

Identificação: o nome "Axe" nesta pasta corresponde ao Axe Parser para calculadoras TI. Não foi localizada outra linguagem de programação chamada Axe com uso documentado e extensão `.axe`; a extensão é convenção deste projeto, não da linguagem.

## Arquivos

O fonte de um programa Axe não é um arquivo de texto: na calculadora ele é um programa tokenizado (`prgm`) criado no editor. Os arquivos `.axe` desta pasta são transcrições em texto puro desse fonte, com duas convenções de representação:

- a primeira linha é o cabeçalho obrigatório, escrito `:.NOME descrição`, onde `:` é o separador de instruções do TI-BASIC e `.` inicia o comentário que o Axe usa como nome do programa compilado;
- todas as linhas começam com `:`, como no listado do editor da calculadora.

Os nomes de cabeçalho são curtos (`.EX01` a `.EX10`, `.ER01` a `.ER10`) porque o nome do programa compilado é um nome de programa TI, limitado a oito caracteres.

### Exemplos

1. `exemplo_1` — estrutura mínima: cabeçalho, `DiagnosticOff`, `ClrHome`, string em `Str1` e `Disp`
2. `exemplo_2` — variáveis de 16 bits, ordem de avaliação da esquerda para a direita e aritmética modular
3. `exemplo_3` — seleção com `If`, `ElseIf`, `Else`, `End` e a forma negada `!If`
4. `exemplo_4` — laços `For(` contados, acumulador e laços aninhados
5. `exemplo_5` — sub-rotinas com `sub(`, `Lbl`, `Return` e os argumentos em `r₁` e `r₂`
6. `exemplo_6` — vetor de bytes na RAM livre `L₁` e tabela somente leitura com `Data(` em `GDB1`
7. `exemplo_7` — `While` e espera de tecla com `Repeat getKey(15)`
8. `exemplo_8` — strings como ponteiros: `length(`, deslocamento do ponteiro, `{...}` e `Copy(`
9. `exemplo_9` — matemática inteira: `√(`, `^` como resto, `min(`, `max(` e `rand`
10. `exemplo_10` — gráficos: sprite hexadecimal em `Pic1`, `Pt-On(`, `Pxl-On(`, `Line(`, `Rect(`, `ClrDraw` e `DispGraph`

### Exercícios

Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1` — duas linhas de saída com `Disp ...,i`
2. `exercicio_2` — conversão de Celsius para Fahrenheit com inteiros e parênteses explícitos
3. `exercicio_3` — classificação de uma nota em três faixas com `If`/`ElseIf`/`Else`
4. `exercicio_4` — soma dos pares de 1 a 20 usando `N^2` como teste de paridade
5. `exercicio_5` — potência inteira por sub-rotina, com laço `For(` e acumulador em `r₃`
6. `exercicio_6` — inversão de um vetor de cinco posições em `L₁` por troca simétrica
7. `exercicio_7` — divisão protegida contra divisor zero
8. `exercicio_8` — comprimento de string com `length(` e cópia com terminador para `L₁`
9. `exercicio_9` — hipotenusa e área de um triângulo retângulo com `√(`
10. `exercicio_10` — maior, menor e média de seis notas guardadas em `L₁`

## Como executar

Não existe compilador de Axe para Linux, macOS ou Windows: o compilador é o aplicativo Axe Parser, que roda na calculadora (ou em emulador). A cadeia é sempre esta:

1. transferir o fonte para a calculadora como programa TI (por cabo USB com o software da TI, ou convertendo o texto em `.8xp` com o SourceCoder 3, <https://www.cemetech.net/sc/>);
2. instalar o aplicativo Axe Parser na calculadora (a versão distribuída no ticalc.org é a 1.2.2) e, opcionalmente, ativar o *token hook* que faz o editor exibir os nomes dos comandos Axe;
3. abrir o aplicativo, escolher **Compile**, selecionar o fonte e confirmar com [Enter];
4. executar o programa gerado pela lista de programas, ou pela tela inicial.

Para testar sem risco de apagar a RAM da calculadora, use o emulador Wabbitemu com uma ROM de TI-83 Plus ou TI-84 Plus monocromática. Os modelos TI-84 Plus C Silver Edition e TI-84 Plus CE não são compatíveis com o Axe Parser.

## Escopo e limitações documentadas

- **Números:** todos os valores são inteiros de 16 bits (0 a 65535, ou -32768 a 32767 em representação com sinal). Não há ponto flutuante. Por isso os exemplos usam apenas aritmética inteira: médias e conversões são calculadas com divisão inteira, que trunca para baixo.
- **Exibição de números:** um número só aparece na tela com a marca de conversão `▶Dec`; sem ela o `Disp` trata o valor como ponteiro de string. A exibição usa representação sem sinal, então um valor negativo aparece como seu equivalente acima de 32767. Os exemplos evitam exibir negativos e obtêm o mesmo efeito com `abs(`, comparações e mensagens de texto.
- **Ordem de avaliação:** não há precedência. `A+B*2` vale `(A+B)*2`. Todos os cálculos não triviais estão parentetizados.
- **Acentuação:** o conjunto de caracteres da TI-83/84 não tem letras acentuadas. Comentários e strings desta pasta são ASCII, sem acentos, para que o texto possa ser digitado na calculadora sem corrupção.
- **`and` / `or`:** o guia 1.1.2 usa `and` em exemplos, mas a *Command List* atual documenta os operadores de curto-circuito `?` e `??` e não lista mais `and`/`or`. Para não depender da versão do aplicativo, os programas usam `If` aninhados em vez de operadores lógicos.
- **RAM livre:** `L₁` tem 768 bytes (saveSScreen), `L₂` 531 bytes (statVars), `L₃` 768, `L₄` 256, `L₅` 128 (textShadow) e `L₆` 768 (plotSScreen). `L₅` é corrompida por `Disp`, `Output(` e `ClrHome`, e `L₆` por qualquer desenho no buffer; por isso todos os vetores desta pasta usam apenas `L₁`, com índices bem abaixo de 768.
- **`Data(` e escrita:** dados declarados com `Data(...)` ficam na memória do programa. O programa executa sobre uma cópia, então gravar em `{A+GDB1}` funciona durante a execução mas não persiste ao sair. Vetores que precisam ser gravados usam `L₁`.
- **Sub-rotinas:** `sub(ALVO,args)` carrega de zero a seis argumentos em `r₁` a `r₆`. O valor de retorno é devolvido em `r₁` e o chamador o lê explicitamente (`Disp r₁▶Dec`), sem depender do valor da expressão `sub(...)`.
- **Texto na tela gráfica:** `Text(` e os modos `Fix` existem, mas a *Command List* só documenta operandos `▶Dec`, `▶Char` e `▶Tok` para `Text`. Para não usar construção não confirmada, esta pasta não exercita `Text(`/`Fix`; todo texto usa `Disp` e `Output(` na tela inicial.
- **Fora do escopo:** variáveis externas (`GetCalc`), arquivos em Flash, escala de cinza, `Asm(` com assembly embutido, interrupções, som e link entre calculadoras não são demonstrados aqui.

## Validação executada

Não houve execução. O Axe Parser só compila dentro da calculadora TI-83+/84+ (ou em emulador com ROM), e este ambiente é Linux sem ROM nem emulador; portanto nenhum dos 20 programas foi compilado ou rodado.

A validação foi estática e está descrita em detalhe no `RELATORIO.md`: um verificador próprio conferiu, nos 20 fontes (347 linhas), cabeçalho `:.NOME` válido, prefixo `:` em todas as linhas, balanceamento de `If`/`For(`/`While`/`Repeat` com `End`, existência de `Lbl` para cada `sub(` e de `Return` em cada sub-rotina, vocabulário de tokens contra a documentação oficial, limites de índice em `L₁` e ausência de construções não confirmadas. O resultado foi zero problemas. Os valores esperados de cada programa foram calculados à mão e estão tabelados no relatório.

## Referências

- Axe Parser, *Complete User's Guide* 1.1.2 Omega (2 de fevereiro de 2012): <https://axe.eeems.ca/Documentation.pdf>
- Axe Parser *Command List* (referência exaustiva de comandos, tamanhos e ciclos): <https://axe.eeems.ca/Commands.html>
- Site oficial citado pela comunidade, <https://axe.cemetech.net/> (o domínio não devolveu conteúdo na coleta; a documentação é servida em `axe.eeems.ca`)
- Axe Parser 1.2.2 no ticalc.org: <https://www.ticalc.org/archives/files/fileinfo/456/45659.html>
- Omnimaga, tópico "Getting Started with Axe Parser" (token hook, compatibilidade de modelos): <https://www.omnimaga.org/the-axe-parser-project/getting-started-with-axe-parser/>
