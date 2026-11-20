<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_9.asp - hipotenusa, área e perímetro de triângulos retângulos
'
' Enunciado: para um triângulo retângulo de catetos a e b, calcular a
' hipotenusa com Sqr, a área e o perímetro, e indicar se a hipotenusa é
' um número inteiro (terno pitagórico).
'
' Resolução: Sqr(a^2 + b^2). A verificação de inteiro compara o valor com
' Int(valor); por causa da imprecisão de ponto flutuante usa-se uma
' tolerância pequena em vez de igualdade exata.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Function Hipotenusa(a, b)
    Hipotenusa = Sqr(a ^ 2 + b ^ 2)
End Function

Function AreaTriangulo(base, altura)
    AreaTriangulo = base * altura / 2
End Function

Function EhInteiro(valor)
    EhInteiro = (Abs(valor - Int(valor)) < 0.0000001)
End Function

Function AnguloGraus(a, b)
    ' Atn devolve radianos; a conversão para graus multiplica por 180/pi.
    AnguloGraus = Atn(a / b) * 180 / 3.14159265358979
End Function

Dim catetosA, catetosB, i
Dim a, b, h, area, perimetro, tipo

catetosA = Array(3, 5, 8, 7, 1)
catetosB = Array(4, 12, 15, 24, 1)
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 9 - hipotenusa e área</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 46rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; font-variant-numeric: tabular-nums; }
th, td { border: 1px solid #bbb; padding: .35rem .7rem; text-align: right; }
th { background: #eee; text-align: left; }
td.texto { text-align: left; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Exercício 9: triângulos retângulos</h1>

<table>
<tr><th>Cateto a</th><th>Cateto b</th><th>Hipotenusa</th><th>Área</th><th>Perímetro</th><th>Ângulo (graus)</th><th>Terno</th></tr>
<%
For i = LBound(catetosA) To UBound(catetosA)
    a = catetosA(i)
    b = catetosB(i)
    h = Hipotenusa(a, b)
    area = AreaTriangulo(a, b)
    perimetro = a + b + h

    If EhInteiro(h) Then
        tipo = "pitagórico"
    Else
        tipo = "não inteiro"
    End If

    Response.Write "<tr><td>" & a & "</td><td>" & b & "</td><td>" & FormatNumber(h, 4) & _
                   "</td><td>" & FormatNumber(area, 2) & "</td><td>" & FormatNumber(perimetro, 2) & _
                   "</td><td>" & FormatNumber(AnguloGraus(a, b), 1) & "</td><td class=""texto"">" & tipo & "</td></tr>"
Next
%>
</table>

<h2>Detalhe do primeiro triângulo</h2>
<p>Para catetos <%= catetosA(0) %> e <%= catetosB(0) %>:</p>
<ul>
<li><code>Sqr(3^2 + 4^2)</code> = <%= Hipotenusa(3, 4) %></li>
<li><code>Int(5)</code> = <%= Int(Hipotenusa(3, 4)) %></li>
<li><code>Round(AreaTriangulo(3, 4), 1)</code> = <%= Round(AreaTriangulo(3, 4), 1) %></li>
<li><code>Abs(-5)</code> = <%= Abs(-5) %>, usado no teste de inteiro</li>
</ul>

<p>Resultado esperado: (3, 4) resulta em hipotenusa 5, área 6 e perímetro 12;
(5, 12) resulta em 13; (8, 15) resulta em 17; (7, 24) resulta em 25. Os quatro
primeiros são ternos pitagóricos. O par (1, 1) gera hipotenusa 1,4142, marcada
como "não inteiro".</p>

<p>Observação: <code>FormatNumber</code> usa o separador decimal da localidade do
servidor; em configuração pt-BR a saída mostra vírgula.</p>
</body>
</html>
