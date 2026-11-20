⍝ exercicio_5.apl — Função recursiva de potência inteira
⍝ Tarefa: calcular base elevada a expoente sem usar o operador *.
⎕IO ← 1

∇ r ← base potencia exp
  →(exp = 0)/UM
  r ← base × base potencia exp - 1
  →0
UM:
  r ← 1
∇

⎕← '2 elevado a 10 = ', ⍕2 potencia 10
⎕← '3 elevado a 4 = ', ⍕3 potencia 4
⎕← '7 elevado a 0 = ', ⍕7 potencia 0
⎕← 'conferência com *: ', ⍕2 * 10
