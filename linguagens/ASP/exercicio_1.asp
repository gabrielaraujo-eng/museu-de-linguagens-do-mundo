<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_1.asp - saudação conforme a hora do servidor
'
' Enunciado: escrever uma página que cumprimente o visitante de acordo
' com a hora do servidor (bom dia, boa tarde, boa noite) e mostre uma
' tabela com as partes da data e da hora atuais.
'
' Resolução: Hour(Now) devolve 0..23. O If em bloco decide a saudação;
' Day, Month, Year, Weekday e MonthName completam a tabela.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim hora, minuto, segundo, saudacao, momento
Dim dia, mes, ano, diaSemana, nomeMes

hora = Hour(Now)
minuto = Minute(Now)
segundo = Second(Now)

If hora < 12 Then
    saudacao = "Bom dia"
ElseIf hora < 18 Then
    saudacao = "Boa tarde"
Else
    saudacao = "Boa noite"
End If

Select Case hora
    Case Is < 6   : momento = "madrugada"
    Case Is < 12  : momento = "manhã"
    Case Is < 18  : momento = "tarde"
    Case Else     : momento = "noite"
End Select

dia = Day(Now)
mes = Month(Now)
ano = Year(Now)
diaSemana = WeekdayName(Weekday(Now), False, vbSunday)
nomeMes = MonthName(mes, False)

' Formata a hora com dois dígitos, sem depender de FormatDateTime.
Function DoisDigitos(valor)
    If valor < 10 Then
        DoisDigitos = "0" & valor
    Else
        DoisDigitos = CStr(valor)
    End If
End Function
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 1 - saudação por hora</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 42rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .7rem; text-align: left; }
th { background: #eee; }
.saudacao { font-size: 1.6rem; }
</style>
</head>
<body>
<h1>Exercício 1: saudação por hora</h1>

<p class="saudacao"><%= saudacao %>, visitante.</p>
<p>São <%= DoisDigitos(hora) %>:<%= DoisDigitos(minuto) %>:<%= DoisDigitos(segundo) %>
e o servidor considera que estamos na <strong><%= momento %></strong>.</p>

<table>
<tr><th>Dia</th><td><%= dia %></td></tr>
<tr><th>Mês</th><td><%= mes %> (<%= nomeMes %>)</td></tr>
<tr><th>Ano</th><td><%= ano %></td></tr>
<tr><th>Dia da semana</th><td><%= diaSemana %></td></tr>
<tr><th>Hora</th><td><%= hora %> h</td></tr>
<tr><th>Minuto</th><td><%= minuto %></td></tr>
<tr><th>Segundo</th><td><%= segundo %></td></tr>
<tr><th>Now completo</th><td><%= Now %></td></tr>
</table>

<p>Resultado esperado: entre 0h e 11h59 a saudação é "Bom dia"; entre 12h e 17h59,
"Boa tarde"; a partir das 18h, "Boa noite". A hora exibida é a do servidor IIS,
não a do micro do visitante.</p>
</body>
</html>
