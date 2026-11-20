; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 7: divisao protegida contra divisor zero
; Tema: sinalizacao de erro com SetError e leitura de @error
; ============================================================

Func Dividir($fDividendo, $fDivisor)
    If Not IsNumber($fDividendo) Or Not IsNumber($fDivisor) Then
        Return SetError(1, 0, 0)
    EndIf
    If $fDivisor = 0 Then
        Return SetError(2, 0, 0)
    EndIf
    Return $fDividendo / $fDivisor
EndFunc

; Pares de teste: dois validos, um com divisor zero e um nao numerico.
Local $aPares[4][2] = [[10, 4], [7, 2], [5, 0], ["abc", 3]]
Local $i = 0
Local $vResultado = 0

For $i = 0 To UBound($aPares) - 1
    $vResultado = Dividir($aPares[$i][0], $aPares[$i][1])

    ; @error e zerado pela chamada seguinte, por isso e lido imediatamente.
    If @error = 0 Then
        ConsoleWrite($aPares[$i][0] & " / " & $aPares[$i][1] & " = " & StringFormat("%.4f", $vResultado) & @CRLF)
    ElseIf @error = 2 Then
        ConsoleWrite($aPares[$i][0] & " / " & $aPares[$i][1] & " -> erro 2: divisao por zero" & @CRLF)
    Else
        ConsoleWrite($aPares[$i][0] & " / " & $aPares[$i][1] & " -> erro 1: argumento nao numerico" & @CRLF)
    EndIf
Next

; O valor de retorno de uma chamada com erro tambem e util como sentinela.
Local $fTeste = Dividir(1, 0)
If $fTeste = 0 And @error = 2 Then
    ConsoleWrite(@CRLF & "Sentinela confirmada: retorno 0 e @error 2." & @CRLF)
EndIf
