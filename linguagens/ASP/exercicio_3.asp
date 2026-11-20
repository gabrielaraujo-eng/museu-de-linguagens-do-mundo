<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_3.asp - classificação de números inteiros
'
' Enunciado: percorrer uma lista de inteiros e classificar cada um como
' positivo, negativo ou zero, e também como par ou ímpar.
'
' Resolução: Select Case com Case Is para o sinal e o operador Mod para
' a paridade. Em VBScript, Mod de número negativo devolve resto negativo
' (-7 Mod 2 = -1), por isso o teste correto é "= 0" e não "= 1".

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim numeros, i, valor, sinal, paridade, classe
Dim positivos, negativos, zeros, pares

numeros = Array(-7, 0, 12, 5, -3, 8, -10, 1)

positivos = 0
negativos = 0
zeros = 0
pares = 0

Function ContarDigitos(n)
    ' Usado só para enriquecer a saída; Abs evita o sinal do "-".
    ContarDigitos = Len(CStr(Abs(n)))
End Function
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 3 - sinal e paridade</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 42rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .8rem; text-align: left; }
th { background: #eee; }
.pos { color: #1a6b2a; }
.neg { color: #9b1c1c; }
.zero { color: #555; }
</style>
</head>
<body>
<h1>Exercício 3: positivo, negativo, zero, par e ímpar</h1>

<table>
<tr><th>Valor</th><th>Sinal</th><th>Paridade</th><th>Dígitos</th></tr>
<%
For i = LBound(numeros) To UBound(numeros)
    valor = numeros(i)

    Select Case valor
        Case Is > 0
            sinal = "positivo"
            classe = "pos"
            positivos = positivos + 1
        Case Is < 0
            sinal = "negativo"
            classe = "neg"
            negativos = negativos + 1
        Case Else
            sinal = "zero"
            classe = "zero"
            zeros = zeros + 1
    End Select

    If valor Mod 2 = 0 Then
        paridade = "par"
        pares = pares + 1
    Else
        paridade = "ímpar"
    End If

    Response.Write "<tr><td>" & valor & "</td><td class=""" & classe & """>" & sinal & _
                   "</td><td>" & paridade & "</td><td>" & ContarDigitos(valor) & "</td></tr>"
Next
%>
</table>

<h2>Resumo</h2>
<ul>
<li>Positivos: <%= positivos %></li>
<li>Negativos: <%= negativos %></li>
<li>Zeros: <%= zeros %></li>
<li>Pares (o zero conta como par): <%= pares %></li>
<li>Total de elementos: <%= UBound(numeros) - LBound(numeros) + 1 %></li>
</ul>

<p>Resultado esperado para a lista <code>(-7, 0, 12, 5, -3, 8, -10, 1)</code>:
4 positivos, 3 negativos, 1 zero, 4 pares. O zero é par porque
<code>0 Mod 2</code> é 0, e é classificado como "zero" antes de qualquer
comparação de sinal.</p>
</body>
</html>
