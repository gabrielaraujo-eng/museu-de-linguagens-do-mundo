# C#

**Primeira versão:** C# 1.0 foi lançada em janeiro de 2002.

## Descrição

C# é uma linguagem de programação de propósito geral para a plataforma .NET. Os exemplos e exercícios desta pasta são fontes independentes em C#; compile e execute um arquivo por vez.

## Exemplos

1. `exemplo_1.cs` — saída com ponto de entrada clássico
2. `exemplo_2.cs` — variáveis e interpolação de strings
3. `exemplo_3.cs` — decisão com `if`
4. `exemplo_4.cs` — repetição com `for`
5. `exemplo_5.cs` — função local
6. `exemplo_6.cs` — lista genérica
7. `exemplo_7.cs` — tratamento de `FormatException`
8. `exemplo_8.cs` — interpolação de strings
9. `exemplo_9.cs` — cálculo com `Math.Sqrt`
10. `exemplo_10.cs` — classe, propriedade e instanciação

## Exercícios demonstrativos

1. `exercicio_1.cs` — mensagem
2. `exercicio_2.cs` — valor booleano
3. `exercicio_3.cs` — seleção com `switch`
4. `exercicio_4.cs` — iteração com `foreach`
5. `exercicio_5.cs` — método assíncrono local
6. `exercicio_6.cs` — dicionário genérico
7. `exercicio_7.cs` — lançamento e tratamento de exceção
8. `exercicio_8.cs` — conversão para minúsculas
9. `exercicio_9.cs` — valor absoluto
10. `exercicio_10.cs` — leitura de arquivo de texto

Cada fonte contém um comentário breve em português e funciona de forma independente. Os exemplos não formam um único projeto: vários usam instruções top-level, que devem ser compiladas em unidades separadas.

## Compilação e execução

É necessário o .NET 10 SDK (10.0.100 ou posterior), que oferece apps baseados em arquivo. A partir da raiz do repositório, compile e execute um arquivo por vez:

```sh
dotnet run --file "linguagens/C#/exemplo_1.cs"
```

Repita o comando para outro arquivo, alterando o caminho; não passe vários `.cs` juntos. Os fontes usam somente a biblioteca padrão do .NET, sem pacotes NuGet externos. `exercicio_10.cs` procura `t.txt` no diretório de trabalho; se o arquivo não existir, informa isso na saída de erro.
