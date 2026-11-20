; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 2: variaveis, escopo e tipos dinamicos
; ============================================================

#include <MsgBoxConstants.au3>

; AutoIt nao declara tipos: a variavel recebe o tipo do valor atribuido.
;   Local  -> visivel apenas no escopo atual (script ou funcao)
;   Global -> visivel em todo o script
;   Const  -> valor imutavel depois da declaracao
Global Const $VERSAO = "1.0"
Global $gExecucoes = 0

Local $iInteiro = 42
Local $fReal = 3.14159
Local $sTexto = "AutoIt v3"
Local $bAtivo = True
Local $kNulo = Null
Local $aNumeros[3] = [10, 20, 30]

; VarGetType devolve o tipo interno como texto.
ConsoleWrite("$iInteiro -> " & VarGetType($iInteiro) & " = " & $iInteiro & @CRLF)
ConsoleWrite("$fReal    -> " & VarGetType($fReal) & " = " & $fReal & @CRLF)
ConsoleWrite("$sTexto   -> " & VarGetType($sTexto) & " = " & $sTexto & @CRLF)
ConsoleWrite("$bAtivo   -> " & VarGetType($bAtivo) & " = " & $bAtivo & @CRLF)
ConsoleWrite("$kNulo    -> " & VarGetType($kNulo) & @CRLF)
ConsoleWrite("$aNumeros -> " & VarGetType($aNumeros) & " com " & UBound($aNumeros) & " elementos" & @CRLF)

; O operador & converte para texto; + - * / usam contexto numerico.
Local $sRotulo = "Total: " & ($aNumeros[0] + $aNumeros[1] + $aNumeros[2])
ConsoleWrite($sRotulo & @CRLF)

; Conversoes explicitas: Number() le texto numerico, Int() trunca.
Local $iDeTexto = Int(Number("007"))
ConsoleWrite("Int(Number(""007"")) = " & $iDeTexto & @CRLF)

; Tipagem dinamica: a mesma variavel pode mudar de tipo na proxima atribuicao.
$iInteiro = "agora sou uma string"
ConsoleWrite("$iInteiro -> " & VarGetType($iInteiro) & " = " & $iInteiro & @CRLF)

; Testes de tipo evitam erros em tempo de execucao.
If IsNumber($fReal) Then
    ConsoleWrite("$fReal e numerico" & @CRLF)
EndIf

If IsString($sTexto) Then
    $gExecucoes += 1
EndIf

If IsArray($aNumeros) Then
    $gExecucoes += 1
EndIf

If IsKeyword($kNulo) Then
    ConsoleWrite("$kNulo continua sendo a palavra-chave Null" & @CRLF)
EndIf

MsgBox($MB_OK + $MB_ICONINFORMATION, "Exemplo 2", "Versao " & $VERSAO & @CRLF & "Verificacoes bem-sucedidas: " & $gExecucoes)
