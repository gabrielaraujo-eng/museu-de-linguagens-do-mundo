<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_8.asp - manipulação de strings e escape de saída
'
' VBScript trata texto como subtipo String de Variant. Não há objeto
' String nem StringBuilder: cada operação devolve uma nova string, e
' concatenação usa &. Para saída em HTML, Server.HTMLEncode é obrigatório
' sempre que o texto vier do usuário.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Function ContarPalavras(texto)
    Dim pedacos, k, total
    pedacos = Split(Trim(texto), " ")
    total = 0
    For k = LBound(pedacos) To UBound(pedacos)
        If Len(Trim(pedacos(k))) > 0 Then
            total = total + 1
        End If
    Next
    ContarPalavras = total
End Function

Function PrimeiraMaiuscula(texto)
    Dim t
    t = Trim(texto)
    If Len(t) = 0 Then
        PrimeiraMaiuscula = ""
    Else
        PrimeiraMaiuscula = UCase(Left(t, 1)) & LCase(Mid(t, 2))
    End If
End Function

Dim frase, limpa, tamanho, primeira, ultima, meio
Dim posicao, ultimaPosicao, trocada, invertida, palavras, codigo

frase = "  O Museu de Linguagens do Mundo documenta linguagens antigas e atuais.  "
limpa = Trim(frase)
tamanho = Len(limpa)
primeira = Left(limpa, 12)
ultima = Right(limpa, 9)
meio = Mid(limpa, 5, 8)
posicao = InStr(1, limpa, "Linguagens", vbTextCompare)
ultimaPosicao = InStrRev(limpa, "o")
trocada = Replace(limpa, "linguagens", "idiomas")
invertida = StrReverse("ASP")
palavras = ContarPalavras(limpa)
codigo = Asc("A")

' Texto hostil: sem escape, seria interpretado pelo navegador.
Dim entrada
entrada = "<script>alert('xss')</script> & Cia."
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Strings em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 46rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; vertical-align: top; }
th { background: #eee; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Funções de string</h1>

<p>Texto de trabalho, já sem espaços nas pontas:</p>
<blockquote><%= Server.HTMLEncode(limpa) %></blockquote>

<table>
<tr><th>Expressão</th><th>Resultado</th></tr>
<tr><td><code>Len(limpa)</code></td><td><%= tamanho %></td></tr>
<tr><td><code>Left(limpa, 12)</code></td><td><%= Server.HTMLEncode(primeira) %></td></tr>
<tr><td><code>Right(limpa, 9)</code></td><td><%= Server.HTMLEncode(ultima) %></td></tr>
<tr><td><code>Mid(limpa, 5, 8)</code></td><td><%= Server.HTMLEncode(meio) %></td></tr>
<tr><td><code>InStr(1, limpa, "Linguagens", vbTextCompare)</code></td><td><%= posicao %></td></tr>
<tr><td><code>InStrRev(limpa, "o")</code></td><td><%= ultimaPosicao %></td></tr>
<tr><td><code>Replace(limpa, "linguagens", "idiomas")</code></td><td><%= Server.HTMLEncode(trocada) %></td></tr>
<tr><td><code>StrReverse("ASP")</code></td><td><%= invertida %></td></tr>
<tr><td><code>UCase</code> / <code>LCase</code></td><td><%= UCase("asp clássico") %> / <%= LCase("ASP CLÁSSICO") %></td></tr>
<tr><td><code>ContarPalavras(limpa)</code></td><td><%= palavras %></td></tr>
<tr><td><code>PrimeiraMaiuscula("mUSEU")</code></td><td><%= PrimeiraMaiuscula("mUSEU") %></td></tr>
<tr><td><code>Asc("A")</code> e <code>Chr(65)</code></td><td><%= codigo %> e <%= Chr(65) %></td></tr>
<tr><td><code>Join(Split("a;b;c", ";"), "-")</code></td><td><%= Join(Split("a;b;c", ";"), "-") %></td></tr>
</table>

<h2>Escape de saída</h2>
<p>Sem escape, o texto abaixo seria executado como script pelo navegador:</p>
<p><code><%= Server.HTMLEncode(entrada) %></code></p>
<p>Com <code>Server.HTMLEncode</code>, o navegador mostra os caracteres literais.
Para montar URL com segurança existe <code>Server.URLEncode</code>, que codifica
espaços e acentos como <code>%XX</code>.</p>
</body>
</html>
