⍝ exercicio_7.apl — Proteger a divisão contra divisor zero
⍝ Tarefa: função diádica que devolve uma mensagem de erro em vez de abortar.
⎕IO ← 1

∇ r ← a seguro b
  →(b = 0)/ERRO
  r ← 'resultado: ', ⍕a ÷ b
  →0
ERRO:
  r ← 'erro: divisor zero'
∇

⎕← 12 seguro 4
⎕← 12 seguro 0
⎕← 0 seguro 5
⎕← 'a função devolve texto nos dois casos, sem interromper o programa'
