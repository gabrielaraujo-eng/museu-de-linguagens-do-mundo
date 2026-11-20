⍝ exemplo_6.apl — Estruturas de dados: vetores, matrizes e indexação
⍝ Todo dado em APL é um array; vetores e matrizes são apenas formas (shapes).
⎕IO ← 1

v ← 10 20 30 40 50                  ⍝ vetor de 5 números
⎕← 'v = ', ∊⍕v
⎕← 'comprimento de v = ', ⍕⍴v
⎕← 'primeiro e último = ', ∊⍕v[1], v[5]

m ← 2 3 ⍴ ⍳6                        ⍝ ⍴ remodela: matriz 2×3 com 1..6
⎕← 'matriz 2×3:'
⎕← m
⎕← 'forma de m = ', ∊⍕⍴m
⎕← 'elemento (2;3) = ', ⍕m[2;3]
⎕← 'segunda linha de m = ', ∊⍕m[2;]
⎕← 'transposta de m:'
⎕← ⍉m

cubo ← 2 2 2 ⍴ ⍳8                   ⍝ array de posto 3
⎕← 'posto do cubo = ', ⍕⍴⍴cubo

⎕← 'v + 100 = ', ∊⍕v + 100          ⍝ operação escalar aplicada a todo o vetor
⎕← 'm × 2:'
⎕← m × 2
