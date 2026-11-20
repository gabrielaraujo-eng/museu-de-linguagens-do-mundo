# AsciiDoc

**Linhagem:** marcação leve para documentação técnica, derivada do AsciiDoc original (Stuart Rackham, 2002) e alternativa de autoria ao DocBook
**Linguagem desta pasta:** AsciiDoc, conforme a especificação do projeto AsciiDoc Language (Eclipse Foundation) e o comportamento do Asciidoctor 2.0.20, usado na validação

## Descrição

AsciiDoc é uma linguagem de marcação, não de programação. Ela descreve a estrutura de um documento em texto puro e legível: título, seções, listas, tabelas, blocos de código, notas de advertência, referências cruzadas. Não existem variáveis mutáveis, laços nem funções em tempo de execução; o que existe é uma etapa de conversão, feita por um processador, que lê o arquivo `.adoc` e grava HTML, DocBook, PDF ou EPUB.

Três mecanismos costumam ser confundidos com programação. Os atributos (`:nome: valor`, usados como `{nome}`) substituem texto durante a conversão. Os includes (`include::arquivo[]`) montam o documento a partir de partes antes de qualquer outra etapa. As condicionais (`ifdef`, `ifndef`, `ifeval`) selecionam trechos nessa mesma etapa de montagem. Em todos os casos o resultado é estático: nada é avaliado quando o leitor abre o documento.

## Arquivos

Todos os exemplos e exercícios usam a extensão `.adoc`. Este README permanece em Markdown, seguindo a convenção do restante do repositório.

### Exemplos

1. `exemplo_1.adoc` — cabeçalho de documento, título de nível 0, atributos e parágrafos; contém as regiões marcadas reaproveitadas pelo Exemplo 5
2. `exemplo_2.adoc` — atributos de documento, atributos embutidos e condicionais `ifdef`, `ifndef` e `ifeval`
3. `exemplo_3.adoc` — níveis de seção, sumário automático, numeração, âncoras explícitas e referências cruzadas internas e entre documentos
4. `exemplo_4.adoc` — listas não ordenadas, ordenadas, de descrição, de verificação e itens com blocos anexados
5. `exemplo_5.adoc` — composição com `include::`, regiões marcadas por `tag=`, `leveloffset` e seleção por linhas
6. `exemplo_6.adoc` — tabelas com cabeçalho, proporção e alinhamento de colunas, células mescladas e conteúdo AsciiDoc em célula
7. `exemplo_7.adoc` — as cinco admonições, em linha, em bloco com título, com identificador e dentro de lista
8. `exemplo_8.adoc` — ênfase, monoespaçado, sobrescrito, substituições tipográficas, `kbd`, `footnote`, links e imagens em linha
9. `exemplo_9.adoc` — blocos literais e de listagem, `[source,...]`, fórmulas sem a extensão `stem` e tabela de resultados numéricos
10. `exemplo_10.adoc` — blocos de exemplo, lateral, citação, aberto, listagem com callouts, imagem em bloco e comentários de bloco

### Exercícios

Cada exercício é um documento completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1.adoc` — documento mínimo com cabeçalho completo e dois parágrafos em seções próprias
2. `exercicio_2.adoc` — ficha catalográfica com valores vindos de atributos e apêndice condicional
3. `exercicio_3.adoc` — manual com sumário automático, seções numeradas e referências cruzadas por âncora
4. `exercicio_4.adoc` — roteiro de revisão com lista de verificação, passos numerados aninhados e glossário
5. `exercicio_5.adoc` — caderno montado por dois includes de regiões marcadas do Exemplo 1
6. `exercicio_6.adoc` — tabela de notas com cabeçalho, colunas proporcionais, alinhamento e linha de total mesclada
7. `exercicio_7.adoc` — guia de publicação que usa as cinco admonições em contextos diferentes
8. `exercicio_8.adoc` — glossário com marcas em linha, atalhos com `kbd` e nota de rodapé
9. `exercicio_9.adoc` — relatório de medições com dados em bloco literal, fórmula como passagem e tabela de resultados
10. `exercicio_10.adoc` — artigo com bloco de exemplo, nota lateral, citação, listagem comentada e referência interna

## Como renderizar

A implementação usada para validar esta pasta é o Asciidoctor 2.0.20, distribuído no pacote `asciidoctor` de Debian e Ubuntu. Não existe um comando único para todos os processadores de AsciiDoc; os passos abaixo valem para essa implementação.

```sh
sudo apt-get install -y asciidoctor
asciidoctor --version
asciidoctor -o /tmp/saida.html exemplo_1.adoc
asciidoctor -a toc=left -o /tmp/saida3.html exemplo_3.adoc
```

O primeiro comando gera HTML5 em `/tmp/saida.html`. A opção `-a` define atributos na linha de comando, sobrepondo o cabeçalho; `-b docbook` troca o formato de saída e `-D pasta` escolhe o diretório de destino.

## Escopo e limitações documentadas

- **Extensão:** a especificação não fixa sufixo de arquivo. `.adoc` é a convenção desta pasta; `.asciidoc` e `.asc` são igualmente aceitos pelo processador.
- **README em Markdown:** este arquivo não é AsciiDoc e, por isso, fica fora da validação por conversão. É o único arquivo da pasta nessa situação.
- **Includes dependentes de pasta:** `exemplo_5.adoc` e `exercicio_5.adoc` incluem regiões marcadas de `exemplo_1.adoc` e precisam ser convertidos na mesma pasta. Se a região for renomeada no arquivo de origem, a conversão falha com erro, e não com texto faltando em silêncio.
- **Diretivas em exemplos:** o processador resolve `include::` mesmo dentro de blocos de listagem, antes de interpretar os delimitadores. Por isso os exemplos de include mostrados como texto usam `\include::`, com barra invertida.
- **Sem `stem`:** a renderização de fórmulas exige a extensão `asciidoctor-mathematical`, que não faz parte da instalação padrão. As fórmulas desta pasta aparecem como passagens em linha (`+...+`) ou em blocos literais.
- **Sem macros de mídia:** `video::` e `audio::` não pertencem ao núcleo da linguagem e dependem de extensões; não são usados.
- **Ícones:** `exemplo_7.adoc` e `exercicio_7.adoc` declaram `:icons: font`, que troca os rótulos textuais das admonições por ícones da folha Font Awesome. Sem essa folha disponível na página, os rótulos aparecem como texto.
- **Imagens remotas:** as duas imagens usadas apontam para `asciidoctor.org`; a conversão não falha sem rede, mas a imagem não é exibida.
- **Referências cruzadas entre documentos:** o processador não valida o identificador de destino ao gerar HTML. Um `xref` para uma âncora inexistente produz link quebrado, sem aviso.

## Validação executada

Os 20 arquivos `.adoc` foram convertidos individualmente com `asciidoctor -o /tmp/saida_<nome>.html <arquivo>`: 20 de 20 terminaram com código 0 e sem nenhuma mensagem de aviso ou erro na saída padrão de diagnóstico. A primeira rodada reprovou dois arquivos, ambos corrigidos: `exemplo_3.adoc` atribuía duas vezes o mesmo identificador, porque a sintaxe de âncora citada no texto era interpretada como âncora real, e `exemplo_5.adoc` tentava resolver um `include::` usado como exemplo dentro de um bloco de listagem. O detalhamento dos comandos e resultados está em `RELATORIO.md`.

## Referências

- Referência rápida de sintaxe: <https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/>
- Cabeçalho de documento: <https://docs.asciidoctor.org/asciidoc/latest/document/header/>
- Atributos e condicionais: <https://docs.asciidoctor.org/asciidoc/latest/attributes/document-attributes/>
- Inclusão de arquivos: <https://docs.asciidoctor.org/asciidoc/latest/directives/include/>
- Especificação da linguagem AsciiDoc: <https://gitlab.eclipse.org/eclipse/asciidoc-lang/asciidoc-lang>
- Asciidoctor: <https://asciidoctor.org/>
- AsciiDoc original, de Stuart Rackham: <https://asciidoc.org/>
