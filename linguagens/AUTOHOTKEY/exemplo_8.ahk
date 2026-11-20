#Requires AutoHotkey v2.0
; exemplo_8.ahk - manipulação de strings
;
; Em v2 as funções de string são funções de verdade e devolvem o resultado,
; em vez de alterar uma variável de saída como no v1 (StringUpper, Var, Var).
; A concatenação pode ser implícita ("a" var) ou com o ponto ("a" . var).

frase := "  AutoHotkey automatiza tarefas do Windows  "

MsgBox("Comprimento original: " StrLen(frase))

limpa := Trim(frase)
MsgBox("Sem espaços nas pontas: [" limpa "]")

MsgBox("Maiúsculas: " StringUpper(limpa))
MsgBox("Minúsculas: " StringLower(limpa))

MsgBox("Primeiros 10 caracteres: " SubStr(limpa, 1, 10))
MsgBox("Últimos 7 caracteres: " SubStr(limpa, -7))

posicao := InStr(limpa, "tarefas")
MsgBox("A palavra 'tarefas' começa na posição " posicao ".")

trocada := StrReplace(limpa, "automatiza", "organiza")
MsgBox("Substituída: " trocada)

palavras := StrSplit(limpa, " ")
MsgBox("Quantidade de palavras: " palavras.Length)

; Reunir as palavras com hífens, sem hífen sobrando no início.
reunida := ""
for indice, palavra in palavras
    reunida .= (indice > 1 ? "-" : "") . palavra
MsgBox("Com hífens: " reunida)

; Formatação com marcadores numerados e casas decimais.
MsgBox(Format("Arquivo: {1}`nLinhas: {2}`nMédia: {3:.2f}", A_ScriptName, 12, 7.456))

; Comparação sensível a maiúsculas: InStr com CaseSense = true.
MsgBox("'Windows' aparece com maiúscula exata? " (InStr(limpa, "Windows", true) ? "sim" : "não"))
