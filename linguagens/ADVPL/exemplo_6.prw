#Include "Protheus.ch"

User Function Arrays()
    Local aDados := {1, 2, 3}

    AAdd(aDados, 4)
    ConOut("Último item: " + cValToChar(aDados[4]))
Return
