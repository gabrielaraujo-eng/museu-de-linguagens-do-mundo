# ACTIONSCRIPT 3.0

**Origem histórica:** ActionScript surgiu na plataforma Flash e teve versões posteriores (1.0, 2.0 e 3.0). 1996 é o ano associado ao FutureSplash Animator, produto antecessor do Flash, não uma data comprovada de criação da linguagem.

## Descrição

Esta pasta apresenta fragmentos didáticos de **ActionScript 3.0 (AS3)**, a linguagem usada com Flash Player e Adobe AIR. Os arquivos usam a extensão oficial `.as`.

Os vinte arquivos são **snippets**: cada um mostra uma ideia isolada e pode exigir um corpo de função, uma classe/document class, imports ou um contexto de timeline para ser compilado. Eles não são apresentados como vinte aplicativos autônomos. As variáveis usadas nos snippets estão declaradas no próprio arquivo ou são parâmetros de uma função demonstrativa.

## Exemplos inclusos

1. **exemplo_1.as** - Saída de texto com `trace`
2. **exemplo_2.as** - Variáveis e tipos
3. **exemplo_3.as** - Controle de fluxo
4. **exemplo_4.as** - Loop `for`
5. **exemplo_5.as** - Funções
6. **exemplo_6.as** - Arrays
7. **exemplo_7.as** - Tratamento de erros
8. **exemplo_8.as** - Concatenação de strings
9. **exemplo_9.as** - Matemática
10. **exemplo_10.as** - Classe e herança

## Exercícios inclusos

Os exercícios `exercicio_1.as` a `exercicio_10.as` seguem a mesma regra: são snippets AS3 curtos, com escopo e dependências indicados no código quando necessário.

## Como compilar e executar

A compilação AS3 normalmente produz um arquivo SWF. Ela requer uma ferramenta compatível, como o compilador `mxmlc` do Apache Flex, Adobe Animate ou um AIR SDK compatível; a execução requer um runtime compatível de Flash Player ou Adobe AIR. Um arquivo `.as` não é executado diretamente por Node.js.

Exemplo de validação quando o Apache Flex estiver instalado:

```sh
mxmlc -version
mxmlc -output build/exemplo_10.swf linguagens/ACTIONSCRIPT/exemplo_10.as
```

Neste ambiente, `mxmlc`, `asc` e `redtamarin` podem não estar instalados. Nesse caso, as verificações locais são apenas estáticas (extensão, chaves balanceadas e inspeção de escopo/imports) e não substituem a compilação nem a execução em Flash Player/AIR.
