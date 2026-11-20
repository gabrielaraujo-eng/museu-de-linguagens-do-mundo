; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 3: controle de fluxo (If, Select, Switch)
; ============================================================

#include <MsgBoxConstants.au3>

; If / ElseIf / Else / EndIf: cada ramo precisa fechar com EndIf.
Func Classificar($iNota)
    If $iNota < 0 Or $iNota > 100 Then
        Return "invalida"
    ElseIf $iNota >= 90 Then
        Return "A"
    ElseIf $iNota >= 75 Then
        Return "B"
    ElseIf $iNota >= 60 Then
        Return "C"
    Else
        Return "D"
    EndIf
EndFunc

; Select compara varias condicoes independentes com um unico valor.
Func NomeDoDia($iDia)
    Select
        Case $iDia = 1
            Return "domingo"
        Case $iDia = 2
            Return "segunda-feira"
        Case $iDia = 3
            Return "terca-feira"
        Case $iDia = 4
            Return "quarta-feira"
        Case Else
            Return "dia invalido"
    EndSelect
EndFunc

; Switch aceita listas de valores separadas por virgula em cada Case.
Func TipoDoValor($vValor)
    Switch VarGetType($vValor)
        Case "Int32", "Int64", "Double"
            Return "numero"
        Case "String"
            Return "texto"
        Case "Bool"
            Return "booleano"
        Case Else
            Return "outro"
    EndSwitch
EndFunc

Local $aNotas[5] = [95, 82, 61, 47, 120]
Local $i = 0

For $i = 0 To UBound($aNotas) - 1
    ConsoleWrite("Nota " & $aNotas[$i] & " -> conceito " & Classificar($aNotas[$i]) & @CRLF)
Next

ConsoleWrite("Dia 3: " & NomeDoDia(3) & @CRLF)
ConsoleWrite("Dia 9: " & NomeDoDia(9) & @CRLF)

; Operadores logicos: And, Or, Not. Negacao de condicao composta com Not (...)
Local $iIdade = 20
Local $bTemAutorizacao = False
If ($iIdade >= 18) And (Not $bTemAutorizacao) Then
    ConsoleWrite("Maior de idade, mas ainda precisa de autorizacao" & @CRLF)
EndIf

; Comparacao: "=" ignora maiusculas/minusculas, "==" diferencia.
Local $sA = "AutoIt"
Local $sB = "autoit"
If $sA = $sB Then
    ConsoleWrite("$sA = $sB  -> verdadeiro (comparacao sem diferenciar caixa)" & @CRLF)
EndIf
If $sA == $sB Then
    ConsoleWrite("$sA == $sB -> verdadeiro" & @CRLF)
Else
    ConsoleWrite("$sA == $sB -> falso (comparacao sensivel a caixa)" & @CRLF)
EndIf

ConsoleWrite("Tipo de 42: " & TipoDoValor(42) & @CRLF)
ConsoleWrite("Tipo de 'x': " & TipoDoValor("x") & @CRLF)
ConsoleWrite("Tipo de True: " & TipoDoValor(True) & @CRLF)

MsgBox($MB_OK, "Exemplo 3", "Conceito da nota 82: " & Classificar(82))
