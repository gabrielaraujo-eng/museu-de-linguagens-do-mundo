⍝ exercicio_9.apl — Hipotenusa e área de um triângulo retângulo
⍝ Tarefa: aplicar Pitágoras e a fórmula da área com base e altura dados.
⎕IO ← 1

∇ r ← hipotenusa catetos
  r ← ((catetos[1] * 2) + catetos[2] * 2) * 0.5
∇

∇ r ← b area h
  r ← b × h ÷ 2
∇

⎕← 'catetos 3 e 4 → hipotenusa = ', ⍕hipotenusa 3 4
⎕← 'catetos 5 e 12 → hipotenusa = ', ⍕hipotenusa 5 12
⎕← 'área de base 6 e altura 4 = ', ⍕6 area 4
⎕← 'perímetro do triângulo 3-4-5 = ', ⍕3 + 4 + hipotenusa 3 4
