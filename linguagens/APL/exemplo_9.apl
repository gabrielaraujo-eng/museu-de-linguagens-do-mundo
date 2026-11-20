⍝ exemplo_9.apl — Matemática com primitivas e funções
⎕IO ← 1

⎕← '2 * 10 = ', ⍕2 * 10
⎕← 'raiz quadrada de 2 = ', ⍕2 * 0.5
⎕← 'e = ', ⍕*1                    ⍝ *x é e elevado a x
⎕← 'logaritmo natural de 10 = ', ⍕⍟10
⎕← 'pi = ', ⍕○1                   ⍝ ○1 é pi
⎕← 'seno de pi/2 = ', ⍕1○○1÷2      ⍝ 1○x é sen(x)
⎕← 'valor absoluto de ¯5 = ', ⍕|¯5
⎕← 'teto de 2.3 = ', ⍕⌈2.3
⎕← 'piso de 2.7 = ', ⍕⌊2.7
⎕← 'resto de 17 dividido por 5 = ', ⍕5|17
⎕← 'máximo de 3 9 4 = ', ⍕⌈/3 9 4
⎕← 'mínimo de 3 9 4 = ', ⍕⌊/3 9 4
⎕← 'binomial 5 escolhe 2 = ', ⍕2!5
⎕← 'soma de 1 a 100 = ', ⍕+/⍳100

∇ r ← desvio v
  m ← (+/v) ÷ ⍴v
  r ← ((+/ (v - m) * 2) ÷ ⍴v) * 0.5
∇

⎕← 'média e desvio de 2 4 4 4 5 5 7 9:'
⎕← '  média = ', ⍕(+/2 4 4 4 5 5 7 9) ÷ 8
⎕← '  desvio = ', ⍕desvio 2 4 4 4 5 5 7 9
