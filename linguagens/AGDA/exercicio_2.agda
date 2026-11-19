module exercicio_2 where

open import Agda.Builtin.Nat

-- Exercício: implemente soma usando as assinaturas fornecidas.
soma : Nat → Nat → Nat
soma zero n = n
soma (suc m) n = suc (soma m n)
