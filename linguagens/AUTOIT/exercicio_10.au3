; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 10: maior, menor e media de seis notas
; Tema: percurso de array com acumuladores (algoritmo classico)
; ============================================================

Func Maior($aValores)
    Local $vMaior = $aValores[0]
    Local $i = 0

    For $i = 1 To UBound($aValores) - 1
        If $aValores[$i] > $vMaior Then
            $vMaior = $aValores[$i]
        EndIf
    Next

    Return $vMaior
EndFunc

Func Menor($aValores)
    Local $vMenor = $aValores[0]
    Local $i = 0

    For $i = 1 To UBound($aValores) - 1
        If $aValores[$i] < $vMenor Then
            $vMenor = $aValores[$i]
        EndIf
    Next

    Return $vMenor
EndFunc

Func Media($aValores)
    Local $fSoma = 0
    Local $i = 0

    For $i = 0 To UBound($aValores) - 1
        $fSoma += $aValores[$i]
    Next

    Return $fSoma / UBound($aValores)
EndFunc

Local $aNotas[6] = [7.5, 9.0, 6.0, 10.0, 4.5, 8.5]
Local $i = 0

ConsoleWrite("Notas: ")
For $i = 0 To UBound($aNotas) - 1
    ConsoleWrite($aNotas[$i] & " ")
Next
ConsoleWrite(@CRLF)

Local $fMedia = Media($aNotas)

ConsoleWrite("Maior nota: " & Maior($aNotas) & @CRLF)
ConsoleWrite("Menor nota: " & Menor($aNotas) & @CRLF)
ConsoleWrite("Media     : " & StringFormat("%.2f", $fMedia) & @CRLF)

; Situacao pela media, com as mesmas faixas usadas nos demais exemplos.
If $fMedia >= 7 Then
    ConsoleWrite("Situacao: aprovado" & @CRLF)
ElseIf $fMedia >= 5 Then
    ConsoleWrite("Situacao: recuperacao" & @CRLF)
Else
    ConsoleWrite("Situacao: reprovado" & @CRLF)
EndIf

; Quantas notas ficaram acima da media.
Local $iAcima = 0
For $i = 0 To UBound($aNotas) - 1
    If $aNotas[$i] > $fMedia Then
        $iAcima += 1
    EndIf
Next
ConsoleWrite("Notas acima da media: " & $iAcima & @CRLF)
