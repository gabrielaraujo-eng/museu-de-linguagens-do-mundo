⍝ exercicio_4.apl — Soma dos números pares de 1 a 20
⍝ Tarefa: selecionar os pares com 2|v (resto zero) e somá-los.
⎕IO ← 1

v ← ⍳20
pares ← (0 = 2 | v) / v

⎕← 'pares de 1 a 20: ', ∊⍕pares
⎕← 'quantidade: ', ⍕⍴pares
⎕← 'soma: ', ⍕+/pares
⎕← 'conferência (soma de 2,4,...,20): ', ⍕2 × +/⍳10
