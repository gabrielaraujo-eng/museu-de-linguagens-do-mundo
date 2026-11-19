module exercicio_4 where

open import Agda.Builtin.Nat

-- Exercício: conte até zero; a recursão deve terminar.
desc : Nat → Nat
desc zero = zero
desc (suc n) = n
