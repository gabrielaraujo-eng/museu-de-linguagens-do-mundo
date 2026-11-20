; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 4: lacos de repeticao (For, While, Do)
; ============================================================

; For ... Next com passo positivo implicito (1).
Local $i = 0
For $i = 1 To 10
    ConsoleWrite($i & " ")
Next
ConsoleWrite(@CRLF)

; Step define o passo; valores negativos fazem a contagem descer.
For $i = 10 To 1 Step -2
    ConsoleWrite($i & " ")
Next
ConsoleWrite(@CRLF)

; While ... WEnd testa a condicao antes de cada iteracao.
Local $iContador = 0
Local $iPotencia = 1
While $iContador < 5
    $iPotencia = $iPotencia * 2
    $iContador += 1
WEnd
ConsoleWrite("2^5 calculado com While = " & $iPotencia & @CRLF)

; Do ... Until executa o corpo pelo menos uma vez e testa no final.
Local $iTentativa = 0
Do
    $iTentativa += 1
Until $iTentativa >= 3
ConsoleWrite("Tentativas do Do/Until: " & $iTentativa & @CRLF)

; ContinueLoop salta para a proxima iteracao; ExitLoop encerra o laco.
For $i = 1 To 20
    If Mod($i, 2) = 0 Then
        ContinueLoop
    EndIf
    If $i > 9 Then
        ExitLoop
    EndIf
    ConsoleWrite("impar: " & $i & @CRLF)
Next

; Lacos aninhados: tabuada 1..3.
Local $j = 0
For $i = 1 To 3
    For $j = 1 To 3
        ConsoleWrite($i & "x" & $j & "=" & ($i * $j) & "  ")
    Next
    ConsoleWrite(@CRLF)
Next

; ExitLoop com nivel encerra mais de um laco de uma vez.
Local $bAchou = False
For $i = 1 To 5
    For $j = 1 To 5
        If ($i * $j) = 12 Then
            $bAchou = True
            ExitLoop 2
        EndIf
    Next
Next
ConsoleWrite("Produto 12 encontrado: " & $bAchou & " (i=" & $i & ", j=" & $j & ")" & @CRLF)
