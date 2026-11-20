<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_5.asp - potência inteira e fatorial com Function
'
' Enunciado: escrever uma Function que calcule potência de base inteira
' com expoente não negativo, outra que calcule fatorial por recursão, e
' somar os fatoriais de 1 a 6.
'
' Resolução: a potência é feita por laço (o operador ^ também existe e
' trabalha em Double); o fatorial é recursivo e devolve 1 no caso base.
' Atenção: fatorial cresce rápido; 13! já não cabe em Long.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Function Potencia(base, expoente)
    Dim resultado, k
    If expoente < 0 Then
        Potencia = Null
        Exit Function
    End If
    resultado = 1
    For k = 1 To expoente
        resultado = resultado * base
    Next
    Potencia = resultado
End Function

Function Fatorial(n)
    If n < 0 Then
        Fatorial = Null
    ElseIf n <= 1 Then
        Fatorial = 1
    Else
        Fatorial = n * Fatorial(n - 1)
    End If
End Function

Dim i, somaFatoriais, valor
Dim tabela(6, 2)

For i = 1 To 6
    tabela(i - 1, 0) = i
    tabela(i - 1, 1) = Fatorial(i)
Next

somaFatoriais = 0
For i = 0 To 5
    somaFatoriais = somaFatoriais + tabela(i, 1)
Next

' Demonstração de que a Function trata entrada inválida sem quebrar a página.
valor = Potencia(2, -1)
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 5 - potência e fatorial</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 42rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .8rem; text-align: right; }
th { background: #eee; text-align: left; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Exercício 5: potência inteira e fatorial</h1>

<h2>Potência</h2>
<ul>
<li><code>Potencia(2, 10)</code> = <%= Potencia(2, 10) %></li>
<li><code>Potencia(3, 4)</code> = <%= Potencia(3, 4) %></li>
<li><code>Potencia(5, 0)</code> = <%= Potencia(5, 0) %></li>
<li><code>Potencia(2, -1)</code> = <%= valor %> (Null, expoente inválido)</li>
<li><code>2 ^ 10</code> = <%= 2 ^ 10 %> (operador nativo, resultado Double)</li>
</ul>

<h2>Fatoriais de 1 a 6</h2>
<table>
<tr><th>n</th><th>n!</th></tr>
<%
For i = 0 To 5
    Response.Write "<tr><td>" & tabela(i, 0) & "</td><td>" & tabela(i, 1) & "</td></tr>"
Next
%>
<tr><th>Soma</th><td><%= somaFatoriais %></td></tr>
</table>

<p>Resultado esperado: 1! = 1, 2! = 2, 3! = 6, 4! = 24, 5! = 120, 6! = 720;
soma = 873. A chamada com expoente negativo devolve Null em vez de gerar
erro de execução, e <code>IsNull</code> é o teste adequado para esse retorno.</p>
</body>
</html>
