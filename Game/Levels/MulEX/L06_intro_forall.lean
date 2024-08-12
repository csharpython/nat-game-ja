import Game.Levels.Mul
import Game.Levels.Le

World "MulEX"
Level 6

Title "(*‘∀‘)"

namespace MyGame


Introduction "
## 全称記号
∀←これです。
`∀(a:ℕ),P a`は、
全ての$a$に対して$P a$を満たすということを表します。
`intro`が使えます。
"

TheoremTab "*"

/--$∃e∈ℕ,∀n∈ℕ,n*e=n$-/
Statement : ∃(e:ℕ),∀(n:ℕ),n*e=n := by
  use 1
  intro
  rw[mul_one]
  rfl

Conclusion "
そうです。次の問題がめちゃくちゃ難しいです。
"

/- Use these commands to add items to the game's inventory. -/

-- NewTactic induction
-- NewTheorem eq_comm
-- NewDefinition Nat Add Eq
