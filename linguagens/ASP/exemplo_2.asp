<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_2.asp - variáveis, subtipos de Variant e conversões
'
' VBScript tem um único tipo de dado, Variant. O que se chama de "tipo"
' em outras linguagens aqui é um subtipo guardado dentro do Variant.
' Option Explicit obriga a declarar toda variável com Dim antes do uso.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Function NomeDoTipo(valor)
    ' VarType devolve um código numérico; as constantes vb* são do VBScript.
    Select Case VarType(valor)
        Case vbEmpty    : NomeDoTipo = "Empty (não inicializado)"
        Case vbNull     : NomeDoTipo = "Null (ausência de valor)"
        Case vbInteger  : NomeDoTipo = "Integer"
        Case vbLong     : NomeDoTipo = "Long"
        Case vbSingle   : NomeDoTipo = "Single"
        Case vbDouble   : NomeDoTipo = "Double"
        Case vbCurrency : NomeDoTipo = "Currency"
        Case vbDate     : NomeDoTipo = "Date"
        Case vbString   : NomeDoTipo = "String"
        Case vbObject   : NomeDoTipo = "Object"
        Case vbBoolean  : NomeDoTipo = "Boolean"
        Case Else       : NomeDoTipo = "código " & VarType(valor)
    End Select
End Function

Dim nome, idade, altura, ativo, nascimento, vazio
nome = "Marta Ribeiro"
idade = 34
altura = 1.68
ativo = True
nascimento = DateSerial(1989, 3, 14)   ' evita depender da localidade do servidor
' vazio não recebe valor: permanece Empty

' Conversões explícitas: CInt, CLng, CDbl, CDate, CStr, CBool
Dim idadeTexto, idadeNumero, alturaTexto
idadeTexto = CStr(idade)
idadeNumero = CInt("34")
alturaTexto = FormatNumber(altura, 2)

' Concatenação usa & (o operador + também concatena strings, mas pode
' somar quando os dois lados são numéricos; por isso o padrão é usar &).
Dim resumo
resumo = nome & " tem " & idade & " anos e " & alturaTexto & " m de altura."
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Variáveis e tipos em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 46rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #bbb; padding: .35rem .5rem; text-align: left; }
th { background: #eee; }
</style>
</head>
<body>
<h1>Variáveis e subtipos de Variant</h1>

<p><%= resumo %></p>

<table>
<tr><th>Variável</th><th>Valor</th><th>Subtipo (VarType)</th></tr>
<tr><td>nome</td><td><%= nome %></td><td><%= NomeDoTipo(nome) %></td></tr>
<tr><td>idade</td><td><%= idade %></td><td><%= NomeDoTipo(idade) %></td></tr>
<tr><td>altura</td><td><%= altura %></td><td><%= NomeDoTipo(altura) %></td></tr>
<tr><td>ativo</td><td><%= ativo %></td><td><%= NomeDoTipo(ativo) %></td></tr>
<tr><td>nascimento</td><td><%= nascimento %></td><td><%= NomeDoTipo(nascimento) %></td></tr>
<tr><td>vazio</td><td>(sem valor)</td><td><%= NomeDoTipo(vazio) %></td></tr>
</table>

<h2>Conversões</h2>
<ul>
<li><code>CStr(idade)</code> = <%= idadeTexto %> (<%= NomeDoTipo(idadeTexto) %>)</li>
<li><code>CInt("34")</code> = <%= idadeNumero %> (<%= NomeDoTipo(idadeNumero) %>)</li>
<li><code>FormatNumber(altura, 2)</code> = <%= alturaTexto %></li>
<li><code>IsNumeric("12,5")</code> = <%= IsNumeric("12,5") %>; <code>IsNumeric("doze")</code> = <%= IsNumeric("doze") %></li>
</ul>

<p>Idade em dias, aproximadamente: <strong><%= DateDiff("d", nascimento, Date) %></strong>.</p>
</body>
</html>
