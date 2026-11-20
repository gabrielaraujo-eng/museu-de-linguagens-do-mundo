<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_10.asp - contadores de sessão e de aplicação
'
' Enunciado: mostrar quantas vezes esta página foi aberta na sessão atual
' e quantas vezes foi aberta desde que a aplicação foi iniciada.
'
' Resolução: Session guarda variáveis por visitante e expira por inatividade;
' Application guarda variáveis para todos os visitantes. Como vários pedidos
' podem chegar ao mesmo tempo, a alteração de Application deve ser feita entre
' Application.Lock e Application.Unlock.

Response.ContentType = "text/html"
Response.Charset = "utf-8"
Response.Buffer = True

Session.Timeout = 20   ' minutos de inatividade até a sessão expirar

' Contador da aplicação, protegido contra acesso simultâneo.
Application.Lock
If IsEmpty(Application("visitas")) Then
    Application("visitas") = 0
End If
Application("visitas") = Application("visitas") + 1
Application.Unlock

' Contador da sessão, sem necessidade de Lock: cada sessão é exclusiva.
If IsEmpty(Session("visitas")) Then
    Session("visitas") = 0
End If
Session("visitas") = Session("visitas") + 1

Dim visitasApp, visitasSessao, idSessao, criadaEm
visitasApp = Application("visitas")
visitasSessao = Session("visitas")
idSessao = Session.SessionID
criadaEm = Now

' Variáveis de servidor úteis para diagnóstico, sem dados sensíveis.
Dim chaves, valores()
chaves = Array("SERVER_NAME", "SERVER_PORT", "SCRIPT_NAME", "REMOTE_ADDR", "HTTP_USER_AGENT")
ReDim valores(UBound(chaves), 1)
Dim k
For k = LBound(chaves) To UBound(chaves)
    valores(k, 0) = chaves(k)
    valores(k, 1) = Request.ServerVariables(chaves(k))
Next
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 10 - Session e Application</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 46rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #bbb; padding: .35rem .7rem; text-align: left; vertical-align: top; }
th { background: #eee; }
.numero { font-size: 1.5rem; font-weight: bold; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Exercício 10: estado de sessão e de aplicação</h1>

<p>Aberturas nesta sessão: <span class="numero"><%= visitasSessao %></span></p>
<p>Aberturas desde o início da aplicação: <span class="numero"><%= visitasApp %></span></p>

<table>
<tr><th>Identificador da sessão</th><td><code><%= idSessao %></code></td></tr>
<tr><th>Timeout da sessão</th><td><%= Session.Timeout %> minutos</td></tr>
<tr><th>Hora do pedido</th><td><%= criadaEm %></td></tr>
<%
For k = 0 To UBound(chaves)
    Response.Write "<tr><th>Request.ServerVariables(""" & Server.HTMLEncode(valores(k, 0)) & """)</th><td>" & _
                   Server.HTMLEncode(valores(k, 1)) & "</td></tr>"
Next
%>
</table>

<p>Resultado esperado: recarregando a página, o contador de sessão cresce de um em
um; o contador da aplicação cresce também, mas continua crescendo em outra janela
do mesmo navegador ou em outro navegador. Reiniciar a aplicação no IIS zera as
variáveis de <code>Application</code>; fechar o navegador ou esperar o timeout de
20 minutos zera as de <code>Session</code>.</p>

<p>Observação: <code>Session.SessionID</code> identifica a sessão, não a pessoa, e
não deve ser usado como credencial. Para encerrar a sessão explicitamente existe
<code>Session.Abandon</code>; para limpar todas as variáveis,
<code>Session.Contents.RemoveAll</code>.</p>
</body>
</html>
