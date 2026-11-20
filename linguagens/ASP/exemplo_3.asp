<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_3.asp - controle de fluxo: If/ElseIf/Else e Select Case
'
' If ... Then ... End If pode ocupar várias linhas (forma em bloco) ou
' uma única linha sem End If (forma de linha única). Aqui usamos a forma
' em bloco, que é a recomendada quando há mais de um comando no ramo.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim nota, frequencia, conceito, situacao, aviso

nota = 7.5
frequencia = 0.82

If nota >= 9 Then
    conceito = "A"
ElseIf nota >= 7 Then
    conceito = "B"
ElseIf nota >= 5 Then
    conceito = "C"
Else
    conceito = "D"
End If

' Select Case compara uma expressão com listas de valores. Case aceita
' vários valores separados por vírgula e a cláusula Case Is para comparar.
Select Case conceito
    Case "A"
        situacao = "Aprovado com distinção"
    Case "B", "C"
        situacao = "Aprovado"
    Case Else
        situacao = "Reprovado por nota"
End Select

Select Case frequencia
    Case Is < 0.75
        aviso = "Frequência insuficiente, mesmo com nota suficiente."
        situacao = "Reprovado por frequência"
    Case Is < 0.85
        aviso = "Frequência no limite mínimo de atenção."
    Case Else
        aviso = "Frequência regular."
End Select

' Forma de linha única, útil para atribuições curtas.
Dim rotulo
If nota >= 7 Then rotulo = "acima da média" Else rotulo = "abaixo da média"
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Controle de fluxo em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 44rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; }
th { background: #eee; }
</style>
</head>
<body>
<h1>If / ElseIf / Else e Select Case</h1>

<table>
<tr><th>Nota</th><td><%= nota %></td></tr>
<tr><th>Frequência</th><td><%= FormatPercent(frequencia, 0) %></td></tr>
<tr><th>Conceito</th><td><%= conceito %></td></tr>
<tr><th>Situação</th><td><%= situacao %></td></tr>
<tr><th>Observação</th><td><%= aviso %></td></tr>
<tr><th>Comparação</th><td>A nota está <%= rotulo %></td></tr>
</table>

<h2>Faixas usadas</h2>
<ul>
<li><code>nota &gt;= 9</code> gera conceito A</li>
<li><code>nota &gt;= 7</code> gera conceito B</li>
<li><code>nota &gt;= 5</code> gera conceito C</li>
<li>qualquer outro valor gera conceito D</li>
</ul>

<p>Observação: VBScript não tem o operador ternário <code>? :</code> de C nem a função
<code>IIf</code> do VBA; a forma de linha única com <code>If ... Then ... Else ...</code>
é o substituto direto.</p>
</body>
</html>
