; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 2: tabela de conversao de Celsius para Fahrenheit
; Tema: variaveis, funcoes e formatacao numerica
; ============================================================

; F = C * 9 / 5 + 32
Func CelsiusParaFahrenheit($fCelsius)
    Return $fCelsius * 9 / 5 + 32
EndFunc

Func FahrenheitParaCelsius($fFahrenheit)
    Return ($fFahrenheit - 32) * 5 / 9
EndFunc

Local $iCelsius = 0
Local $fFahrenheit = 0

ConsoleWrite("Celsius | Fahrenheit" & @CRLF)
ConsoleWrite("--------+-----------" & @CRLF)

For $iCelsius = -20 To 100 Step 20
    $fFahrenheit = CelsiusParaFahrenheit($iCelsius)
    ConsoleWrite(StringFormat("%7d | %10.1f", $iCelsius, $fFahrenheit) & @CRLF)
Next

; Conferencia da conversao inversa: deve voltar ao valor original.
Local $fVolta = FahrenheitParaCelsius(CelsiusParaFahrenheit(37))
ConsoleWrite(@CRLF & "37 C -> " & CelsiusParaFahrenheit(37) & " F -> " & Round($fVolta, 6) & " C" & @CRLF)

If Round($fVolta, 6) = 37 Then
    ConsoleWrite("Conversao inversa consistente." & @CRLF)
Else
    ConsoleWrite("Conversao inversa inconsistente." & @CRLF)
EndIf
