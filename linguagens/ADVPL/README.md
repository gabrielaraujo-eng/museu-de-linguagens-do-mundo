# ADVPL

**Origem:** linguagem proprietária da TOTVS, baseada em xBase. O ano exato de criação não é afirmado aqui porque não foi confirmado nas fontes consultadas.

## Descrição

Esta pasta contém exemplos e exercícios didáticos de AdvPL. Os fontes destinados ao fluxo de desenvolvimento usam a extensão `.prw`, normalmente aberta e compilada no TOTVS Developer Studio (TDS) com o TOTVS Application Server. O código compilado é publicado como APO no RPO do ambiente Protheus.

AdvPL é a linguagem; `Protheus.ch`/`TOTVS.ch` são headers de pré-processador; e funções como `MsgInfo`, `MsgAlert`, `Alert`, `ConOut`, `DBSelectArea` e `RPCConnect` pertencem ao runtime ou ao ecossistema Protheus. Portanto, estes arquivos não são programas independentes de um ambiente Protheus.

## Exemplos incluídos

1. **exemplo_1.prw** — rotina de apresentação com `MsgInfo`
2. **exemplo_2.prw** — variáveis e tipos
3. **exemplo_3.prw** — controle de fluxo
4. **exemplo_4.prw** — laço `While` e `EndDo`
5. **exemplo_5.prw** — função estática e chamada
6. **exemplo_6.prw** — array e `AAdd`
7. **exemplo_7.prw** — sequência com recuperação de erro
8. **exemplo_8.prw** — manipulação de strings
9. **exemplo_9.prw** — matemática
10. **exemplo_10.prw** — acesso a área de trabalho Protheus

## Exercícios incluídos

Os exercícios `exercicio_1.prw` a `exercicio_10.prw` praticam rotinas, escopo local, controle de fluxo, arrays, strings, matemática e integração com o ambiente Protheus.

## Como usar

Leia os fontes em ordem. Cada arquivo tem uma `User Function` ou uma função auxiliar, declara suas variáveis e termina suas rotinas explicitamente. Para executar, abra os `.prw` no TDS do ambiente Protheus correspondente, verifique os includes e compile pelo Application Server. Depois publique o APO no RPO conforme o procedimento do ambiente e chame a `User Function` pelo menu, SmartClient ou rotina chamadora.

`exemplo_10.prw` requer que o alias `SA1` esteja aberto e disponível no ambiente, além do dicionário/tabelas correspondentes. `exercicio_10.prw` usa `RPCConnect` apenas como chamada dependente da configuração e da assinatura disponíveis no ambiente Protheus; não é um exemplo autônomo de AdvPL.

## Validação local

Este repositório não inclui `advpl`, `tlpp`, TDS, TOTVS Application Server, RPO ou uma instalação Protheus. Assim, os arquivos foram revisados estruturalmente, mas não foram compilados nem executados aqui. A validação definitiva deve ser feita no TDS/Application Server da versão alvo. Não misture TLPP/TL++ com estes exemplos AdvPL.
