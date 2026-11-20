⍝ exemplo_8.apl — Manipulação de cadeias de caracteres
⍝ Uma string é um vetor de caracteres; as mesmas primitivas de arrays valem.
⎕IO ← 1

⍝ maiúscula por aritmética sobre os códigos Unicode (⎕UCS)
∇ r ← maiuscula s
  u ← ⎕UCS s
  r ← ⎕UCS u - 32 × (u ≥ 97) ∧ u ≤ 122
∇

nome ← 'Museu de Linguagens do Mundo'
⎕← 'texto: ', nome
⎕← 'comprimento: ', ⍕⍴nome
⎕← 'primeiros 5 caracteres: ', 5 ↑ nome
⎕← 'últimos 8 caracteres: ', ¯8 ↑ nome
⎕← 'sem os 6 primeiros: ', 6 ↓ nome
⎕← 'invertido: ', ⌽nome
⎕← 'em maiúsculas: ', maiuscula nome

⍝ busca e contagem de um caractere
⎕← 'primeira posição de "a": ', ⍕nome ⍳ 'a'
⎕← 'quantidade de "a": ', ⍕+/nome = 'a'
⎕← 'quantidade de espaços: ', ⍕+/nome = ' '

⍝ comparação e junção de textos
⎕← 'iguais? ', ⍕'APL' ≡ 'APL'
⎕← 'junção: ', 'APL', ' ', '1962'
