module exercicio_7 where

data Maybe (A : Set) : Set where
  nothing : Maybe A
  just : A → Maybe A

safeValue : {A : Set} → A → Maybe A
safeValue x = just x
