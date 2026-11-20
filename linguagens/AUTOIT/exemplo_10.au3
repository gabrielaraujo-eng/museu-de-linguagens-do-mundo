; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 10: conceito avancado - GUI nativa + algoritmo de ordenacao
; ============================================================

; GUIConstantsEx.au3 define $GUI_EVENT_CLOSE e os estilos de janela.
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Global $g_aValores[8] = [42, 7, 19, 3, 88, 15, 60, 24]

; Ordenacao por trocas (bubble sort) escrita a mao.
; ByRef permite ordenar o array original; o retorno conta as trocas.
Func OrdenarPorTrocas(ByRef $aDados)
    Local $iTrocas = 0
    Local $iTemp = 0
    Local $i = 0
    Local $j = 0

    For $i = 0 To UBound($aDados) - 2
        For $j = 0 To UBound($aDados) - 2 - $i
            If $aDados[$j] > $aDados[$j + 1] Then
                $iTemp = $aDados[$j]
                $aDados[$j] = $aDados[$j + 1]
                $aDados[$j + 1] = $iTemp
                $iTrocas += 1
            EndIf
        Next
    Next

    Return $iTrocas
EndFunc

Func ListaComoTexto($aDados)
    Local $sTexto = ""
    Local $i = 0
    For $i = 0 To UBound($aDados) - 1
        If $i > 0 Then
            $sTexto = $sTexto & ", "
        EndIf
        $sTexto = $sTexto & $aDados[$i]
    Next
    Return $sTexto
EndFunc

; GUICreate devolve o handle da janela.
Local $hJanela = GUICreate("Museu de Linguagens - AutoIt", 420, 200, -1, -1)
Local $idRotulo = GUICtrlCreateLabel("Valores: " & ListaComoTexto($g_aValores), 15, 15, 390, 40)
Local $idBotao = GUICtrlCreateButton("Ordenar", 15, 80, 120, 32)
Local $idSair = GUICtrlCreateButton("Fechar", 150, 80, 120, 32)
Local $idStatus = GUICtrlCreateLabel("Clique em Ordenar para executar o algoritmo.", 15, 130, 390, 40)

; @SW_SHOW e uma macro do AutoIt (valor 5).
GUISetState(@SW_SHOW, $hJanela)

Local $iMsg = 0
Local $iTrocas = 0

While True
    $iMsg = GUIGetMsg()

    Switch $iMsg
        Case $GUI_EVENT_CLOSE, $idSair
            ExitLoop

        Case $idBotao
            $iTrocas = OrdenarPorTrocas($g_aValores)
            GUICtrlSetData($idRotulo, "Valores: " & ListaComoTexto($g_aValores))
            GUICtrlSetData($idStatus, "Ordenado com " & $iTrocas & " trocas.")
    EndSwitch

    Sleep(10)
WEnd

GUIDelete($hJanela)

MsgBox($MB_OK, "Exemplo 10", "Resultado final: " & ListaComoTexto($g_aValores) & @CRLF & "Trocas: " & $iTrocas)
