; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 3: classificar um inteiro em positivo, negativo ou zero
; Tema: controle de fluxo com If/ElseIf/Else
; ============================================================

Func Sinal($iNumero)
    If $iNumero > 0 Then
        Return "positivo"
    ElseIf $iNumero < 0 Then
        Return "negativo"
    Else
        Return "zero"
    EndIf
EndFunc

Func Paridade($iNumero)
    ; Mod devolve o resto; o resto da divisao por 2 e 0 nos pares.
    If Mod($iNumero, 2) = 0 Then
        Return "par"
    Else
        Return "impar"
    EndIf
EndFunc

Local $aTestes[5] = [17, -4, 0, 250, -1]
Local $i = 0
Local $iNumero = 0

For $i = 0 To UBound($aTestes) - 1
    $iNumero = $aTestes[$i]
    ConsoleWrite(StringFormat("%6d -> %-8s e %s", $iNumero, Sinal($iNumero), Paridade($iNumero)) & @CRLF)
Next

; Caso especial: zero e par, mas nao e positivo nem negativo.
If (Sinal(0) = "zero") And (Paridade(0) = "par") Then
    ConsoleWrite(@CRLF & "O zero foi classificado corretamente nas duas dimensoes." & @CRLF)
EndIf
