# Aldor

## Descrição

Aldor é uma linguagem de programação com tipos e domínios, usada também em computação matemática. Esta pasta contém dez exemplos progressivos e dez exercícios resolvidos. Cada programa é uma fonte independente com a extensão `.as`, reconhecida pela distribuição Aldor testada.

## Exemplos

1. `exemplo_1.as` — saída de texto.
2. `exemplo_2.as` — variáveis inteiras.
3. `exemplo_3.as` — seleção condicional.
4. `exemplo_4.as` — repetição sobre intervalo.
5. `exemplo_5.as` — funções tipadas.
6. `exemplo_6.as` — arrays e índices a partir de zero.
7. `exemplo_7.as` — exceção definida e tratada.
8. `exemplo_8.as` — concatenação de strings.
9. `exemplo_9.as` — aproximação de raiz quadrada pelo método de Newton.
10. `exemplo_10.as` — categoria e domínio que implementa sua interface.

## Exercícios resolvidos

Os arquivos `exercicio_1.as` a `exercicio_10.as` são distintos e comentados. Eles trabalham máximo entre inteiros, lógica booleana, classificação de sinal, contagem regressiva, soma tipada, percurso de lista, validação com exceção, conversão para minúsculas, valor absoluto e extensão de `Integer`.

## Compilação e execução

Os vinte arquivos foram compilados e executados com Aldor 1.4.0 para Linux x86-64, usando a raiz e as bibliotecas da distribuição oficial. Para reproduzir essa validação, ajuste os caminhos da instalação isolada e compile a partir desta pasta com:

```sh
ALDORROOT=/caminho/para/aldor/usr
ALDOR_BIN="$ALDORROOT/lib/x86_64-linux-gnu/aldor"
LIBDIR="$ALDORROOT/lib/x86_64-linux-gnu"
ALDORROOT="$ALDORROOT" "$ALDOR_BIN" -Fx -Y "$LIBDIR" -C lib=aldor exemplo_1.as
./exemplo_1
```

A arquitetura e o caminho da biblioteca podem variar entre distribuições. `ALDORROOT` deve apontar para a raiz que contém `include`, `lib` e `share`.
