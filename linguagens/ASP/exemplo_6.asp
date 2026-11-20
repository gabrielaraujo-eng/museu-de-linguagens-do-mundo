<%@ Language="VBScript" CodePage="65001" %>
<% Option Explicit %>
<%
' exemplo_6.asp - arrays: tamanho fixo, dinâmicos, Split, Join e ordenação
'
' Arrays em VBScript são de base zero quando criados com Array() ou Dim
' com limite superior. Dim a(4) cria cinco posições: 0 a 4. O limite é
' sempre o índice máximo, não a quantidade de elementos.

Response.ContentType = "text/html"
Response.Charset = "utf-8"

' Array de tamanho fixo
Dim valores(4), i
valores(0) = 42
valores(1) = 7
valores(2) = 19
valores(3) = 3
valores(4) = 88

' Array dinâmico: Dim sem limite, crescimento com ReDim Preserve
Dim fila()
Dim k
ReDim fila(0)
fila(0) = "primeiro"
For k = 1 To 3
    ReDim Preserve fila(k)
    fila(k) = "item " & (k + 1)
Next

' Array criado diretamente pela função Array()
Dim cores
cores = Array("verde", "amarelo", "azul")

' Split transforma texto em array; Join faz o caminho inverso
Dim partes, linha
partes = Split("banana;manga;caju", ";")
linha = Join(partes, " | ")

' Ordenação por trocas (bubble sort), sem função de ordenação nativa
Dim copia(), j, temp
ReDim copia(UBound(valores))
For i = 0 To UBound(valores)
    copia(i) = valores(i)
Next
For i = 0 To UBound(copia) - 1
    For j = 0 To UBound(copia) - 1 - i
        If copia(j) > copia(j + 1) Then
            temp = copia(j)
            copia(j) = copia(j + 1)
            copia(j + 1) = temp
        End If
    Next
Next

' Soma e média do array ordenado
Dim soma, media
soma = 0
For i = 0 To UBound(copia)
    soma = soma + copia(i)
Next
media = soma / (UBound(copia) + 1)
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="utf-8">
<title>Arrays em VBScript</title>
<style>
body { font-family: Georgia, serif; margin: 2rem auto; max-width: 44rem; line-height: 1.5; }
table { border-collapse: collapse; }
th, td { border: 1px solid #bbb; padding: .35rem .6rem; text-align: left; }
th { background: #eee; }
code { background: #f2f2f2; padding: 0 .2rem; }
</style>
</head>
<body>
<h1>Arrays, ReDim e ordenação</h1>

<table>
<tr><th>Array</th><th>LBound</th><th>UBound</th><th>Conteúdo</th></tr>
<tr><td>valores</td><td><%= LBound(valores) %></td><td><%= UBound(valores) %></td>
    <td><%= Join(valores, ", ") %></td></tr>
<tr><td>fila</td><td><%= LBound(fila) %></td><td><%= UBound(fila) %></td>
    <td><%= Join(fila, ", ") %></td></tr>
<tr><td>cores</td><td><%= LBound(cores) %></td><td><%= UBound(cores) %></td>
    <td><%= Join(cores, ", ") %></td></tr>
<tr><td>partes</td><td><%= LBound(partes) %></td><td><%= UBound(partes) %></td>
    <td><%= linha %></td></tr>
</table>

<h2>Ordenação por trocas</h2>
<p>Original: <%= Join(valores, ", ") %></p>
<p>Ordenado: <%= Join(copia, ", ") %></p>
<p>Soma: <%= soma %> &middot; Média: <%= FormatNumber(media, 2) %></p>

<p>Observação: <code>ReDim</code> sem <code>Preserve</code> apaga o conteúdo;
com <code>Preserve</code> só é possível alterar a última dimensão. VBScript não tem
listas, dicionários nem estruturas nativas — para chave/valor o caminho é o componente
COM <code>Scripting.Dictionary</code>, instanciado com
<code>Server.CreateObject</code>, que este exemplo não usa para manter a página
independente de componentes externos.</p>
</body>
</html>
