<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exercicio_8.asp - normalizar um nome recebido por POST
'
' Enunciado: receber um nome em um formulário POST, limpar espaços
' repetidos, contar letras, vogais e consoantes, extrair as iniciais e
' exibir tudo com escape de HTML.
'
' Resolução: Request.Form("nome") lê o campo do corpo da requisição.
' Trim remove as pontas; Replace em laço reduz espaços internos. A
' contagem percorre a string com Mid e testa cada caractere com InStr.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

Dim bruto, limpo, i, letra, minuscula
Dim vogais, consoantes, outros, iniciais, pedacos, palavra
Dim alfabetoVogais

alfabetoVogais = "aeiouáàâãéêíóôõúü"

bruto = Request.Form("nome")
limpo = Trim(bruto & "")

' Colapsa espaços duplos até não sobrar nenhum.
Do While InStr(limpo, "  ") > 0
    limpo = Replace(limpo, "  ", " ")
Loop

vogais = 0
consoantes = 0
outros = 0

For i = 1 To Len(limpo)
    letra = Mid(limpo, i, 1)
    minuscula = LCase(letra)
    If InStr(alfabetoVogais, minuscula) > 0 Then
        vogais = vogais + 1
    ElseIf minuscula >= "a" And minuscula <= "z" Then
        consoantes = consoantes + 1
    Else
        outros = outros + 1
    End If
Next

' Iniciais: primeira letra de cada palavra, em maiúscula.
iniciais = ""
If Len(limpo) > 0 Then
    pedacos = Split(limpo, " ")
    For i = LBound(pedacos) To UBound(pedacos)
        palavra = pedacos(i)
        If Len(palavra) > 0 Then
            iniciais = iniciais & UCase(Left(palavra, 1))
        End If
    Next
End If

Function FormatarNome(texto)
    ' Deixa a primeira letra de cada palavra em maiúscula.
    Dim partes, k, resultado, p
    If Len(Trim(texto)) = 0 Then
        FormatarNome = ""
        Exit Function
    End If
    partes = Split(Trim(texto), " ")
    resultado = ""
    For k = LBound(partes) To UBound(partes)
        p = LCase(partes(k))
        If Len(p) > 0 Then
            If Len(resultado) > 0 Then resultado = resultado & " "
            resultado = resultado & UCase(Left(p, 1)) & Mid(p, 2)
        End If
    Next
    FormatarNome = resultado
End Function
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Exercício 8 - normalizar nome</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 44rem; line-height: 1.5; }
table { border-collapse: collapse; width: 100%; }
th, td { border: 1px solid #bbb; padding: .35rem .7rem; text-align: left; }
th { background: #eee; }
fieldset { border: 1px solid #bbb; padding: 1rem; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Exercício 8: limpar e analisar um nome</h1>

<form method="post" action="exercicio_8.asp">
    <fieldset>
        <label>Nome completo:
            <input type="text" name="nome" size="40" value="<%= Server.HTMLEncode(limpo) %>">
        </label>
        <input type="submit" value="Analisar">
    </fieldset>
</form>

<% If Len(limpo) = 0 Then %>
<p>Envie um nome para ver a análise. Sem POST, a página apenas exibe o formulário.</p>
<% Else %>
<table>
<tr><th>Entrada original</th><td><code><%= Server.HTMLEncode(bruto) %></code></td></tr>
<tr><th>Nome limpo</th><td><%= Server.HTMLEncode(limpo) %></td></tr>
<tr><th>Formatado</th><td><%= Server.HTMLEncode(FormatarNome(limpo)) %></td></tr>
<tr><th>Comprimento</th><td><%= Len(limpo) %></td></tr>
<tr><th>Vogais</th><td><%= vogais %></td></tr>
<tr><th>Consoantes</th><td><%= consoantes %></td></tr>
<tr><th>Espaços e outros</th><td><%= outros %></td></tr>
<tr><th>Iniciais</th><td><%= Server.HTMLEncode(iniciais) %></td></tr>
<tr><th>Método da requisição</th><td><%= Request.ServerVariables("REQUEST_METHOD") %></td></tr>
</table>

<p>Resultado esperado para a entrada <code>"  maria   da silva  "</code>:
nome limpo <code>maria da silva</code>, formatado <code>Maria Da Silva</code>,
14 caracteres, 6 vogais, 6 consoantes, 2 espaços e iniciais <code>MDS</code>.</p>
<% End If %>

<p>O escape com <code>Server.HTMLEncode</code> aparece duas vezes: no valor do
campo e na exibição. Sem ele, um nome contendo <code>&lt;script&gt;</code> seria
interpretado pelo navegador.</p>
</body>
</html>
