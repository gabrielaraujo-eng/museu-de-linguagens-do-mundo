⍝ exemplo_1.apl — Olá, Mundo em APL
⍝ APL é uma notação de arrays: não há precedência de operadores, a avaliação
⍝ é sempre da direita para a esquerda. Comentários começam com ⍝.
⎕IO ← 1                        ⍝ origem dos índices: 1 (valor padrão)
⎕← 'Olá, Mundo!'               ⍝ ⎕← (quad-arrow) exibe o valor à direita
⎕← 'APL foi criada por Kenneth E. Iverson e publicada em 1962'
⎕← 'Este texto é um vetor de caracteres: ', ⍕⍴'APL'  ⍝ ⍴ dá a forma (comprimento)
