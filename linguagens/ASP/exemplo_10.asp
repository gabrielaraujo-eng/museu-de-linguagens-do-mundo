<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_10.asp - Request, Response e Server: entrada e saída HTTP
'
' Request.QueryString lê parâmetros da URL (?nome=valor&idade=valor).
' Request.Form lê campos de um POST. Request.ServerVariables expõe as
' variáveis do servidor. Server.HTMLEncode e Server.URLEncode cuidam do
' escape, e Server.MapPath converte caminho virtual em caminho físico.
' A ausência de um parâmetro devolve string vazia, não Null.
' Atribuir um objeto a uma variável exige Set (Set x = Request.QueryString).

Response.ContentType = "text/html"
Response.Charset = "utf-8"
Response.Buffer = True

Dim metodo, nome, idade, agente, caminho, urlCodificada
Dim quantidade, chave, colecao

metodo = Request.ServerVariables("REQUEST_METHOD")
nome = Request.QueryString("nome")
idade = Request.QueryString("idade")

If Trim(nome) = "" Then
    nome = "visitante"
End If

' IsNumeric evita erro de conversão quando o parâmetro falta ou é texto.
Dim idadeNumero, faixa
If IsNumeric(idade) Then
    idadeNumero = CInt(idade)
Else
    idadeNumero = -1
End If

Select Case idadeNumero
    Case Is < 0   : faixa = "idade não informada"
    Case Is < 13  : faixa = "criança"
    Case Is < 18  : faixa = "adolescente"
    Case Is < 60  : faixa = "adulto"
    Case Else     : faixa = "idoso"
End Select

agente = Request.ServerVariables("HTTP_USER_AGENT")
caminho = Server.MapPath("exemplo_10.asp")
urlCodificada = Server.URLEncode("Museu de Linguagens do Mundo")
quantidade = Request.QueryString.Count
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Request, Response e Server</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 46rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; vertical-align: top; }
th { background: #eee; }
code { background: #f2f2f2; padding: 0 .2rem; }
fieldset { border: 1px solid #bbb; padding: 1rem; }
label { display: block; margin: .4rem 0; }
</style>
</head>
<body>
<h1>Entrada e saída HTTP</h1>

<p>Olá, <strong><%= Server.HTMLEncode(nome) %></strong>. Classificação:
<strong><%= faixa %></strong>.</p>

<h2>Formulário que envia para esta mesma página</h2>
<form method="get" action="exemplo_10.asp">
    <fieldset>
        <label>Nome: <input type="text" name="nome" value="<%= Server.HTMLEncode(nome) %>"></label>
        <label>Idade: <input type="text" name="idade" value="<%= Server.HTMLEncode(idade) %>"></label>
        <input type="submit" value="Enviar por GET">
    </fieldset>
</form>

<h2>Valores lidos</h2>
<table>
<tr><th>Item</th><th>Valor</th></tr>
<tr><td>Método HTTP</td><td><%= metodo %></td></tr>
<tr><td><code>Request.QueryString.Count</code></td><td><%= quantidade %></td></tr>
<%
Set colecao = Request.QueryString
For Each chave In colecao
    Response.Write "<tr><td>QueryString(""" & Server.HTMLEncode(chave) & """)</td><td>" & _
                   Server.HTMLEncode(Request.QueryString(chave)) & "</td></tr>"
Next
%>
<tr><td><code>Request.ServerVariables("HTTP_USER_AGENT")</code></td><td><%= Server.HTMLEncode(agente) %></td></tr>
<tr><td><code>Server.MapPath("exemplo_10.asp")</code></td><td><%= Server.HTMLEncode(caminho) %></td></tr>
<tr><td><code>Server.URLEncode(...)</code></td><td><%= urlCodificada %></td></tr>
<tr><td><code>Request.TotalBytes</code></td><td><%= Request.TotalBytes %></td></tr>
</table>

<p>Para receber POST em vez de GET, basta trocar <code>method="get"</code> por
<code>method="post"</code> e ler os campos com <code>Request.Form("nome")</code>.
O objeto <code>Request</code> também expõe <code>Cookies</code>,
<code>ServerVariables</code> e <code>ClientCertificate</code>.</p>
</body>
</html>
