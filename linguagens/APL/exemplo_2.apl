⍝ exemplo_2.apl — Variáveis, números, caracteres e booleanos
⍝ Em APL não há declaração de tipos: a variável assume a forma do valor.
⎕IO ← 1

inteiro   ← 42                 ⍝ escalar numérico
real      ← 3.5                ⍝ escalar fracionário
negativo  ← ¯7                 ⍝ ¯ é o sinal negativo de APL (não é hífen)
texto     ← 'APL'              ⍝ vetor de caracteres (string)
bools     ← 1 0 1 0            ⍝ booleanos são 0 e 1, sem tipo separado
vazio     ← ⍳0                 ⍝ vetor vazio de números

⎕← 'inteiro = ', ⍕inteiro
⎕← 'real = ', ⍕real
⎕← 'negativo = ', ⍕negativo
⎕← 'texto = ', texto
⎕← 'bools = ', ∊⍕bools
⎕← 'comprimento do texto = ', ⍕⍴texto
⎕← 'comprimento do vetor vazio = ', ⍕⍴vazio
⎕← 'inteiro + real = ', ⍕inteiro + real
⎕← 'posto (rank) do inteiro = ', ⍕⍴⍴inteiro   ⍝ ⍴⍴ dá o posto da variável
⎕← 'posto (rank) de bools = ', ⍕⍴⍴bools
