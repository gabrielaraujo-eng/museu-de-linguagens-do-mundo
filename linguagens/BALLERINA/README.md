# Ballerina

**Criação do projeto:** agosto de 2016.

## Perfil adotado

Este material usa Ballerina na variante **Swan Lake**, tomando a especificação da linguagem **2024R1** como referência de sintaxe. Ballerina é uma linguagem de programação de propósito geral, orientada a aplicações distribuídas e integração. Os arquivos-fonte usam a extensão `.bal`; cada exemplo e exercício desta pasta é um programa independente com `main`, e não depende de declarações em outros arquivos.

## Exemplos

1. [`exemplo_1.bal`](exemplo_1.bal) — imprime uma saudação.
2. [`exemplo_2.bal`](exemplo_2.bal) — declara variáveis de módulo dos tipos `string` e `int` e imprime seus valores.
3. [`exemplo_3.bal`](exemplo_3.bal) — usa `if`/`else if`/`else` para distinguir maior, igual e menor que 10.
4. [`exemplo_4.bal`](exemplo_4.bal) — percorre o intervalo inclusivo `1...5` com `foreach`.
5. [`exemplo_5.bal`](exemplo_5.bal) — declara e chama uma função que soma dois inteiros.
6. [`exemplo_6.bal`](exemplo_6.bal) — cria um array `int[]` e lê um elemento.
7. [`exemplo_7.bal`](exemplo_7.bal) — retorna `int|error` e trata o resultado com `is error`.
8. [`exemplo_8.bal`](exemplo_8.bal) — declara e imprime uma `string`.
9. [`exemplo_9.bal`](exemplo_9.bal) — calcula e imprime uma soma de inteiros.
10. [`exemplo_10.bal`](exemplo_10.bal) — ordena uma coleção com uma consulta e `order by`.

## Exercícios

Os arquivos abaixo são programas completos de referência, não templates vazios. Cada um corresponde a uma tarefa distinta; para praticar, altere os dados de entrada e confira a saída.

1. [`exercicio_1.bal`](exercicio_1.bal) — declarar e imprimir uma saudação dirigida a uma pessoa.
2. [`exercicio_2.bal`](exercicio_2.bal) — declarar e imprimir um nome (`string`) e uma idade (`int`).
3. [`exercicio_3.bal`](exercicio_3.bal) — classificar um inteiro como menor que, igual a ou maior que zero.
4. [`exercicio_4.bal`](exercicio_4.bal) — percorrer `1...5` e imprimir o quadrado de cada valor.
5. [`exercicio_5.bal`](exercicio_5.bal) — calcular a área de um retângulo por meio de uma função.
6. [`exercicio_6.bal`](exercicio_6.bal) — somar os elementos de um array de inteiros com `foreach`.
7. [`exercicio_7.bal`](exercicio_7.bal) — produzir um resultado `int|error` e reconhecer o erro.
8. [`exercicio_8.bal`](exercicio_8.bal) — armazenar e imprimir uma frase com acentos e pontuação.
9. [`exercicio_9.bal`](exercicio_9.bal) — calcular o perímetro de um retângulo.
10. [`exercicio_10.bal`](exercicio_10.bal) — ordenar valores inteiros em ordem crescente com `order by`.

## Como executar

Com a CLI Ballerina instalada, execute um arquivo por vez a partir desta pasta, por exemplo: `bal run exemplo_1.bal`. Cada arquivo tem seu próprio `main` e deve ser executado individualmente.

## Validação e limites

A auditoria e a revisão desta pasta foram estáticas, com base na documentação oficial e na especificação 2024R1. Nesta sessão não havia `bal` nem `ballerina` no `PATH`; por isso os programas não foram compilados nem executados. Nenhuma dependência foi instalada.

## Referências

- [Fundamentos da linguagem](https://ballerina.io/learn/language-basics/)
- [Especificação Ballerina 2024R1](https://ballerina.io/spec/lang/2024R1/)
- [Exemplo oficial: Hello world](https://ballerina.io/learn/by-example/hello-world/)
- [Exemplo oficial: if statement](https://ballerina.io/learn/by-example/if-statement/)
- [Guia oficial Get started](https://ballerina.io/learn/get-started/)
- [Site oficial da linguagem](https://ballerina.io/)
- [Anúncio WSO2 da disponibilidade geral de Swan Lake](https://wso2.com/about/news/ballerina-language-swan-lake-ga/)
