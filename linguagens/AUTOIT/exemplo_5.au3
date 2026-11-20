; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 5: funcoes, parametros e recursao
; ============================================================

#include <MsgBoxConstants.au3>

; Funcoes podem ser definidas depois do ponto de chamada: o AutoIt
; resolve os nomes na compilacao do script.
ConsoleWrite("Soma(2, 3) = " & Soma(2, 3) & @CRLF)

; Parametros comuns sao passados por valor (uma copia chega a funcao).
Func Soma($a, $b)
    Return $a + $b
EndFunc

; ByRef passa a referencia: a funcao altera a variavel do chamador.
Func Dobrar(ByRef $vValor)
    $vValor = $vValor * 2
    Return $vValor
EndFunc

; Parametro com valor padrao: pode ser omitido na chamada.
Func Saudacao($sNome = "visitante")
    Return "Ola, " & $sNome & "!"
EndFunc

; Recursao: o caso base interrompe a descida.
Func Fatorial($iN)
    If $iN <= 1 Then
        Return 1
    EndIf
    Return $iN * Fatorial($iN - 1)
EndFunc

; Static conserva o valor entre chamadas da mesma funcao.
Func ProximaChamada()
    Static $iTotal = 0
    $iTotal += 1
    Return $iTotal
EndFunc

; Uma funcao pode devolver varios resultados por ByRef.
Func DivisaoInteira($iDividendo, $iDivisor, ByRef $iResto)
    $iResto = Mod($iDividendo, $iDivisor)
    Return Int($iDividendo / $iDivisor)
EndFunc

Local $iValor = 21
Local $iDobrado = Dobrar($iValor)
ConsoleWrite("Dobrar(21): retorno=" & $iDobrado & " e $iValor virou " & $iValor & @CRLF)

ConsoleWrite(Saudacao() & @CRLF)
ConsoleWrite(Saudacao("Museu") & @CRLF)

ConsoleWrite("5! = " & Fatorial(5) & @CRLF)
ConsoleWrite("10! = " & Fatorial(10) & @CRLF)

ProximaChamada()
ProximaChamada()
ConsoleWrite("Terceira chamada de ProximaChamada(): " & ProximaChamada() & @CRLF)

Local $iResto = 0
Local $iQuociente = DivisaoInteira(17, 5, $iResto)
ConsoleWrite("17 / 5 = " & $iQuociente & " com resto " & $iResto & @CRLF)

MsgBox($MB_OK, "Exemplo 5", Saudacao("Museu") & @CRLF & "Fatorial de 6 = " & Fatorial(6))
