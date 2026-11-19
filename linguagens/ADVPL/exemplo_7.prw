#Include "Protheus.ch"

User Function ErrorSequence()
    Local nResultado := 0

    // BEGIN SEQUENCE/RECOVER depende da versão do Application Server.
    BEGIN SEQUENCE
        nResultado := 1 / 0
    RECOVER
        Alert("Erro recuperado")
    END SEQUENCE
Return
