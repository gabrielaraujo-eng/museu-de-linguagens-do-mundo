<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_1.asp - estrutura mínima de uma página ASP clássica
'
' Delimitadores:
'   <%  ... %>  bloco de código VBScript executado no servidor
'   <%= ... %>  atalho para Response.Write, usado no meio do HTML
'
' Tudo o que está fora dos delimitadores é HTML comum e vai para o
' navegador sem alteração. O código entre delimitadores nunca aparece
' no código-fonte recebido pelo cliente: ele roda antes da resposta.

Response.ContentType = "text/html"
Response.Charset = "utf-8"
Response.Buffer = True

Dim titulo
Dim mensagem
Dim hora

titulo = "Museu de Linguagens do Mundo - ASP"
hora = Now
mensagem = "Esta página foi montada no servidor em " & FormatDateTime(hora, 2) & _
           " às " & FormatDateTime(hora, 3)
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title><%= titulo %></title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 44rem; line-height: 1.5; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1><%= titulo %></h1>

<p>Esta é uma página ASP clássica mínima. O título acima foi escrito com
<code>&lt;%= titulo %&gt;</code>, que equivale a <code>Response.Write titulo</code>.
A página inteira foi gerada pelo mecanismo <code>asp.dll</code> do IIS.</p>

<p><%= mensagem %></p>

<%
' O mesmo conteúdo também pode ser emitido com Response.Write, inclusive
' dentro de um laço, o que o atalho <%= %> não permite.
Dim i
Response.Write "<ul>"
For i = 1 To 3
    Response.Write "<li>Linha " & i & " escrita com Response.Write</li>"
Next
Response.Write "</ul>"
%>

<p>Método HTTP aceito por esta página: <strong><%= Request.ServerVariables("REQUEST_METHOD") %></strong>.</p>

<hr>
<p>Caminho físico no servidor: <code><%= Server.MapPath("exemplo_1.asp") %></code></p>
</body>
</html>
