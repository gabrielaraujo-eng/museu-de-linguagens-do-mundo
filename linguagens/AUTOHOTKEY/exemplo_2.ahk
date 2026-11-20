#Requires AutoHotkey v2.0
; exemplo_2.ahk - variáveis, tipos primitivos e conversões
;
; Em AutoHotkey v2 não há declaração de variáveis: a atribuição com ":="
; cria a variável no escopo atual. Os tipos primitivos são String,
; Integer e Float; valores booleanos são os inteiros 1 (true) e 0 (false).

nome := "Museu de Linguagens do Mundo"   ; String
ano := 2002                              ; Integer
versao := 2.0                            ; Float
ativo := true                            ; booleano (inteiro 1)

MsgBox("Nome: " nome)
MsgBox("Ano de criação da pasta: " ano " | Versão da linguagem: " versao)
MsgBox("Script ativo? " (ativo ? "sim" : "não"))

; Verificação de tipo em tempo de execução
MsgBox("ano é inteiro? " (IsInteger(ano) ? "sim" : "não"))
MsgBox("ano é número? " (IsNumber(ano) ? "sim" : "não"))

; Conversões explícitas: Integer(), Float() e String()
textoNumero := "42"
numero := Integer(textoNumero)
MsgBox(textoNumero " (string) + 8 = " (numero + 8) " (inteiro)")

preco := Float("19.9")
quantidade := 3
MsgBox("Total: " Format("{:.2f}", preco * quantidade))

; Uma variável pode trocar de tipo livremente; o valor antigo é descartado.
valor := 10
valor := "agora sou texto"
MsgBox("Valor atual: " valor)

; Variáveis embutidas começam com A_ e são somente leitura.
MsgBox("Script: " A_ScriptName "`nPasta: " A_ScriptDir "`nData: " A_YYYY "-" A_MM "-" A_DD)
