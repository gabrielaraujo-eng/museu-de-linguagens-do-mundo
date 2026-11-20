; ============================================================
; Museu de Linguagens do Mundo - AUTOIT
; Exemplo 9: matematica com as funcoes nativas
; ============================================================

#include <MsgBoxConstants.au3>

Local Const $PI = 3.14159265358979

Local $iA = -7
Local $iB = 10
Local $iC = 3

; Valor absoluto, truncamento e arredondamento.
ConsoleWrite("Abs(-7)          = " & Abs($iA) & @CRLF)
ConsoleWrite("Int(10 / 3)      = " & Int($iB / $iC) & " (divisao inteira por truncamento)" & @CRLF)
ConsoleWrite("Round(3.14159,2) = " & Round(3.14159, 2) & @CRLF)

; Resto da divisao e potencia.
ConsoleWrite("Mod(10, 3)       = " & Mod($iB, $iC) & @CRLF)
ConsoleWrite("2 ^ 10           = " & 2 ^ 10 & @CRLF)
ConsoleWrite("Sqrt(144)        = " & Sqrt(144) & @CRLF)

; Trigonometria em radianos.
ConsoleWrite("Sin(0)           = " & Sin(0) & @CRLF)
ConsoleWrite("Cos(pi)          = " & Cos($PI) & @CRLF)
ConsoleWrite("Tan(0)           = " & Tan(0) & @CRLF)

; Exponencial e logaritmo natural.
ConsoleWrite("Log(Exp(1))      = " & Log(Exp(1)) & @CRLF)

; Formatacao numerica com StringFormat.
ConsoleWrite("Formatado: " & StringFormat("%08.3f", $PI) & @CRLF)
ConsoleWrite("Percentual: " & StringFormat("%.1f%%", 87.456) & @CRLF)

; Random(min, max, 1) devolve inteiro; com 0 devolve ponto flutuante.
Local $iDado = Random(1, 6, 1)
Local $fSorteio = Random(0, 1)
ConsoleWrite("Dado: " & $iDado & " | Sorteio real: " & StringFormat("%.4f", $fSorteio) & @CRLF)

; Protecao de dominio: a raiz quadrada exige argumento nao negativo.
Func RaizSegura($fValor)
    If $fValor < 0 Then
        Return SetError(1, 0, 0)
    EndIf
    Return Sqrt($fValor)
EndFunc

Local $fRaiz = RaizSegura(-4)
If @error = 1 Then
    ConsoleWrite("RaizSegura(-4): argumento negativo rejeitado" & @CRLF)
EndIf
ConsoleWrite("RaizSegura(81) = " & RaizSegura(81) & @CRLF)

; Conversao de graus para radianos e volta.
Func GrausParaRadianos($fGraus)
    Return $fGraus * $PI / 180
EndFunc

Func RadianosParaGraus($fRadianos)
    Return $fRadianos * 180 / $PI
EndFunc

ConsoleWrite("180 graus em radianos = " & Round(GrausParaRadianos(180), 4) & @CRLF)
ConsoleWrite("pi/2 em graus         = " & Round(RadianosParaGraus($PI / 2), 2) & @CRLF)

; Media aritmetica simples.
Local $fMedia = ($iB + $iC + 5) / 3
ConsoleWrite("Media de 10, 3 e 5    = " & Round($fMedia, 4) & @CRLF)

MsgBox($MB_OK, "Exemplo 9", "Sqrt(144) = " & Sqrt(144) & @CRLF & "2^10 = " & (2 ^ 10) & @CRLF & "Dado sorteado: " & $iDado)
