; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 8: manipulacao de strings
; ============================================================

; StringConstants.au3 define $STR_NOCOUNT, $STR_STRIPALL etc.
#include <StringConstants.au3>

Local $sFrase = "  O rato roeu a roupa do rei de Roma  "
Local $sLimpa = StringStripWS($sFrase, $STR_STRIPALL)

ConsoleWrite("Original  : [" & $sFrase & "]" & @CRLF)
ConsoleWrite("Sem espacos: [" & $sLimpa & "]" & @CRLF)
ConsoleWrite("Comprimento: " & StringLen($sLimpa) & @CRLF)

; Caixa alta e baixa.
ConsoleWrite("Maiusculas: " & StringUpper($sLimpa) & @CRLF)
ConsoleWrite("Minusculas: " & StringLower($sLimpa) & @CRLF)

; Recortes: StringLeft, StringRight e StringMid (posicao inicial em 1).
ConsoleWrite("Primeiros 6: " & StringLeft($sLimpa, 6) & @CRLF)
ConsoleWrite("Ultimos 4  : " & StringRight($sLimpa, 4) & @CRLF)
ConsoleWrite("Meio (5,4) : " & StringMid($sLimpa, 5, 4) & @CRLF)

; Busca: StringInStr devolve a posicao ou 0 quando nao encontra.
Local $iPos = StringInStr($sLimpa, "roupa")
ConsoleWrite("Posicao de 'roupa': " & $iPos & @CRLF)
If StringInStr($sLimpa, "gato") = 0 Then
    ConsoleWrite("A palavra 'gato' nao aparece no texto" & @CRLF)
EndIf

; Substituicao: por padrao devolve o texto novo.
Local $sTrocada = StringReplace($sLimpa, "rato", "gato")
ConsoleWrite("Substituindo: " & $sTrocada & @CRLF)

; StringSplit com $STR_NOCOUNT devolve array 0-based, sem a contagem em [0].
Local $aPalavras = StringSplit($sLimpa, " ", $STR_NOCOUNT)
ConsoleWrite("Palavras: " & UBound($aPalavras) & @CRLF)

Local $i = 0
For $i = 0 To UBound($aPalavras) - 1
    ConsoleWrite("  " & ($i + 1) & ". " & $aPalavras[$i] & @CRLF)
Next

; Formatacao com StringFormat (sintaxe parecida com printf).
Local $sTabela = StringFormat("%-12s|%6.2f|%03d", "produto", 19.5, 7)
ConsoleWrite($sTabela & @CRLF)

; Expressoes regulares.
Local $sData = "2024-11-20"
Local $sBr = StringRegExpReplace($sData, "(\d{4})-(\d{2})-(\d{2})", "$3/$2/$1")
ConsoleWrite($sData & " em formato brasileiro: " & $sBr & @CRLF)

; Comparacao sensivel a caixa com == e concatenacao com &.
Local $sA = "AutoIt"
If $sA == "AutoIt" Then
    ConsoleWrite("Comparacao exata confirmada" & @CRLF)
EndIf
ConsoleWrite("Concatenacao: " & $sA & " v" & 3 & @CRLF)
