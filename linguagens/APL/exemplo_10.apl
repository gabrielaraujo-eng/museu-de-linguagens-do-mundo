⍝ exemplo_10.apl — Algoritmos: crivo de Eratóstenes, ordenação e produto interno
⎕IO ← 1

⍝ Crivo: marca os múltiplos de cada primo até a raiz de n
∇ r ← primos n
  c ← n ⍴ 1
  c[1] ← 0
  i ← 2
TESTE:
  →(i > ⌊n * 0.5)/FIM
  →(c[i] = 0)/PROX
  mult ← 1 ↓ i × ⍳⌊n ÷ i      ⍝ múltiplos de i, sem o próprio i
  c[mult] ← 0
PROX:
  i ← i + 1
  →TESTE
FIM:
  r ← (c) / ⍳n
∇

⎕← 'primos até 50 = ', ∊⍕primos 50

⍝ Ordenação crescente e decrescente via ⍋ (grade up) e ⍒ (grade down)
v ← 42 7 19 3 88 15
⎕← 'vetor = ', ∊⍕v
⎕← 'ordenado = ', ∊⍕v[⍋v]
⎕← 'decrescente = ', ∊⍕v[⍒v]

⍝ Produto interno generalizado: +.× multiplica e soma
a ← 1 2 3
b ← 4 5 6
⎕← 'produto escalar de a e b = ', ⍕a +.× b

⍝ Multiplicação de matrizes pelo produto interno
m ← 2 3 ⍴ ⍳6
⎕← 'm +.× transposta de m:'
⎕← m +.× ⍉m

⍝ Máximo divisor comum por Euclides
∇ r ← a mdc b
TESTE:
  →(b = 0)/FIM
  t ← b
  b ← b | a
  a ← t
  →TESTE
FIM:
  r ← a
∇

⎕← 'mdc de 48 e 18 = ', ⍕48 mdc 18
⎕← 'mdc de 17 e 5 = ', ⍕17 mdc 5
