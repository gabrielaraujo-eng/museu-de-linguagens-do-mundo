<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_4.asp - laços de repetição
'
' VBScript oferece For ... Next (com Step), For Each ... Next para
' coleções e arrays, Do While ... Loop, Do ... Loop Until e o antigo
' While ... Wend, mantido por compatibilidade com o Basic clássico.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim i, soma, produto, contador
Dim frutas, fruta

' For com Step positivo
soma = 0
For i = 1 To 10 Step 2
    soma = soma + i
Next

' For com Step negativo (contagem regressiva)
produto = 1
For i = 5 To 1 Step -1
    produto = produto * i
Next

' For Each percorre os elementos de um array ou de uma coleção
frutas = Array("banana", "manga", "caju", "goiaba")

' Do While: testa antes de executar
contador = 0
Do While contador < 3
    contador = contador + 1
Loop

' Do ... Loop Until: testa depois, executa ao menos uma vez
Dim tentativas
tentativas = 0
Do
    tentativas = tentativas + 1
Loop Until tentativas >= 3

' While ... Wend: equivalente a Do While, forma histórica
Dim restante
restante = 3
While restante > 0
    restante = restante - 1
Wend

' Exit For e Exit Do interrompem o laço antes do fim
Dim achado, procurado
procurado = "caju"
achado = -1
For i = LBound(frutas) To UBound(frutas)
    If frutas(i) = procurado Then
        achado = i
        Exit For
    End If
Next
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Laços de repetição em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 44rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; }
th { background: #eee; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Laços de repetição</h1>

<table>
<tr><th>Construção</th><th>Resultado</th></tr>
<tr><td><code>For i = 1 To 10 Step 2</code> (soma)</td><td><%= soma %></td></tr>
<tr><td><code>For i = 5 To 1 Step -1</code> (produto)</td><td><%= produto %></td></tr>
<tr><td><code>Do While contador &lt; 3</code></td><td><%= contador %> iterações</td></tr>
<tr><td><code>Do ... Loop Until</code></td><td><%= tentativas %> iterações</td></tr>
<tr><td><code>While ... Wend</code></td><td><%= restante %> restante</td></tr>
<tr><td><code>Exit For</code> ao achar "<%= procurado %>"</td><td>índice <%= achado %></td></tr>
</table>

<h2>For Each ... Next</h2>
<ul>
<%
For Each fruta In frutas
    Response.Write "<li>" & Server.HTMLEncode(fruta) & "</li>"
Next
%>
</ul>

<p>O índice do array vai de <code><%= LBound(frutas) %></code> a
<code><%= UBound(frutas) %></code>: em VBScript, <code>Array()</code> sempre cria
arrays de base zero, mas <code>LBound</code> deve ser usado quando o array vem de
outra origem.</p>
</body>
</html>
