#Include "Protheus.ch"

User Function ChooseCase()
    Local nValor := 1
    Local cResultado := ""

    Do Case
    Case nValor == 1
        cResultado := "um"
    Otherwise
        cResultado := "outro"
    EndCase
Return cResultado
