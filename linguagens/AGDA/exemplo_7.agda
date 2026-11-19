module exemplo_7 where

data Result (A E : Set) : Set where
  ok : A → Result A E
  error : E → Result A E

first : {A E : Set} → A → Result A E
first value = ok value
