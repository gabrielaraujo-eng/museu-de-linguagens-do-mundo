; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 5: fatorial recursivo com validacao de entrada
; Tema: funcoes recursivas, SetError e @error
; ============================================================

Func Fatorial($iN)
    ; A funcao devolve 0 e marca @error quando o argumento e invalido.
    If Not IsInt($iN) Then
        Return SetError(1, 0, 0)
    EndIf
    If $iN < 0 Then
        Return SetError(2, 0, 0)
    EndIf
    If $iN <= 1 Then
        Return 1
    EndIf
    Return $iN * Fatorial($iN - 1)
EndFunc

Local $aEntradas[6] = [0, 1, 5, 10, -3, 4.5]
Local $i = 0
Local $iValor = 0
Local $iResultado = 0

For $i = 0 To UBound($aEntradas) - 1
    $iValor = $aEntradas[$i]
    $iResultado = Fatorial($iValor)

    ; @error precisa ser lido logo apos a chamada.
    If @error = 0 Then
        ConsoleWrite($iValor & "! = " & $iResultado & @CRLF)
    ElseIf @error = 1 Then
        ConsoleWrite($iValor & " -> argumento nao inteiro" & @CRLF)
    Else
        ConsoleWrite($iValor & " -> argumento negativo nao tem fatorial" & @CRLF)
    EndIf
Next

; O fatorial cresce muito rapido: 12! ainda e pequeno, 20! ja e enorme.
ConsoleWrite(@CRLF & "12! = " & Fatorial(12) & @CRLF)
ConsoleWrite("20! = " & Fatorial(20) & @CRLF)
ConsoleWrite("Acima de 20! o valor nao cabe mais em um inteiro de 64 bits." & @CRLF)
