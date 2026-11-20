⍝ exemplo_3.apl — Controle de fluxo com desvios condicionais
⍝ O desvio →(condição)/RÓTULO salta para o rótulo quando a condição é 1.
⍝ Rótulos só existem dentro de funções (∇ ... ∇); por isso o programa
⍝ fica em uma função sem argumentos, chamada no fim do arquivo.
⎕IO ← 1

∇ classifica nota
  →(nota ≥ 90)/EXCELENTE
  →(nota ≥ 70)/BOM
  →(nota ≥ 50)/REGULAR
  ⎕← 'Conceito: insuficiente'
  →FIM
EXCELENTE:
  ⎕← 'Conceito: excelente'
  →FIM
BOM:
  ⎕← 'Conceito: bom'
  →FIM
REGULAR:
  ⎕← 'Conceito: regular'
FIM:
  ⎕← 'Nota avaliada: ', ⍕nota
∇

classifica 72
classifica 95
classifica 40
