; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 6: inverter um vetor de cinco posicoes
; Tema: arrays, troca de elementos e UBound
; ============================================================

#include <Array.au3>

Func Inverter(ByRef $aVetor)
    Local $iInicio = 0
    Local $iFim = UBound($aVetor) - 1
    Local $vTemp = 0

    While $iInicio < $iFim
        $vTemp = $aVetor[$iInicio]
        $aVetor[$iInicio] = $aVetor[$iFim]
        $aVetor[$iFim] = $vTemp
        $iInicio += 1
        $iFim -= 1
    WEnd

    Return True
EndFunc

Local $aOriginal[5] = [10, 20, 30, 40, 50]

ConsoleWrite("Antes  : " & _ArrayToString($aOriginal, ", ") & @CRLF)

Inverter($aOriginal)

ConsoleWrite("Depois : " & _ArrayToString($aOriginal, ", ") & @CRLF)

; Conferencia posicao por posicao: o primeiro deve ser o ultimo original.
If $aOriginal[0] = 50 And $aOriginal[4] = 10 Then
    ConsoleWrite("Inversao conferida nas extremidades." & @CRLF)
Else
    ConsoleWrite("Inversao incorreta." & @CRLF)
EndIf

; Inverter duas vezes devolve o vetor original.
Inverter($aOriginal)
ConsoleWrite("Duas inversoes: " & _ArrayToString($aOriginal, ", ") & @CRLF)
