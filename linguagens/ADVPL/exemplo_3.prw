#Include "Protheus.ch"

User Function Cond()
    Local nValor := 15

    If nValor > 10
        MsgAlert("Maior que 10")
    Else
        MsgAlert("Menor ou igual a 10")
    EndIf
Return
