module exercicio_6 where

open import Agda.Builtin.Nat

data List (A : Set) : Set where
  [] : List A
  _∷_ : A → List A → List A

length : {A : Set} → List A → Nat
length [] = 0
length (x ∷ xs) = 1 + length xs
