import Game.Metadata
import Game.Levels.Tutorial

World "Addition"
Level 1

Title "数学的ドミノ倒し(Zero_add)"

namespace MyGame
/--
## 説明
数学的帰納法を使うために必要なタクティクです。
-/
TacticDoc induction

Introduction "
## あらかじめ言っておきます。
**このゲームで和の定義として使われているのは
`a+0=a`と`(a + succ b)=succ (a + b)`のみです。
`0+a=a`は定義として使われていません。**
"

/--
## 説明
xを自然数とする。0+x=xである。
-/
TheoremDoc MyGame.zero_add as "zero_add" in "+"

/--$x∈ℕ,0 + x = x$-/
Statement zero_add (x:ℕ) : 0 + x = x := by
  Hint "`induction x`"
  induction x
  rw[add_zero]
  rfl
  rw[add_succ,n_ih]
  rfl

Conclusion "
いいですね！
"

/- Use these commands to add items to the game's inventory. -/

NewTactic induction
-- NewLemma Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
