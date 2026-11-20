⍝ exemplo_4.apl — Repetições: laço explícito com rótulos e laço implícito
⎕IO ← 1

⍝ Laço implícito: operações sobre vetores substituem a maioria dos laços.
⎕← '⍳5 = ', ∊⍕⍳5
⎕← 'soma de 1 a 10 = ', ⍕+/⍳10

⍝ Laço explícito dentro de uma função (rótulos exigem função)
∇ r ← somaQuadrados n
  i ← 1
  r ← 0
INICIO:
  →(i > n)/FIM
  r ← r + i * 2
  ⎕← 'parcial em i=', (⍕i), ': ', ⍕r
  i ← i + 1
  →INICIO
FIM:
∇

⎕← 'soma dos quadrados de 1 a 5 = ', ⍕somaQuadrados 5
