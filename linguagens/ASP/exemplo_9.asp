<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_9.asp - funções matemáticas e formatação numérica
'
' Todas as funções abaixo são do núcleo do VBScript (VBA.Math). Não há
' biblioteca numérica separada nem tipo inteiro distinto: os cálculos
' acontecem em Double, e CInt/CLng arredondam para o inteiro mais próximo.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim a, b, c, d, e, f, g
a = Abs(-7.5)        ' 7.5
b = Sqr(144)         ' 12
c = Int(-2.5)        ' -3  (arredonda para baixo, para -infinito)
d = Fix(-2.5)        ' -2  (trunca em direção a zero)
e = Round(2.5)       ' 2   (arredondamento bancário: par mais próximo)
f = Round(3.5)       ' 4
g = 2 ^ 10           ' 1024, operador de potenciação

' Sgn devolve -1, 0 ou 1; Log é logaritmo natural; Exp é e^x
Dim sinal, logaritmo, exponencial
sinal = Sgn(-42)
logaritmo = Log(Exp(3))
exponencial = Exp(1)

' Trigonometria em radianos; Atn é o arco-tangente
Dim seno, cosseno, angulo
angulo = 3.14159265358979 / 6
seno = Sin(angulo)
cosseno = Cos(angulo)

' Rnd precisa de Randomize para não repetir a mesma sequência
Randomize
Dim sorteio
sorteio = Int(Rnd() * 60) + 1   ' inteiro de 1 a 60

' Formatação depende da localidade do servidor
Dim pi, area, percentual
pi = 3.14159265358979
area = pi * 5 ^ 2
percentual = 0.0734

Function Distancia(x1, y1, x2, y2)
    Distancia = Sqr((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
End Function
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Funções matemáticas em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 46rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; }
th { background: #eee; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Matemática e formatação</h1>

<table>
<tr><th>Expressão</th><th>Resultado</th></tr>
<tr><td><code>Abs(-7.5)</code></td><td><%= a %></td></tr>
<tr><td><code>Sqr(144)</code></td><td><%= b %></td></tr>
<tr><td><code>Int(-2.5)</code></td><td><%= c %></td></tr>
<tr><td><code>Fix(-2.5)</code></td><td><%= d %></td></tr>
<tr><td><code>Round(2.5)</code></td><td><%= e %></td></tr>
<tr><td><code>Round(3.5)</code></td><td><%= f %></td></tr>
<tr><td><code>2 ^ 10</code></td><td><%= g %></td></tr>
<tr><td><code>Sgn(-42)</code></td><td><%= sinal %></td></tr>
<tr><td><code>Log(Exp(3))</code></td><td><%= FormatNumber(logaritmo, 6) %></td></tr>
<tr><td><code>Exp(1)</code></td><td><%= FormatNumber(exponencial, 6) %></td></tr>
<tr><td><code>Sin(pi/6)</code></td><td><%= FormatNumber(seno, 6) %></td></tr>
<tr><td><code>Cos(pi/6)</code></td><td><%= FormatNumber(cosseno, 6) %></td></tr>
<tr><td><code>Int(Rnd() * 60) + 1</code></td><td><%= sorteio %></td></tr>
<tr><td><code>FormatNumber(area, 2)</code></td><td><%= FormatNumber(area, 2) %></td></tr>
<tr><td><code>FormatPercent(0.0734, 1)</code></td><td><%= FormatPercent(percentual, 1) %></td></tr>
<tr><td><code>Distancia(0, 0, 3, 4)</code></td><td><%= Distancia(0, 0, 3, 4) %></td></tr>
</table>

<p><code>Round</code> usa arredondamento para o par mais próximo: 2,5 vira 2 e 3,5 vira 4.
Se a regra desejada é a comercial, o caminho é <code>Int(x + 0.5)</code> para valores
positivos, com tratamento separado para negativos.</p>

<p><code>FormatNumber</code>, <code>FormatPercent</code> e <code>FormatCurrency</code>
usam o separador decimal e o símbolo monetário da localidade do servidor; o mesmo
código pode imprimir <code>1.234,56</code> ou <code>1,234.56</code> conforme a
configuração regional do Windows.</p>
</body>
</html>
