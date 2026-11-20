⍝ exercicio_3.apl — Classificar um número como positivo, negativo ou zero
⍝ Tarefa: usar desvios condicionais para classificar o valor de n.
⍝ Rótulos exigem uma função, então o teste fica em ∇ sinal n.
⎕IO ← 1

∇ sinal n
  →(n > 0)/POSITIVO
  →(n < 0)/NEGATIVO
  ⎕← (⍕n), ' é zero'
  →FIM
POSITIVO:
  ⎕← (⍕n), ' é positivo'
  →FIM
NEGATIVO:
  ⎕← (⍕n), ' é negativo'
FIM:
∇

sinal ¯12
sinal 0
sinal 7
