module exercicio_10 where

open import Agda.Builtin.Nat

-- Exercício: multiplique por recursão sobre o segundo argumento.
multiplica : Nat → Nat → Nat
multiplica a zero = zero
multiplica a (suc b) = a + multiplica a b
