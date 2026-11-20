; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 1: "Ola, Mundo" - estrutura minima de um script
; AutoIt v3 - executar com AutoIt3.exe ou compilar com Aut2Exe
; ============================================================

; #include carrega bibliotecas padrao (.au3) em tempo de compilacao.
; MsgBoxConstants.au3 define $MB_OK, $MB_ICONINFORMATION etc.
#include <MsgBoxConstants.au3>

; ConsoleWrite escreve na saida padrao. No SciTE o texto aparece no
; painel de saida; fora do editor, aparece no console que chamou o script.
ConsoleWrite("Ola, Mundo!" & @CRLF)

; MsgBox exibe uma janela modal e devolve o ID do botao pressionado.
; Assinatura: MsgBox(flag, "titulo", "texto" [, timeout [, hwnd]])
Local $iResposta = MsgBox($MB_OK + $MB_ICONINFORMATION, "Museu de Linguagens", "Ola, Mundo!" & @CRLF & "Este e o primeiro script AutoIt v3.")
ConsoleWrite("MsgBox devolveu: " & $iResposta & " (1 = $IDOK)" & @CRLF)

; Macros com @ sao preenchidas pelo interpretador em tempo de execucao.
ConsoleWrite("Script : " & @ScriptName & @CRLF)
ConsoleWrite("Pasta  : " & @ScriptDir & @CRLF)
ConsoleWrite("AutoIt : " & @AutoItVersion & @CRLF)
ConsoleWrite("Compilado: " & @Compiled & @CRLF)

; Comentario de bloco: #cs ... #ce
#cs
    Diferencas em relacao a outras linguagens da pasta:
    - nao ha funcao main(); o script e executado de cima para baixo;
    - o ponto e virgula inicia comentario de uma linha;
    - variaveis comecam com $ e nao precisam de declaracao de tipo.
#ce
