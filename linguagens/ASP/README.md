# ASP (Active Server Pages)

**Linhagem:** Active Server Pages, tecnologia de páginas executadas no servidor da Microsoft, apresentada em 1996
**Linguagem desta pasta:** ASP clássico com VBScript como linguagem de script padrão, executado pelo mecanismo `asp.dll` do IIS

## Descrição

Active Server Pages é o nome do ambiente de script do lado do servidor que a Microsoft distribuiu com o Internet Information Services a partir de 1996 (IIS 3.0). A página `.asp` é um documento HTML com blocos de script entre `<%` e `%>`: o IIS executa esses blocos antes de enviar a resposta, de modo que o navegador recebe apenas o HTML resultante. A linguagem de script padrão é VBScript, mas a diretiva `@ Language` também aceita JScript; esta pasta usa exclusivamente VBScript, que é o caso histórico dominante.

O modelo de programação se apoia em cinco objetos intrínsecos — `Request`, `Response`, `Server`, `Session` e `Application` — mais o objeto `ASPError` e o `ObjectContext` de transações. Não há tipos definidos pelo usuário no sentido de uma linguagem compilada: VBScript tem um único tipo de dado, `Variant`, com subtipos. O código desta pasta evita componentes COM externos, com exceção dos que já vêm com o Windows e são usados apenas de forma opcional e documentada.

ASP clássico não é ASP.NET. Apesar do nome parecido, ASP.NET (2002) é uma plataforma distinta, compilada, baseada na biblioteca `System.Web` e em linguagens como C# e VB.NET; os objetos intrínsecos têm nomes iguais, mas classes diferentes. Os arquivos desta pasta são ASP clássico e não executam em ASP.NET, nem em Python, Node.js ou PHP.

## Arquivos

Todos os arquivos são páginas completas: diretiva `@ Language`/`CodePage`, `Option Explicit`, HTML com `lang="pt-BR"`, título próprio e comentários em português. A codificação dos arquivos é UTF-8 sem BOM, e cada página declara `CodePage="65001"` e `Response.Charset = "utf-8"` para que os acentos cheguem corretamente ao navegador.

### Exemplos

1. `exemplo_1.asp` — estrutura mínima de uma página ASP, delimitadores `<% %>` e `<%= %>`, `Response.ContentType` e `Response.Charset`
2. `exemplo_2.asp` — `Dim`, atribuição, subtipos de `Variant`, `VarType` e conversões (`CInt`, `CDbl`, `CDate`, `CStr`)
3. `exemplo_3.asp` — seleção com `If ... Then ... ElseIf ... Else ... End If` e com `Select Case`
4. `exemplo_4.asp` — laços `For ... Next` com `Step`, `For Each ... Next`, `Do While ... Loop`, `Do ... Loop Until` e `While ... Wend`
5. `exemplo_5.asp` — `Function` com retorno pelo nome, recursão e `Sub` com parâmetro `ByRef`
6. `exemplo_6.asp` — arrays fixos e dinâmicos, `ReDim Preserve`, `Array`, `Split`, `Join`, `UBound` e ordenação por trocas
7. `exemplo_7.asp` — tratamento de erros com `On Error Resume Next`, `Err.Number`, `Err.Description`, `Err.Clear` e `On Error GoTo 0`
8. `exemplo_8.asp` — funções de string (`Len`, `Mid`, `InStr`, `Replace`, `UCase`, `Split`) e escape de saída com `Server.HTMLEncode`
9. `exemplo_9.asp` — funções matemáticas (`Abs`, `Sqr`, `Int`, `Fix`, `Round`, `Rnd`, `Log`) e formatação com `FormatNumber`
10. `exemplo_10.asp` — `Request.QueryString`, `Request.Form`, `Request.ServerVariables`, `Server.MapPath`, `Server.URLEncode` e formulário que envia para a própria página

### Exercícios

Cada exercício é uma página completa e resolvida, distinta dos exemplos e dos demais exercícios:

1. `exercicio_1.asp` — saudação conforme a hora do servidor e tabela com as partes de `Now`
2. `exercicio_2.asp` — conversão de Celsius para Fahrenheit com valor vindo da query string e validação com `IsNumeric`
3. `exercicio_3.asp` — classificação de números em positivo, negativo ou zero e em par ou ímpar com `Mod`
4. `exercicio_4.asp` — tabuada de 1 a 10 em tabela HTML com `For` aninhado
5. `exercicio_5.asp` — potência inteira e fatorial por `Function`, somando os fatoriais de 1 a 6
6. `exercicio_6.asp` — inversão de um array de seis notas, com maior, menor e média
7. `exercicio_7.asp` — divisões protegidas por `On Error Resume Next`, incluindo divisor zero
8. `exercicio_8.asp` — formulário `POST` que normaliza um nome e conta letras, vogais e iniciais
9. `exercicio_9.asp` — hipotenusa com `Sqr` e área de triângulo, com `FormatNumber`
10. `exercicio_10.asp` — contador de visitas com `Session` e `Application` e uso de `Application.Lock`

## Como executar

ASP clássico exige o IIS em Windows; não há interpretador de ASP clássico viável em Linux, macOS ou em servidores web que não sejam o IIS. O roteiro abaixo vale para Windows com IIS.

Habilite o recurso ASP (nome `IIS-ASP`) e copie a pasta para um diretório virtual:

```powershell
# Windows Server
Install-WindowsFeature Web-Server, Web-ASP
# Windows cliente (por exemplo, Windows 11)
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole, IIS-ASP
```

Depois, no Gerenciador do IIS, crie uma aplicação apontando para a pasta, confirme que a extensão `.asp` está mapeada para `%windir%\System32\inetsrv\asp.dll` e que "Active Server Pages" está permitido em *Restrições ISAPI e CGI*. A página é aberta por HTTP, nunca por `file://`:

```text
http://localhost/ASP/exemplo_1.asp
http://localhost/ASP/exemplo_10.asp?nome=Marta&idade=34
```

## Escopo e limitações documentadas

- **Somente VBScript:** a pasta não inclui exemplos em JScript nem em PerlScript, que o IIS também aceita via diretiva `@ Language`.
- **`#include` não é usado:** a diretiva `<!-- #include file="..." -->` é processada antes do ASP e exige um arquivo `.inc` existente ao lado da página; como esta pasta contém exatamente 21 arquivos, nenhum `.inc` é distribuído e a diretiva aparece apenas descrita aqui e no relatório. Um `#include` apontando para arquivo ausente gera erro de compilação da página.
- **Sem acesso a dados:** não há exemplos com ADODB, porque exigiriam um provedor OLE DB e um banco configurados. O objeto `Server.CreateObject` é citado apenas como o mecanismo de instanciação de componentes COM.
- **Sessão:** as páginas que usam `Session` pressupõem estado de sessão habilitado na aplicação (padrão do IIS). Com sessão desabilitada, `Session` gera erro em tempo de execução.
- **`Round` arredonda para o par mais próximo:** `Round(2.5)` resulta em 2, não em 3, comportamento diferente do de muitas linguagens.
- **Datas e números:** `FormatDateTime`, `FormatNumber` e `CDate` dependem da localidade do servidor; os exemplos usam `DateSerial` e formatos explícitos para reduzir essa dependência.
- **Tipo único:** não há `Integer`, `String` ou `Boolean` como tipos declarados; são subtipos de `Variant`, e `Option Explicit` apenas exige que toda variável seja declarada com `Dim`.

## Validação executada

**Não houve execução.** Nenhuma página desta pasta foi processada pelo IIS: o ambiente de correção é Linux, e ASP clássico não tem runtime disponível nele. A verificação feita foi exclusivamente estática, com um script próprio que conferiu, arquivo por arquivo: balanceamento dos delimitadores `<%` e `%>`, fechamento de todos os blocos (`If`/`End If`, `For`/`Next`, `Do`/`Loop`, `Function`/`End Function`, `Sub`/`End Sub`, `Select Case`/`End Select`, `While`/`Wend`), presença da diretiva `@ Language`, declaração de todas as variáveis usadas sob `Option Explicit` e uso restrito a objetos e funções documentados pela Microsoft. O resultado detalhado está em `RELATORIO.md`.

## Referências

- ASP Built-in Objects (IIS 6.0 SDK): <https://learn.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms524716(v=vs.90)>
- IIS ASP Scripting Reference: <https://learn.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms524664(v=vs.90)>
- VBScript Language Reference: <https://learn.microsoft.com/en-us/previous-versions/d1wf56tt(v=vs.85)>
- Statements (VBScript): <https://learn.microsoft.com/en-us/previous-versions/7aw9cadb(v=vs.85)>
- IIS Server Variables: <https://learn.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms524602(v=vs.90)>
