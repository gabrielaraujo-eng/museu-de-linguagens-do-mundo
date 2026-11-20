# APL

**Ano de criação:** 1962 (notação publicada por Kenneth E. Iverson em *A Programming Language*, 1962; a primeira implementação executável, o IBM APL\360, é de 1966)

## Descrição

APL (A Programming Language) é uma linguagem de notação de arrays criada por Kenneth E. Iverson. Em vez de descrever laços, o programador descreve operações sobre vetores e matrizes inteiras: quase todo operador age simultaneamente sobre todos os elementos de um array. Três propriedades definem a linguagem:

- **Avaliação da direita para a esquerda, sem precedência de operadores.** `2 × 3 + 4` vale 14, não 10. Parênteses servem para mudar a ordem.
- **Arrays como único tipo de dado.** Um escalar é um array de posto 0; um texto é um vetor de caracteres; não há tipos declarados.
- **Notação simbólica em Unicode.** `⍳` gera índices, `⍴` dá a forma, `+/` soma, `⌈` e `⌊` são teto e piso, `⍋` ordena, `←` atribui, `⍝` comenta, `∇` delimita funções.

Os arquivos desta pasta usam o dialeto GNU APL, com primitivas que também existem em Dyalog APL: nenhum arquivo usa *dfns* (`{...}`), `⍸`, `⊃` nem conversão de caixa proprietária.

## Arquivos

### Exemplos

1. `exemplo_1.apl` — primeira saída com `⎕←`, comentários com `⍝` e a ordem de avaliação da direita para a esquerda
2. `exemplo_2.apl` — variáveis sem declaração de tipo, escalares, vetor de caracteres, booleanos e o posto (`⍴⍴`)
3. `exemplo_3.apl` — controle de fluxo com desvios `→(condição)/RÓTULO` dentro de uma função
4. `exemplo_4.apl` — repetição: laço implícito sobre vetores e laço explícito com rótulos
5. `exemplo_5.apl` — funções definidas com `∇`: monádica, diádica e recursiva
6. `exemplo_6.apl` — vetores, matrizes, arrays de posto 3, indexação `m[2;3]` e transposta `⍉`
7. `exemplo_7.apl` — proteção de erros por teste de pré-condição (divisão por zero, índice fora da faixa, domínio da raiz)
8. `exemplo_8.apl` — cadeias de caracteres: `↑`, `↓`, `⌽`, `⍳`, contagem e maiúsculas via `⎕UCS`
9. `exemplo_9.apl` — matemática: `*`, `⍟`, `○`, `!`, `|`, `⌈/`, `⌊/` e desvio padrão
10. `exemplo_10.apl` — algoritmos: crivo de Eratóstenes, ordenação com `⍋`/`⍒`, produto interno `+.×` e MDC por Euclides

### Exercícios

Cada exercício é um programa completo e independente, resolvido, sobre o tópico correspondente:

1. `exercicio_1.apl` — saída de um cabeçalho de quatro linhas
2. `exercicio_2.apl` — conversão de um vetor de Celsius para Fahrenheit
3. `exercicio_3.apl` — classificação de um inteiro em positivo, negativo ou zero
4. `exercicio_4.apl` — seleção e soma dos números pares de 1 a 20
5. `exercicio_5.apl` — potência inteira por recursão, sem usar `*`
6. `exercicio_6.apl` — inversão de um vetor, soma, máximo e teste de palíndromo
7. `exercicio_7.apl` — divisão protegida contra divisor zero, devolvendo texto
8. `exercicio_8.apl` — contagem de vogais com pertinência (`∊`) e negação (`~`)
9. `exercicio_9.apl` — hipotenusa, área e perímetro de triângulos retângulos
10. `exercicio_10.apl` — maior, menor, média, amplitude e aprovações de seis notas

## Como executar

A implementação usada para validar esta pasta é o **GNU APL 2.0** (<https://www.gnu.org/software/apl/>). Em sistemas onde o pacote existe, basta `sudo apt-get install apl`; caso contrário, compila-se do fonte:

```sh
curl -LO https://ftp.gnu.org/gnu/apl/apl-2.0.tar.gz
tar xzf apl-2.0.tar.gz && cd apl-2.0
./configure --disable-nls && make -j4
```

O binário gerado é `src/apl`. Cada arquivo é executado assim (ambiente UTF-8 é obrigatório por causa dos símbolos APL e dos acentos):

```sh
export LANG=C.UTF-8 LC_ALL=C.UTF-8
apl -s --noSV -f exemplo_1.apl --OFF
```

Detalhes que valem para o GNU APL 2.0 e que a forma curta `apl --script arquivo.apl` não cobre:

- `-s` (`--script`) liga o modo silencioso, mas **não recebe nome de arquivo**; o arquivo entra por `-f`.
- `--OFF` encerra a sessão ao fim do arquivo. Sem ele o interpretador fica esperando entrada e o processo não termina.
- `--noSV` desliga o servidor de variáveis compartilhadas, que em ambiente de contêiner pode bloquear a inicialização.
- O GNU APL grava um histórico `.apl.history` no diretório corrente; o arquivo não faz parte do projeto.

## Escopo e limitações documentadas

- **Rótulos só existem dentro de funções.** Em APL clássico, linhas como `FIM:` são rótulos de função, não de programa; em execução imediata (o modo em que um arquivo de script é lido) o interpretador responde `Illegal : in immediate execution`. Por isso os exemplos 3 e 4 e o exercício 3 colocam a lógica em uma função `∇ ... ∇` chamada no fim do arquivo. A alternativa moderna, `:If ... :EndIf`, existe no GNU APL e no Dyalog, mas não faz parte da notação original e foi evitada.
- **Função diádica: o nome é o termo do meio.** O cabeçalho `∇ r ← b area h` declara a função `area` com argumento esquerdo `b` e direito `h`. Escrever `∇ r ← area b h` cria, na verdade, uma função chamada `b`.
- **Sem exceções capturáveis no núcleo.** O idioma de tratamento de erros é testar a pré-condição e desviar, como em `exemplo_7.apl`. O `⎕TRAP` intercepta eventos do interpretador (por exemplo o evento 11, `DOMAIN ERROR`), mas o formato dos traps varia entre implementações e, no GNU APL 2.0, um `⎕TRAP` com ação `'E'` e enunciado em arquivo de script abre um prompt de entrada em vez de continuar a execução; por isso ele não é usado nos exemplos.
- **`⎕IO` explícito.** Todos os arquivos fixam `⎕IO ← 1` (origem de índices em 1). Com `⎕IO ← 0` os mesmos programas indexam a partir de zero; a escolha é configuração, não sintaxe.
- **`∊` é sobrecarregado.** Monádico é *enlist* (achata em vetor, usado para imprimir vetores junto com texto); diádico é pertinência (usado no exercício 8).
- **Números negativos usam `¯`** (U+00AF), não o hífen. `-` é subtração.
- **Precisão de impressão.** O GNU APL imprime com `⎕PP` (padrão 10 dígitos significativos), como se vê em `1.414213562`.
- **Diferença em relação ao Dyalog.** Os arquivos não usam `{dfns}`, `⍸`, `⊃`, `819⌶` nem `⎕SIGNAL`, que são extensões do Dyalog; usam apenas primitivas ISO/GNU. A execução no Dyalog é possível trocando `apl -s --noSV -f arquivo.apl --OFF` por `dyalog -script arquivo.apl` e adicionando `)OFF` ao fim do arquivo.

## Validação executada

Os 20 programas foram executados com o GNU APL 2.0 compilado do fonte (versão 2.0, build de 2026-11-20), comando `apl -s --noSV -f ARQUIVO --OFF`, ambiente `LANG=C.UTF-8`. Resultado: **20 de 20 terminaram com código de saída 0** e sem mensagens de erro (`VALUE ERROR`, `SYNTAX ERROR`, `INDEX ERROR`, `DOMAIN ERROR`) nos registros de saída. Exemplos de saída conferida: `primos até 50 = 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47` (exemplo 10), `Fahrenheit: 32 68 98.6 212` (exercício 2), `média: 7.666666667` (exercício 10). O processo completo, com os registros de cada arquivo, está no `RELATORIO.md` desta pasta.

## Referências

- Kenneth E. Iverson, *A Programming Language* (1962): <https://www.jsoftware.com/papers/APL.htm>
- ISO/IEC 13751:2001 — *Programming languages, their environments and system software interfaces — Extended APL*: <https://www.iso.org/standard/27100.html>
- GNU APL — manual e documentação: <https://www.gnu.org/software/apl/>
- Dyalog APL — *Language Reference*: <https://help.dyalog.com/latest/>
- SIGAPL/ACM — *APL Quote Quad* e material histórico: <https://dl.acm.org/doi/10.1145/585646.585648>
