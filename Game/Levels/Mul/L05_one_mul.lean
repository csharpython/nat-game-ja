import Game.Metadata
import Game.Levels.Mul.L01_mul_one
import Game.Levels.Mul.L04_mul_comm

World "Multiplication"
Level 5

Title "等倍(one_mul)"

namespace MyGame

Introduction "
これはいろいろな方法で証明できます!
帰納法、交換法則、`succ_mul`...
一番楽な方法はなんでしょうか?
"

TheoremTab "*"

/--
## 説明
$n$を自然数とする。$1\*n=n$である。
-/
TheoremDoc MyGame.one_mul as "one_mul" in "*"

/--$∀n∈ℕ,1 × n = n$-/
Statement one_mul (n:ℕ) : 1 * n = n := by
  Branch
    rw[mul_comm]
    Hint "たぶんこれが一番早いと思います"
    rw[mul_one]
    rfl
  induction n
  exact mul_zero _
  rw[mul_succ,n_ih]
  Branch
    exact add_one_eq_succ _
  rw[one_eq_succ_zero]
  Hint "イースターエッグ発見！ #3"
  rw[add_succ,add_zero]
  rfl
Conclusion "
いろいろな方法で証明ができるぞ...!
"

/- Use these commands to add items to the game's inventory. -/

-- NewTactic induction
-- NewLemma Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
