# Agda

**Ano de criação (marco histórico):** 2007 — associado à tese de Ulf Norell e à Agda 2; a linhagem do sistema é anterior.

## Descrição

Agda é uma linguagem funcional com tipos dependentes e um provador interativo. O verificador confere tipos, cobertura e terminação; portanto, um arquivo pode expressar tanto um programa quanto propriedades sobre programas. A extensão de fonte é `.agda` e os módulos devem declarar explicitamente seu nome com `module ... where`.

Os arquivos desta pasta são exemplos pequenos e independentes. A verificação exige uma instalação de Agda. Quando um exemplo importa `IO` ou `Data.String`, ele também depende da biblioteca correspondente (por exemplo, `agda-stdlib`) e da configuração do caminho de biblioteca. Isso é diferente de compilar: gerar um executável com o backend GHC requer ainda GHC e as dependências de compilação.

## Exemplos inclusos

1. **exemplo_1.agda** — hello world; depende de `IO`/biblioteca configurada.
2. **exemplo_2.agda** — valor tipado de `Nat`.
3. **exemplo_3.agda** — tipo indutivo `Bool`.
4. **exemplo_4.agda** — pattern matching e recursão terminante em `Nat`.
5. **exemplo_5.agda** — função de soma com assinaturas explícitas.
6. **exemplo_6.agda** — lista parametrizada e construtor infixo.
7. **exemplo_7.agda** — falha modelada por um tipo `Result`, em vez de exceção imperativa.
8. **exemplo_8.agda** — `String` com import explícito da biblioteca padrão.
9. **exemplo_9.agda** — aritmética com `Data.Nat`.
10. **exemplo_10.agda** — função polimórfica e terminante, como base para provas e algoritmos dependentes.

## Exercícios

Os arquivos `exercicio_1.agda` a `exercicio_10.agda` são módulos distintos. Eles praticam, respectivamente, um valor de `Nat`, soma, pattern matching em `Bool`, recursão, uma função polimórfica, listas, resultado opcional, strings, aritmética e um algoritmo recursivo. Cada arquivo contém uma implementação curta que pode ser expandida pelo estudante; não são dez cópias do mesmo hello world.

## Verificação

A verificação estática mínima, depois de instalar Agda, é:

```sh
agda --version
agda -i . linguagens/AGDA/exemplo_2.agda
agda -i . linguagens/AGDA/exemplo_3.agda
agda -i . linguagens/AGDA/exemplo_4.agda
agda -i . linguagens/AGDA/exemplo_5.agda
agda -i . linguagens/AGDA/exemplo_6.agda
agda -i . linguagens/AGDA/exemplo_7.agda
agda -i . linguagens/AGDA/exemplo_10.agda
```

Para `exemplo_1.agda`, `exemplo_8.agda` e os exercícios que usam biblioteca, configure primeiro o caminho de `agda-stdlib` (por `-i`, `.agda-lib` ou configuração equivalente à instalação):

```sh
agda -i . -i caminho/para/agda-stdlib linguagens/AGDA/exemplo_1.agda
agda -i . -i caminho/para/agda-stdlib linguagens/AGDA/exemplo_8.agda
```

Esses comandos verificam os módulos; não prometem um executável. Para compilação via GHC, use `agda -c` somente após instalar/configurar GHC e as dependências de backend. Neste ambiente de revisão, `agda`, `cabal`, `ghc` e `stack` podem não estar instalados; nesse caso, registre a ausência e faça apenas validações estáticas realistas, sem alegar compilação.
