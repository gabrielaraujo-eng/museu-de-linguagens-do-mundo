⍝ exercicio_2.apl — Conversão de Celsius para Fahrenheit
⍝ Tarefa: converter um vetor de temperaturas com F = (C × 9 ÷ 5) + 32.
⎕IO ← 1

celsius ← 0 20 37 100

fahrenheit ← (celsius × 9 ÷ 5) + 32

⎕← 'Celsius:    ', ∊⍕celsius
⎕← 'Fahrenheit: ', ∊⍕fahrenheit
⎕← 'Água ferve a 100 C = ', (⍕fahrenheit[4]), ' F'
