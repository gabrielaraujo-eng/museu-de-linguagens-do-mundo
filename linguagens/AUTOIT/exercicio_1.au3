; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exercicio 1: exibir uma saudacao em duas linhas
; Tema: saida de texto (ConsoleWrite e MsgBox)
; ============================================================

#include <MsgBoxConstants.au3>

Local $sNome = "Museu de Linguagens do Mundo"
Local $sLinha1 = "Bem-vindo ao " & $sNome & "!"
Local $sLinha2 = "Este texto foi produzido por um script AutoIt v3."

; Cada @CRLF encerra uma linha no console.
ConsoleWrite($sLinha1 & @CRLF)
ConsoleWrite($sLinha2 & @CRLF)

; A mesma mensagem em uma janela, com as duas linhas separadas por @CRLF.
MsgBox($MB_OK + $MB_ICONINFORMATION, "Exercicio 1", $sLinha1 & @CRLF & $sLinha2)

; Resumo do que foi enviado.
ConsoleWrite("Linha 1 tem " & StringLen($sLinha1) & " caracteres." & @CRLF)
ConsoleWrite("Linha 2 tem " & StringLen($sLinha2) & " caracteres." & @CRLF)
