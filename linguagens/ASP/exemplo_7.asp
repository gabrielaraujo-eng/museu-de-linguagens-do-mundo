<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_7.asp - tratamento de erros em tempo de execução
'
' VBScript não tem Try/Catch. O modelo é: On Error Resume Next desvia
' do erro para a instrução seguinte, e o objeto Err guarda número,
' descrição e origem. Err.Clear limpa o estado; On Error GoTo 0 volta
' ao comportamento normal, em que o erro interrompe a página.
' On Error GoTo <rótulo> NÃO existe em VBScript: só Resume Next e GoTo 0.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

' Função que devolve o resultado de uma divisão protegida.
' Retorna Null quando o divisor é zero, sem interromper a página.
Function Dividir(a, b)
    Dim r
    On Error Resume Next
    r = a / b
    If Err.Number <> 0 Then
        Dividir = Null
        Err.Clear
    Else
        Dividir = r
    End If
    On Error GoTo 0
End Function

Dim registros(3, 1), i
' registros(i, 0) = numerador; registros(i, 1) = divisor
registros(0, 0) = 10 : registros(0, 1) = 2
registros(1, 0) = 7  : registros(1, 1) = 0
registros(2, 0) = 9  : registros(2, 1) = 3
registros(3, 0) = 5  : registros(3, 1) = 0

' Bloco que captura erros de conversão
Dim texto, numero, mensagemErro
texto = "doze"
numero = 0
On Error Resume Next
numero = CInt(texto)
If Err.Number <> 0 Then
    mensagemErro = "Erro " & Err.Number & ": " & Err.Description
    Err.Clear
Else
    mensagemErro = "Conversão aceita: " & numero
End If
On Error GoTo 0

' Depois de On Error GoTo 0, um novo erro interromperia a página;
' por isso o teste abaixo é feito com IsNumeric antes da conversão.
Dim seguro
If IsNumeric("12,5") Then
    seguro = CDbl(Replace("12,5", ",", "."))
Else
    seguro = 0
End If
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Tratamento de erros em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 44rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; }
th { background: #eee; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>On Error Resume Next e o objeto Err</h1>

<table>
<tr><th>Dividendo</th><th>Divisor</th><th>Resultado</th><th>Observação</th></tr>
<%
Dim r
For i = 0 To UBound(registros, 1)
    r = Dividir(registros(i, 0), registros(i, 1))
    Response.Write "<tr><td>" & registros(i, 0) & "</td><td>" & registros(i, 1) & "</td>"
    If IsNull(r) Then
        Response.Write "<td>-</td><td>divisão por zero capturada (erro 11)</td></tr>"
    Else
        Response.Write "<td>" & FormatNumber(r, 2) & "</td><td>ok</td></tr>"
    End If
Next
%>
</table>

<h2>Erro de conversão</h2>
<p><%= mensagemErro %></p>
<p><code>Err.Number</code> depois de <code>Err.Clear</code>: <strong><%= Err.Number %></strong></p>

<h2>Conversão segura</h2>
<p><code>CDbl("12,5" com vírgula trocada por ponto)</code> = <%= seguro %></p>

<p>Para erros de compilação da própria página, ou para registrar a falha de forma
centralizada, o IIS oferece o objeto <code>ASPError</code> por meio de uma página de
erro personalizada configurada na aplicação — <code>On Error Resume Next</code> não
captura erro de sintaxe.</p>
</body>
</html>
