; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 7: tratamento de erros com SetError e @error
; ============================================================

; O AutoIt nao possui try/catch. O padrao da linguagem e:
;   1. a funcao sinaliza a falha com SetError(codigo, extended, retorno);
;   2. o chamador testa @error imediatamente depois da chamada,
;      porque a maioria das funcoes sobrescreve @error.
#include <FileConstants.au3>

; Registra uma funcao para rodar no encerramento do script.
OnAutoItExitRegister("_AoEncerrar")

Func LerLinhas($sCaminho)
    If Not FileExists($sCaminho) Then
        Return SetError(1, 0, 0)
    EndIf

    Local $hArquivo = FileOpen($sCaminho, $FO_READ)
    If $hArquivo = -1 Then
        Return SetError(2, 0, 0)
    EndIf

    Local $aLinhas[1] = [0]
    Local $sLinha = ""

    While True
        $sLinha = FileReadLine($hArquivo)
        If @error = -1 Then
            ExitLoop
        EndIf
        _ArrayPush($aLinhas, $sLinha)
    WEnd

    FileClose($hArquivo)
    Return $aLinhas
EndFunc

; Funcao auxiliar: acrescenta ao array mantendo a contagem em [0].
Func _ArrayPush(ByRef $aDestino, $sValor)
    Local $iPos = $aDestino[0] + 1
    ReDim $aDestino[$iPos + 1]
    $aDestino[$iPos] = $sValor
    $aDestino[0] = $iPos
EndFunc

Func _AoEncerrar()
    ConsoleWrite("[encerrando] limpeza final executada" & @CRLF)
EndFunc

Local $sArquivo = @ScriptDir & "\exemplo_7_temp.txt"

; Escrita: FileOpen com $FO_OVERWRITE cria o arquivo se ele nao existir.
Local $hSaida = FileOpen($sArquivo, $FO_OVERWRITE)
If $hSaida = -1 Then
    ConsoleWrite("Erro ao criar o arquivo de trabalho." & @CRLF)
    Exit 1
EndIf
FileWriteLine($hSaida, "primeira linha")
FileWriteLine($hSaida, "segunda linha")
FileWriteLine($hSaida, "terceira linha")
FileClose($hSaida)

; Caminho valido: @error fica 0 e o array traz as linhas.
Local $aResultado = LerLinhas($sArquivo)
Local $iErro = @error
If $iErro = 0 Then
    ConsoleWrite("Linhas lidas: " & $aResultado[0] & @CRLF)
    Local $i = 0
    For $i = 1 To $aResultado[0]
        ConsoleWrite("  " & $aResultado[$i] & @CRLF)
    Next
Else
    ConsoleWrite("Falha na leitura, codigo " & $iErro & @CRLF)
EndIf

; Caminho inexistente: a funcao devolve SetError(1, 0, 0).
Local $aVazio = LerLinhas(@ScriptDir & "\nao_existe.txt")
$iErro = @error
If $iErro = 1 Then
    ConsoleWrite("Erro esperado 1: arquivo inexistente" & @CRLF)
Else
    ConsoleWrite("Comportamento inesperado: " & $iErro & @CRLF)
EndIf

; @extended carrega informacao extra definida pela funcao.
Local $iCodigo = 0
SetError(7, 42, 0)
$iCodigo = @error
ConsoleWrite("@error=" & $iCodigo & " | @extended=" & @extended & @CRLF)

FileDelete($sArquivo)
