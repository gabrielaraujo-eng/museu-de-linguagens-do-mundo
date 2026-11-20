#Requires AutoHotkey v2.0
; exemplo_3.ahk - controle de fluxo: if, else if, else e operador ternário
;
; Em v2 a condição do if é uma expressão: if (nota >= 7). A forma v1
; "if nota >= 7" também funciona por ser expressão, mas comparações com
; "=" exigem parênteses para não serem lidas como atribuição/comando.

nota := 7.5

if (nota >= 9)
    conceito := "A"
else if (nota >= 7)
    conceito := "B"
else if (nota >= 5)
    conceito := "C"
else
    conceito := "D"

MsgBox("Nota " Format("{:.1f}", nota) " corresponde ao conceito " conceito ".")

; Operador ternário: condição ? valor_se_verdadeiro : valor_se_falso
situacao := (nota >= 6) ? "aprovado" : "reprovado"
MsgBox("Situação: " situacao)

; Entrada do usuário com InputBox. O retorno é um objeto com as
; propriedades Value (texto digitado) e Result (OK, Cancel ou Timeout).
entrada := InputBox("Digite um número inteiro:", "Exemplo 3 - Controle de fluxo")
if (entrada.Result != "OK")
    ExitApp()

n := Integer(entrada.Value)

if (n > 0)
    sinal := "positivo"
else if (n < 0)
    sinal := "negativo"
else
    sinal := "zero"

paridade := (Mod(n, 2) = 0) ? "par" : "ímpar"
MsgBox("O número " n " é " sinal " e " paridade ".")

; Operadores lógicos: && (e), || (ou), ! (não)
if (n != 0 && Mod(n, 3) = 0)
    MsgBox(n " também é múltiplo de 3.")
