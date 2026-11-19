# Cairo (StarkWare)

**Lançamento da linguagem:** 2020, conforme a cronologia publicada pela StarkWare. Esta pasta trata da linguagem de computação provável por STARK, não da biblioteca de gráficos 2D Cairo, que é outro projeto. [1] [2]

## Exemplos

Os exemplos são programas Cairo independentes, escritos para a sintaxe Cairo 2.21.0 / Scarb 2.21.0, com a edition `2025_12` gerada pelo template oficial `scarb new` usado na validação.

As mensagens de saída usam caracteres ASCII para compatibilidade com o macro de impressão testado no Scarb 2.21.0; os comentários explicativos permanecem em português.

1. `exemplo_1.cairo` — impressão de texto (`ByteArray`).
2. `exemplo_2.cairo` — variáveis e tipos explícitos.
3. `exemplo_3.cairo` — decisão `if`/`else`.
4. `exemplo_4.cairo` — repetição condicional `while`.
5. `exemplo_5.cairo` — definição e chamada de função.
6. `exemplo_6.cairo` — coleção `Array<T>`.
7. `exemplo_7.cairo` — tratamento de sucesso/erro com `Result<T, E>`.
8. `exemplo_8.cairo` — formatação de `ByteArray`.
9. `exemplo_9.cairo` — cálculo aritmético.
10. `exemplo_10.cairo` — algoritmo de Euclides para o máximo divisor comum.

## Exercícios

Cada arquivo de exercício contém uma solução distinta e comentários em português. Os exercícios cobrem, em ordem, uma mensagem de estudo, variáveis tipadas, paridade, laço `for`, função de dobro, operações com `Array<T>`, validação com `Result`, formatação de texto, fatorial e seleção do maior entre três valores.

## Compilar e executar um arquivo

Cada fonte está no diretório plano do repositório; por isso, execute um arquivo por vez em um pacote Scarb. Instale Scarb seguindo o [guia oficial](https://docs.swmansion.com/scarb/download.html). O template oficial cria o manifesto, o target executável e a dependência `cairo_execute` necessários. Por exemplo, a partir da raiz do repositório:

```sh
scarb new /tmp/cairo-exemplo --name cairo_exemplo --no-vcs --test-runner none
cp linguagens/CAIRO/exemplo_1.cairo /tmp/cairo-exemplo/src/hello_world.cairo
cd /tmp/cairo-exemplo
scarb build
scarb execute --print-program-output
```

Para testar outro fonte, substitua o caminho `exemplo_1.cairo` pelo arquivo desejado e copie-o para `src/hello_world.cairo` no pacote temporário. O comando `scarb execute` compila o pacote antes de executá-lo. Consulte o [guia oficial de pacotes executáveis](https://docs.swmansion.com/scarb/docs/guides/creating-executable-package.html) e o [Cairo Book](https://www.starknet.io/cairo-book/) para mais detalhes. [3] [4]

## Referências

1. [StarkWare — Open Sourcing Cairo 1.0](https://starkware.co/blog/open-sourcing-cairo-1-0/)
2. [Cairo Graphics — biblioteca gráfica homônima](https://www.cairographics.org/)
3. [Scarb — Download and Install](https://docs.swmansion.com/scarb/download.html) e [Defining an Executable Package](https://docs.swmansion.com/scarb/docs/guides/creating-executable-package.html)
4. [Cairo Book — linguagem Cairo](https://www.starknet.io/cairo-book/)
