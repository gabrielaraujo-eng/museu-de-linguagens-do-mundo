# ClojureScript

Esta pasta contém fontes `.cljs` de ClojureScript. A série `exemplo_11.cljs`–`exemplo_20.cljs` e `exercicio_11.cljs`–`exercicio_20.cljs` foi migrada da pasta `CALCIT`, cuja extensão e sintaxe já eram ClojureScript, não o formato de projeto Calcit/Cirru. Esses vinte arquivos foram revisados e compilados/executados individualmente com ClojureScript 1.12.134 e Node.js, seguindo o [Quick Start do ClojureScript](https://clojurescript.org/guides/quick-start) e seu [repositório oficial](https://github.com/clojure/clojurescript). A distinção de formato segue a documentação do [projeto Calcit](https://github.com/calcit-lang/calcit) e do [guia de sintaxe Cirru](https://guide.calcit-lang.org/cirru-syntax.html).

Os arquivos `exemplo_1.cljs`–`exemplo_10.cljs` e `exercicio_1.cljs`–`exercicio_10.cljs` já existiam nesta pasta antes da migração. Eles não foram alterados nem validados nesta revisão. Esta revisão não afirma que essa série legada seja um conjunto de exemplos ClojureScript completos.

## Exemplos migrados e validados

- `exemplo_11.cljs` — saudação com `println`.
- `exemplo_12.cljs` — valores nomeados e construção de texto.
- `exemplo_13.cljs` — expressão condicional `if`.
- `exemplo_14.cljs` — repetição com `loop`, `when` e `recur`.
- `exemplo_15.cljs` — definição e chamada de função.
- `exemplo_16.cljs` — vetor e operações `first`/`count`.
- `exemplo_17.cljs` — captura de uma exceção JavaScript e leitura de `Error.message`.
- `exemplo_18.cljs` — chamada de método de string JavaScript.
- `exemplo_19.cljs` — raiz quadrada por interop com `js/Math`.
- `exemplo_20.cljs` — ordenação de uma coleção com `sort`.

## Exercícios migrados e validados

- `exercicio_11.cljs` — saudação.
- `exercicio_12.cljs` — soma de dois valores.
- `exercicio_13.cljs` — classificação de idade.
- `exercicio_14.cljs` — contagem com `loop` e `recur`.
- `exercicio_15.cljs` — função de dobro.
- `exercicio_16.cljs` — junção de textos com `clojure.string/join`.
- `exercicio_17.cljs` — exceção e propriedade `message`.
- `exercicio_18.cljs` — conversão para minúsculas.
- `exercicio_19.cljs` — potência por interop com `js/Math`.
- `exercicio_20.cljs` — ordenação de palavras.

Os acessos a JavaScript usam a sintaxe de interop de ClojureScript. Em particular, `Math` é acessado pelo namespace especial `js`, e o texto de um objeto `Error` é lido pela propriedade `message`, não por `getMessage`, conforme a [documentação de interop do ClojureScript](https://clojurescript.org/about/differences) e a referência de [Error no MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error).

## Compilar e executar um arquivo migrado

A Clojure CLI e Java são necessários para buscar o compilador ClojureScript. Node.js executa o JavaScript gerado. A CLI pode ser instalada pelas [instruções oficiais](https://clojure.org/guides/install_clojure).

Exemplo para compilar e executar `exemplo_11.cljs`:

```sh
mkdir -p /tmp/clojurescript-demo/src
cp linguagens/CLOJURESCRIPT/exemplo_11.cljs /tmp/clojurescript-demo/src/exemplo_11.cljs
cat > /tmp/clojurescript-demo/deps.edn <<'EOF'
{:paths ["src"]
 :deps {org.clojure/clojurescript {:mvn/version "1.12.134"}}}
EOF
cd /tmp/clojurescript-demo
clojure -M -m cljs.main \
  -co '{:target :nodejs :output-to "out/main.js" :output-dir "out" :main exemplo-11}' \
  -c exemplo-11
node out/main.js
```

Para outro arquivo da série validada, copie-o para `src/` com o nome de arquivo correspondente e substitua o namespace após `-c` e no valor `:main` pelo nome do namespace com hífen, por exemplo `exercicio-17`. O comando usado na validação individual gerou o JavaScript em diretório temporário, executou-o com Node.js e exigiu código de saída zero.

## Referências

1. [ClojureScript — repositório oficial](https://github.com/clojure/clojurescript).
2. [ClojureScript — Quick Start](https://clojurescript.org/guides/quick-start).
3. [ClojureScript — Differences, incluindo JavaScript interop](https://clojurescript.org/about/differences).
4. [MDN — JavaScript Error](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error).
5. [Clojure — instalar a CLI](https://clojure.org/guides/install_clojure).
