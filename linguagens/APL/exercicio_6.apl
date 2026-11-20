⍝ exercicio_6.apl — Inverter um vetor e somá-lo
⍝ Tarefa: inverter cinco posições com ⌽ e acumular com +/.
⎕IO ← 1

original ← 3 1 4 1 5
invertido ← ⌽original

⎕← 'original:  ', ∊⍕original
⎕← 'invertido: ', ∊⍕invertido
⎕← 'soma: ', ⍕+/invertido
⎕← 'maior: ', ⍕⌈/original
⎕← 'vetor é palíndromo? ', ⍕original ≡ invertido
