⍝ exemplo_5.apl — Funções definidas pelo usuário (tradfns)
⍝ A definição começa e termina com ∇ (delta). O cabeçalho declara o
⍝ resultado e os argumentos: monádica  ∇ r ← f x   /  diádica  ∇ r ← a f b
⎕IO ← 1

∇ r ← a soma b
  r ← a + b
∇

∇ r ← media v
  r ← (+/v) ÷ ⍴v
∇

∇ r ← fatorial n
  →(n ≤ 1)/BASE
  r ← n × fatorial n - 1
  →0
BASE:
  r ← 1
∇

⎕← '3 soma 4 = ', ⍕3 soma 4
⎕← 'média de 2 4 6 8 = ', ⍕media 2 4 6 8
⎕← 'fatorial de 5 = ', ⍕fatorial 5
⎕← 'fatorial de 0 = ', ⍕fatorial 0
