<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_6.asp - inverter um array e calcular estatísticas
'
' Enunciado: guardar seis notas em um array, mostrar a ordem original e
' a invertida, e calcular maior, menor e média.
'
' Resolução: a inversão usa dois índices que caminham em sentidos opostos
' e uma variável temporária. Maior e menor começam no primeiro elemento,
' nunca em zero, para funcionar com notas negativas.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim notas(5), invertido(5), i, j, temp
notas(0) = 7.5
notas(1) = 9
notas(2) = 4.5
notas(3) = 10
notas(4) = 6
notas(5) = 8.5

' Cópia antes de inverter, para preservar o original.
For i = 0 To UBound(notas)
    invertido(i) = notas(i)
Next

' Inversão no próprio array: i cresce, j decresce, param no meio.
i = 0
j = UBound(invertido)
Do While i < j
    temp = invertido(i)
    invertido(i) = invertido(j)
    invertido(j) = temp
    i = i + 1
    j = j - 1
Loop

Dim maior, menor, soma, media
maior = notas(0)
menor = notas(0)
soma = 0
For i = 0 To UBound(notas)
    If notas(i) > maior Then maior = notas(i)
    If notas(i) < menor Then menor = notas(i)
    soma = soma + notas(i)
Next
media = soma / (UBound(notas) + 1)

' Quantas notas ficaram acima da média.
Dim acima, posicaoMaior
acima = 0
posicaoMaior = 0
For i = 0 To UBound(notas)
    If notas(i) > media Then acima = acima + 1
    If notas(i) = maior Then posicaoMaior = i
Next
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 6 - inversão e estatísticas</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 42rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .8rem; text-align: center; }
th { background: #eee; }
</style>
</head>
<body>
<h1>Exercício 6: inverter notas e resumir</h1>

<table>
<tr><th>Índice</th><% For i = 0 To 5 %><th><%= i %></th><% Next %></tr>
<tr><th>Original</th><% For i = 0 To 5 %><td><%= notas(i) %></td><% Next %></tr>
<tr><th>Invertido</th><% For i = 0 To 5 %><td><%= invertido(i) %></td><% Next %></tr>
</table>

<h2>Estatísticas</h2>
<table>
<tr><th>Maior nota</th><td><%= maior %></td></tr>
<tr><th>Menor nota</th><td><%= menor %></td></tr>
<tr><th>Soma</th><td><%= soma %></td></tr>
<tr><th>Média</th><td><%= FormatNumber(media, 2) %></td></tr>
<tr><th>Notas acima da média</th><td><%= acima %></td></tr>
<tr><th>Índice da maior nota</th><td><%= posicaoMaior %></td></tr>
</table>

<p>Resultado esperado: original 7,5 / 9 / 4,5 / 10 / 6 / 8,5; invertido
8,5 / 6 / 10 / 4,5 / 9 / 7,5; maior 10, menor 4,5, soma 45,5, média 7,58,
três notas acima da média, índice da maior nota 3.</p>
</body>
</html>
