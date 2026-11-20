; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 8: contar vogais e verificar palindromo
; Tema: StringLen, StringMid, StringLower e StringStripWS
; ============================================================

#include <StringConstants.au3>

Func ContarVogais($sTexto)
    Local $sMinusculo = StringLower($sTexto)
    Local $iTotal = 0
    Local $i = 0
    Local $sLetra = ""

    For $i = 1 To StringLen($sMinusculo)
        $sLetra = StringMid($sMinusculo, $i, 1)
        If StringInStr("aeiou", $sLetra) > 0 Then
            $iTotal += 1
        EndIf
    Next

    Return $iTotal
EndFunc

Func InverterTexto($sTexto)
    Local $sInvertido = ""
    Local $i = 0

    For $i = StringLen($sTexto) To 1 Step -1
        $sInvertido = $sInvertido & StringMid($sTexto, $i, 1)
    Next

    Return $sInvertido
EndFunc

Func EhPalindromo($sTexto)
    ; Remove espacos e padroniza a caixa antes de comparar.
    Local $sLimpo = StringLower(StringStripWS($sTexto, $STR_STRIPALL))
    If $sLimpo = InverterTexto($sLimpo) Then
        Return True
    EndIf
    Return False
EndFunc

Local $aFrases[3] = ["AutoIt", "A base do teto desaba", "Museu de Linguagens"]
Local $i = 0

For $i = 0 To UBound($aFrases) - 1
    ConsoleWrite("Texto: " & $aFrases[$i] & @CRLF)
    ConsoleWrite("  vogais: " & ContarVogais($aFrases[$i]) & @CRLF)
    ConsoleWrite("  invertido: " & InverterTexto($aFrases[$i]) & @CRLF)

    If EhPalindromo($aFrases[$i]) Then
        ConsoleWrite("  palindromo: sim" & @CRLF)
    Else
        ConsoleWrite("  palindromo: nao" & @CRLF)
    EndIf
Next
