; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 9: hipotenusa e area do circulo
; Tema: Sqrt, potencia e Round
; ============================================================

Local Const $PI = 3.14159265358979

Func Hipotenusa($fCatetoA, $fCatetoB)
    If ($fCatetoA < 0) Or ($fCatetoB < 0) Then
        Return SetError(1, 0, 0)
    EndIf
    Return Sqrt($fCatetoA ^ 2 + $fCatetoB ^ 2)
EndFunc

Func AreaCirculo($fRaio)
    If $fRaio < 0 Then
        Return SetError(1, 0, 0)
    EndIf
    Return $PI * $fRaio ^ 2
EndFunc

Func PerimetroCirculo($fRaio)
    Return 2 * $PI * $fRaio
EndFunc

Local $aPares[3][2] = [[3, 4], [5, 12], [-2, 7]]
Local $i = 0
Local $fHip = 0

For $i = 0 To UBound($aPares) - 1
    $fHip = Hipotenusa($aPares[$i][0], $aPares[$i][1])

    If @error = 0 Then
        ConsoleWrite("Catetos " & $aPares[$i][0] & " e " & $aPares[$i][1] & " -> hipotenusa " & Round($fHip, 4) & @CRLF)
    Else
        ConsoleWrite("Catetos " & $aPares[$i][0] & " e " & $aPares[$i][1] & " -> cateto negativo rejeitado" & @CRLF)
    EndIf
Next

ConsoleWrite(@CRLF)
ConsoleWrite("Raio 1, area   = " & Round(AreaCirculo(1), 4) & @CRLF)
ConsoleWrite("Raio 1, perim. = " & Round(PerimetroCirculo(1), 4) & @CRLF)
ConsoleWrite("Raio 2.5, area = " & StringFormat("%.3f", AreaCirculo(2.5)) & @CRLF)

; Conferencia: 3-4-5 e um triangulo pitagorico classico.
If Hipotenusa(3, 4) = 5 Then
    ConsoleWrite(@CRLF & "Triangulo 3-4-5 confirmado." & @CRLF)
EndIf
