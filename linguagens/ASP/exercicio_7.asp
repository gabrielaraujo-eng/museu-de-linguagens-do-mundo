<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_7.asp - divisões protegidas contra divisor zero
'
' Enunciado: calcular o quociente de vários pares de números, incluindo
' pares com divisor zero, sem que a página seja interrompida, e informar
' o número e a descrição do erro quando ele ocorrer.
'
' Resolução: On Error Resume Next antes do cálculo, teste de Err.Number
' logo depois, Err.Clear para limpar o estado e On Error GoTo 0 ao final
' para restaurar o comportamento normal.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim dividendos, divisores, i, quociente, erroNumero, erroTexto
Dim sucessos, falhas

dividendos = Array(10, 7, 9, 5, 100, 3)
divisores = Array(2, 0, 3, 0, 4, 6)

sucessos = 0
falhas = 0

Function FormatarQuociente(valor)
    If IsNull(valor) Then
        FormatarQuociente = "-"
    Else
        FormatarQuociente = FormatNumber(valor, 3)
    End If
End Function
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 7 - divisão protegida</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 46rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #bbb; padding: .35rem .7rem; text-align: left; }
th { background: #eee; }
.erro { color: #9b1c1c; }
</style>
</head>
<body>
<h1>Exercício 7: divisão com tratamento de erro</h1>

<table>
<tr><th>Dividendo</th><th>Divisor</th><th>Quociente</th><th>Situação</th></tr>
<%
For i = 0 To UBound(dividendos)
    quociente = Null
    erroNumero = 0
    erroTexto = ""

    On Error Resume Next
    quociente = dividendos(i) / divisores(i)
    If Err.Number <> 0 Then
        erroNumero = Err.Number
        erroTexto = Err.Description
        quociente = Null
        Err.Clear
    End If
    On Error GoTo 0

    Response.Write "<tr><td>" & dividendos(i) & "</td><td>" & divisores(i) & "</td>"
    Response.Write "<td>" & FormatarQuociente(quociente) & "</td>"

    If erroNumero <> 0 Then
        falhas = falhas + 1
        Response.Write "<td class=""erro"">erro " & erroNumero & ": " & Server.HTMLEncode(erroTexto) & "</td>"
    Else
        sucessos = sucessos + 1
        Response.Write "<td>ok</td>"
    End If
    Response.Write "</tr>"
Next
%>
</table>

<h2>Resumo</h2>
<ul>
<li>Divisões bem-sucedidas: <%= sucessos %></li>
<li>Divisões com erro capturado: <%= falhas %></li>
<li><code>Err.Number</code> ao final do laço: <%= Err.Number %></li>
</ul>

<p>Resultado esperado: quatro divisões corretas (5, 3, 25 e 0,5) e duas falhas
com erro 11 ("Division by zero"), sem que a página seja interrompida. O valor
de <code>Err.Number</code> ao final é 0 porque cada erro foi limpo com
<code>Err.Clear</code>.</p>

<p>Observação: <code>On Error Resume Next</code> não captura erro de compilação
nem falha de componente COM sem tratamento próprio; nesses casos o IIS usa a
página de erro configurada na aplicação, que pode exibir o objeto
<code>ASPError</code>.</p>
</body>
</html>
