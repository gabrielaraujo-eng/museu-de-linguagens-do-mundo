<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_2.asp - conversão de Celsius para Fahrenheit
'
' Enunciado: ler uma temperatura em graus Celsius da query string
' (?c=30), validar a entrada e mostrar o equivalente em Fahrenheit,
' com uma tabela de referência.
'
' Resolução: Request.QueryString("c") devolve string vazia quando o
' parâmetro não existe. IsNumeric separa número de texto e CInt converte
' apenas inteiros, evitando depender do separador decimal da localidade.
' Fórmula: F = C * 9 / 5 + 32.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim entrada, celsius, fahrenheit, aviso

entrada = Request.QueryString("c")

If Trim(entrada) = "" Then
    celsius = 25
    aviso = "Nenhum valor informado; usando 25 °C como padrão."
ElseIf IsNumeric(entrada) Then
    celsius = CInt(entrada)
    aviso = "Valor lido da URL: " & Server.HTMLEncode(entrada) & " °C."
Else
    celsius = 25
    aviso = "Valor """ & Server.HTMLEncode(entrada) & """ não é numérico; usando 25 °C."
End If

fahrenheit = celsius * 9 / 5 + 32

Function Classificar(t)
    If t <= 0 Then
        Classificar = "congelante"
    ElseIf t < 15 Then
        Classificar = "frio"
    ElseIf t < 25 Then
        Classificar = "agradável"
    ElseIf t < 35 Then
        Classificar = "quente"
    Else
        Classificar = "muito quente"
    End If
End Function
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 2 - Celsius para Fahrenheit</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 42rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .7rem; text-align: right; }
th { background: #eee; text-align: left; }
.destaque { font-size: 1.4rem; }
</style>
</head>
<body>
<h1>Exercício 2: conversão de temperatura</h1>

<p class="destaque"><%= celsius %> °C = <%= FormatNumber(fahrenheit, 1) %> °F</p>
<p><%= aviso %> Classificação: <strong><%= Classificar(celsius) %></strong>.</p>

<p>Tente outro valor na URL: <code>exercicio_2.asp?c=40</code> ou
<code>exercicio_2.asp?c=-5</code>.</p>

<h2>Tabela de referência</h2>
<table>
<tr><th>Celsius</th><th>Fahrenheit</th><th>Classificação</th></tr>
<%
Dim c, i
For i = -10 To 40 Step 10
    c = i
    Response.Write "<tr><td>" & c & " °C</td><td>" & FormatNumber(c * 9 / 5 + 32, 1) & " °F</td><td>" & _
                   Classificar(c) & "</td></tr>"
Next
%>
</table>

<p>Resultado esperado para <code>?c=30</code>: 86,0 °F, classificação "quente".
Sem parâmetro, a página usa 25 °C e mostra 77,0 °F. Com texto no lugar do número,
a página não falha: cai no valor padrão e informa o motivo.</p>
</body>
</html>
