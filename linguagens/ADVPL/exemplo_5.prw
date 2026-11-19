#Include "Protheus.ch"

User Function Calc()
    Local nResultado := Somar(10, 20)

    Alert("Soma: " + cValToChar(nResultado))
Return

Static Function Somar(nParcela1, nParcela2)
Return (nParcela1 + nParcela2)
