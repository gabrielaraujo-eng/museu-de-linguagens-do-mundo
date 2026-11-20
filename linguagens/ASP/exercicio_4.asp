<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_4.asp - tabuada de 1 a 10 em tabela HTML
'
' Enunciado: gerar a tabuada completa de 1 a 10 em uma tabela, com a
' diagonal principal destacada.
'
' Resolução: dois For aninhados. O laço externo percorre as linhas e o
' interno as colunas; o destaque é aplicado quando linha = coluna.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim i, j, celula

' Cabeçalho da tabela, montado com Response.Write para manter o código
' junto do laço que gera as linhas.
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 4 - tabuada</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 48rem; line-height: 1.5; }
table { border-collapse: collapse; font-variant-numeric: tabular-nums; }
td, th { border: 1px solid #bbb; padding: .3rem .55rem; text-align: center; min-width: 2.2rem; }
th { background: #eee; }
td.diagonal { background: #fdf3d0; font-weight: bold; }
td.multiploCinco { color: #9b1c1c; }
</style>
</head>
<body>
<h1>Exercício 4: tabuada de 1 a 10</h1>

<p>A diagonal principal mostra os quadrados perfeitos; os múltiplos de 5
aparecem em vermelho.</p>

<table>
<%
Response.Write "<tr><th>&times;</th>"
For i = 1 To 10
    Response.Write "<th>" & i & "</th>"
Next
Response.Write "</tr>"

For i = 1 To 10
    Response.Write "<tr><th>" & i & "</th>"
    For j = 1 To 10
        celula = "<td"
        If i = j Then
            celula = celula & " class=""diagonal"""
        ElseIf (i * j) Mod 5 = 0 Then
            celula = celula & " class=""multiploCinco"""
        End If
        Response.Write celula & ">" & (i * j) & "</td>"
    Next
    Response.Write "</tr>"
Next
%>
</table>

<h2>Verificação</h2>
<ul>
<li>Quadrado de 7: <strong><%= 7 * 7 %></strong> (célula 7 x 7)</li>
<li>9 x 8: <strong><%= 9 * 8 %></strong></li>
<li>Soma da linha 3: <strong><%= 3 * 1 + 3 * 2 + 3 * 3 + 3 * 4 + 3 * 5 + 3 * 6 + 3 * 7 + 3 * 8 + 3 * 9 + 3 * 10 %></strong></li>
</ul>

<p>Resultado esperado: 100 células de produto, de 1 a 100, com 10 células na
diagonal (1, 4, 9, ..., 100). O produto é múltiplo de 5 em 36 células, das quais
2 estão na diagonal (5 x 5 e 10 x 10) e 34 estão fora dela. A soma de qualquer
linha <em>n</em> é 55 x <em>n</em>.</p>
</body>
</html>
