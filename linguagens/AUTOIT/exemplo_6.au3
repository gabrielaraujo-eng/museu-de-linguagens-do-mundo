; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 6: estruturas de dados (arrays 1D, 2D e funcoes de Array.au3)
; ============================================================

; Array.au3 traz funcoes auxiliares: _ArraySort, _ArrayToString,
; _ArrayDisplay, _ArrayAdd, _ArrayReverse, entre outras.
#include <Array.au3>

; Array 1D: indices sempre comecam em 0 e vao ate UBound() - 1.
Local $aNotas[5] = [7, 9, 5, 10, 8]
ConsoleWrite("Elementos: " & UBound($aNotas) & @CRLF)

Local $i = 0
For $i = 0 To UBound($aNotas) - 1
    ConsoleWrite("$aNotas[" & $i & "] = " & $aNotas[$i] & @CRLF)
Next

; Array 2D: matriz com 2 linhas e 3 colunas.
Local $aMatriz[2][3] = [[1, 2, 3], [4, 5, 6]]
Local $j = 0
For $i = 0 To UBound($aMatriz) - 1
    For $j = 0 To UBound($aMatriz, 2) - 1
        ConsoleWrite($aMatriz[$i][$j] & " ")
    Next
    ConsoleWrite(@CRLF)
Next
ConsoleWrite("Linhas: " & UBound($aMatriz) & " | Colunas: " & UBound($aMatriz, 2) & @CRLF)

; StringSplit devolve um array 1-based, com a contagem em [0].
; Com a opcao $STR_NOCOUNT o array passa a ser 0-based.
Local $aCampos = StringSplit("Ana;Bruno;Carla;Davi", ";")
ConsoleWrite("Campos: " & $aCampos[0] & @CRLF)
For $i = 1 To $aCampos[0]
    ConsoleWrite("  " & $i & ": " & $aCampos[$i] & @CRLF)
Next

; _ArraySort ordena o proprio array (1 = decrescente).
_ArraySort($aNotas)
ConsoleWrite("Ordenado: " & _ArrayToString($aNotas, ", ") & @CRLF)
_ArraySort($aNotas, 1)
ConsoleWrite("Decrescente: " & _ArrayToString($aNotas, ", ") & @CRLF)

; _ArrayAdd acrescenta um elemento ao final; o array precisa existir.
_ArrayAdd($aNotas, 6)
ConsoleWrite("Apos _ArrayAdd: " & _ArrayToString($aNotas, ", ") & @CRLF)

; ReDim redimensiona preservando o conteudo ja existente.
ReDim $aNotas[UBound($aNotas) + 1]
$aNotas[UBound($aNotas) - 1] = 4
ConsoleWrite("Apos ReDim: " & _ArrayToString($aNotas, ", ") & @CRLF)

; Busca linear dentro do array.
Func IndiceDe($aLista, $vProcurado)
    Local $iPos = 0
    For $iPos = 0 To UBound($aLista) - 1
        If $aLista[$iPos] = $vProcurado Then
            Return $iPos
        EndIf
    Next
    Return -1
EndFunc

ConsoleWrite("Indice do valor 9: " & IndiceDe($aNotas, 9) & @CRLF)
ConsoleWrite("Indice do valor 99: " & IndiceDe($aNotas, 99) & @CRLF)

; O AutoIt 3.3.16 ou superior tambem oferece Map (chave -> valor),
; com $mMapa["chave"] e as funcoes MapKeys()/MapExists().
