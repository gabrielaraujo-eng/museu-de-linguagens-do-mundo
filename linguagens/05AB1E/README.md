# 05AB1E

**Ano de criação:** não confirmado pelas fontes consultadas.

## Descrição

05AB1E é uma linguagem esotérica de *code golf* baseada em pilha. Os programas são sequências de comandos, em grande parte caracteres individuais, que consomem e produzem valores na pilha. Os arquivos desta pasta usam a extensão convencional `.abe`.

A saída do topo da pilha é automática quando o programa não usa um comando explícito de impressão. Os arquivos desta pasta são código de entrada, não comentários: as explicações ficam neste README.

## Exemplos incluídos

Os exemplos são pequenos programas executáveis e usam conceitos reais da linguagem:

1. **[exemplo_1.abe](exemplo_1.abe)** — literal de string e saída automática.
2. **[exemplo_2.abe](exemplo_2.abe)** — literais numéricos e soma na pilha (não é declaração de variáveis ou tipos).
3. **[exemplo_3.abe](exemplo_3.abe)** — comparação maior que (`›`) e bloco condicional (`i ... }`).
4. **[exemplo_4.abe](exemplo_4.abe)** — laço finito `F`, variável de laço `N` e impressão com `,`.
5. **[exemplo_5.abe](exemplo_5.abe)** — transformação numérica: `n` calcula o quadrado de um operando (não é definição de função).
6. **[exemplo_6.abe](exemplo_6.abe)** — lista inclusiva de `1` até `n` com `L`.
7. **[exemplo_7.abe](exemplo_7.abe)** — divisão com operandos válidos; não demonstra tratamento de erros.
8. **[exemplo_8.abe](exemplo_8.abe)** — concatenação de strings com `+`.
9. **[exemplo_9.abe](exemplo_9.abe)** — raiz quadrada com `t`.
10. **[exemplo_10.abe](exemplo_10.abe)** — geração de primos até um limite com `ÅP`.

Os exercícios seguem os mesmos temas, mas usam entradas diferentes para não serem cópias dos exemplos.

## Como executar

O interpretador oficial requer Elixir 1.9 ou superior. A partir de uma cópia do interpretador:

```sh
git clone https://github.com/Adriandmen/05AB1E.git
cd 05AB1E
mix local.hex
mix deps.get
MIX_ENV=prod mix escript.build
escript osabie /caminho/para/museu-de-linguagens-do-mundo/linguagens/05AB1E/exemplo_1.abe
```

Troque o nome do arquivo para executar outro exemplo ou exercício. A opção `-d`/`--debug` pode ajudar a inspecionar a pilha. Para programas que usem entrada, forneça os dados pela entrada padrão, por exemplo `escript osabie programa.abe < inputs`.

## Validação nesta cópia

A revisão local é estática: confirma que os 20 arquivos terminam em `.abe`, são arquivos de uma linha, não contêm os laços infinitos dos rascunhos e não usam `>` como comparação. O executável `osabie`, o Elixir e o `mix` não estão instalados nesta sandbox; portanto nenhum arquivo foi compilado ou executado aqui. A validação dinâmica deve ser feita após instalar o interpretador oficial e, para qualquer programa potencialmente iterativo, usando um limite como `timeout 5s`.

## Fontes

- [Interpretador oficial](https://github.com/Adriandmen/05AB1E)
- [Referência oficial de comandos](https://github.com/Adriandmen/05AB1E/blob/master/docs/info.txt)
- [Wiki de comandos](https://github.com/Adriandmen/05AB1E/wiki/Commands)
- Relatório de auditoria: `/home/ubuntu/batch1-research/01-05ab1e.md`
