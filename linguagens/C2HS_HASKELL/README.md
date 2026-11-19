# C2HS / Haskell FFI

**Data de criação:** não confirmada nas fontes consultadas. O ano `2000` anteriormente indicado não tem fonte verificável; o copyright do projeto upstream começa em 1999, mas isso não estabelece sua data de criação. [1]

## O que esta pasta contém

C2HS (“C to Haskell”) é uma ferramenta para gerar bindings Haskell para bibliotecas C; não é, por si só, uma linguagem de programação geral. Haskell também oferece uma Foreign Function Interface (FFI), que permite declarar chamadas a funções estrangeiras. São tecnologias relacionadas, mas não equivalentes. [1] [2] [3]

Os arquivos desta pasta têm extensão `.chs` e atualmente declaram imports FFI manuais, por exemplo `foreign import ccall`. Eles **não contêm hooks C2HS** (`{#...#}`) nem diretivas `#include`. Portanto, a extensão `.chs` e o nome da pasta não significam que essas declarações tenham sido geradas por C2HS. [2] [3]

## Arquivos

Os arquivos presentes são `exemplo_1.chs` a `exemplo_10.chs` e `exercicio_1.chs` a `exercicio_10.chs`. Eles declaram e chamam símbolos C externos, como `hello_world`, `add_numbers`, `to_uppercase` e `exercise_sort`; os nomes e assinaturas Haskell, por si sós, não provam que existam implementações C correspondentes.

## Dependências e limite de validação

Para compilar e executar estes módulos são necessários GHC e as implementações C dos símbolos importados, além de uma configuração de build que processe `.chs` quando aplicável. Para gerar bindings com C2HS também são necessários os cabeçalhos C correspondentes e hooks que relacionem os tipos e funções C aos tipos Haskell. Esta pasta não contém cabeçalhos (`.h`), fontes C ou bibliotecas dessas funções.

Sem os protótipos e contratos C, não é possível verificar a correspondência ABI dos tipos, a existência das funções, nem a propriedade e o tempo de vida de ponteiros retornados. Em particular, não se deve trocar `Int` por um tipo C específico nem liberar um `CString` retornado sem confirmar a declaração e o contrato reais. Os arquivos que usam `newCString` também precisam de esclarecimento sobre quanto tempo a função C usa o buffer de entrada; não se assume que uma chamada seja síncrona nem que o ponteiro seja retido.

Por esses motivos, as declarações FFI existentes não foram alteradas. GHC, Cabal e C2HS não estavam instalados no ambiente da auditoria e, mesmo com as ferramentas, a ausência dos cabeçalhos e implementações C impediria uma compilação/linkagem funcional verificável. Não há aqui uma instrução de execução validada; primeiro é preciso fornecer as dependências C e conferir cada assinatura com seus protótipos.

## Referências

1. [Projeto oficial C2HS no GitHub](https://github.com/haskell/c2hs)
2. [Manual oficial do C2HS](https://raw.githubusercontent.com/haskell/c2hs/master/doc/c2hs.xml)
3. [Haskell 2010 Report — Foreign Function Interface](https://www.haskell.org/onlinereport/haskell2010/haskellch8.html) e [GHC User's Guide — FFI](https://ghc.gitlab.haskell.org/ghc/doc/users_guide/exts/ffi.html)
