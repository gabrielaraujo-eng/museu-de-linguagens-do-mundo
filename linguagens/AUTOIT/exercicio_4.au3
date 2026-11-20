; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 4: soma dos numeros pares de 1 a 20
; Tema: laco For/Next com filtro condicional
; ============================================================

Local $iSoma = 0
Local $iQuantidade = 0
Local $i = 0

For $i = 1 To 20
    If Mod($i, 2) = 0 Then
        $iSoma += $i
        $iQuantidade += 1
        ConsoleWrite("Somando " & $i & " -> parcial " & $iSoma & @CRLF)
    EndIf
Next

ConsoleWrite(@CRLF & "Pares somados: " & $iQuantidade & @CRLF)
ConsoleWrite("Soma total: " & $iSoma & @CRLF)

; Conferencia pela formula da progressao aritmetica: n*(primeiro+ultimo)/2.
Local $iEsperado = 10 * (2 + 20) / 2
If $iSoma = $iEsperado Then
    ConsoleWrite("Conferencia com a formula: " & $iEsperado & " (correto)" & @CRLF)
Else
    ConsoleWrite("Divergencia: esperado " & $iEsperado & @CRLF)
EndIf

; Media dos pares, com uma casa decimal.
ConsoleWrite("Media dos pares: " & StringFormat("%.2f", $iSoma / $iQuantidade) & @CRLF)
