module exemplo_4 where

open import Agda.Builtin.Nat

loop : Nat → Nat
loop zero = zero
loop (suc n) = loop n
