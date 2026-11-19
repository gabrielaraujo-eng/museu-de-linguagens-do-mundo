module exercicio_3 where

data Bool : Set where
  true false : Bool

not : Bool → Bool
not true = false
not false = true
