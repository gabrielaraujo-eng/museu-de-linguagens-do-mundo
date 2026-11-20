<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_5.asp - procedimentos: Function, Sub, recursão e ByRef
'
' Em VBScript não há declaração de tipo de retorno: a Function devolve
' o valor atribuído ao próprio nome dela. Sub não devolve valor.
' Parâmetros são passados por referência por padrão; ByVal copia e
' ByRef (explícito aqui) permite alterar a variável do chamador.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Function Potencia(base, expoente)
    Dim resultado, k
    resultado = 1
    For k = 1 To expoente
        resultado = resultado * base
    Next
    Potencia = resultado
End Function

Function Fatorial(n)
    ' Recursão: a Function chama a si mesma até o caso base.
    If n <= 1 Then
        Fatorial = 1
    Else
        Fatorial = n * Fatorial(n - 1)
    End If
End Function

Function EhPrimo(n)
    Dim d, limite
    If n < 2 Then
        EhPrimo = False
        Exit Function
    End If
    limite = Int(Sqr(n))
    EhPrimo = True
    For d = 2 To limite
        If n Mod d = 0 Then
            EhPrimo = False
            Exit Function
        End If
    Next
End Function

Sub EscreverItem(texto)
    Response.Write "<li>" & Server.HTMLEncode(texto) & "</li>"
End Sub

Sub ContarAte(limite, ByRef contador)
    ' contador é alterado no chamador por ser passado por referência.
    Dim k
    For k = 1 To limite
        contador = contador + 1
    Next
End Sub

Dim chamadas
chamadas = 0

Dim r1, r2, r3
r1 = Potencia(2, 10)
r2 = Fatorial(6)
r3 = EhPrimo(97)

Call ContarAte(4, chamadas)   ' forma com Call e parênteses
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Funções e Sub-rotinas em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 44rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; }
th { background: #eee; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Function, Sub e recursão</h1>

<table>
<tr><th>Chamada</th><th>Resultado</th></tr>
<tr><td><code>Potencia(2, 10)</code></td><td><%= r1 %></td></tr>
<tr><td><code>Fatorial(6)</code></td><td><%= r2 %></td></tr>
<tr><td><code>EhPrimo(97)</code></td><td><%= r3 %></td></tr>
<tr><td><code>ContarAte(4, chamadas)</code></td><td>chamadas = <%= chamadas %></td></tr>
</table>

<h2>Números primos até 30</h2>
<ul>
<%
Dim n
For n = 2 To 30
    If EhPrimo(n) Then
        Call EscreverItem(CStr(n))
    End If
Next
%>
</ul>

<p>A Sub <code>EscreverItem</code> recebe texto e emite HTML com
<code>Server.HTMLEncode</code>, que escapa <code>&lt;</code>, <code>&gt;</code>,
<code>&amp;</code> e aspas: é o equivalente ao escape de saída das linguagens atuais
e a proteção básica contra injeção de HTML.</p>
</body>
</html>
