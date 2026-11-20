⍝ exemplo_7.apl — Tratamento de erros
⍝ APL não tem try/catch no núcleo. O idioma é testar a pré-condição antes
⍝ da operação perigosa e desviar para um trecho de tratamento; o
⍝ interpretador sinaliza erros com nomes (DOMAIN ERROR, INDEX ERROR,
⍝ LENGTH ERROR) e o ⎕TRAP intercepta esses eventos.
⎕IO ← 1

⍝ 1) Divisão protegida: o divisor é testado antes da divisão
∇ r ← a divide b
  →(b = 0)/ZERO
  r ← a ÷ b
  →0
ZERO:
  ⎕← '  (proteção) divisão por zero evitada; resultado 0'
  r ← 0
∇

⎕← '10 divide 4 = ', ⍕10 divide 4
⎕← '10 divide 0 = ', ⍕10 divide 0

⍝ 2) Índice protegido: evita INDEX ERROR em vetor curto
∇ r ← v busca i
  →(i > ⍴v)/FORA
  r ← 'elemento ', (⍕i), ': ', ⍕v[i]
  →0
FORA:
  r ← 'índice ', (⍕i), ' fora da faixa de 1 a ', ⍕⍴v
∇

⎕← (3 6 9) busca 2
⎕← (3 6 9) busca 7

⍝ 3) Erro de domínio: a raiz de número negativo é checada antes de * 0.5
∇ r ← raiz x
  →(x < 0)/NEGATIVO
  r ← x * 0.5
  →0
NEGATIVO:
  ⎕← '  (proteção) raiz de número negativo: entrada recusada'
  r ← 0
∇

⎕← 'raiz de 49 = ', ⍕raiz 49
⎕← 'raiz de ¯9 = ', ⍕raiz ¯9
