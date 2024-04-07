import Game.Metadata
import Game.Levels.Tutorial

World "Addition"
Level 6

Title "→"

/--
## 説明1
`t : P → Q`と`h:P`という仮定があるとき、`apply t at h`とすることで
`h`が`h : Q`に変化します。

## 説明2
`t : P → Q`という仮定があり、ゴールが`Q`**Pではないので注意すること**の時、
`apply t`とすることでゴールが`P`に変化します。
-/
TacticDoc apply

namespace MyGame
Introduction "
## 新しいタクティク:`apply`
`rw`とはまた違ったゴールの書き換え方を紹介します。
これは、「$P$ならば$Q$」のような形の仮定に使えるものです
`apply`では、$P$ならば$Q$かつ$P$なら$Q$であるということを使えます！
"

/--
## 説明
$x,y,z$を自然数とする。$x+n=y+n$なら$x=y$である。
-/
TheoremDoc MyGame.add_right_cancel as "add_right_cancel" in "+"

/--
## 説明
$x,y$を自然数とする。$x'=y'$なら、$x=y$である。
-/
TheoremDoc MyGame.succ_inj as "succ_inj" in "ℕ"

/--$∀{x,y,n}∈ℕ^3,x + n = y + n → x = y$-/
Statement add_right_cancel (x y n:ℕ)(h:x + n = y + n) : x = y := by
  Hint (strict := true) "とりあえず`induction n`しましょうか。"
  induction n
  rw[add_zero,add_zero] at h
  rw[h]
  rfl
  Hint (hidden := true) "succ.injが使えるように変形してみましょう。"
  rw[add_succ,add_succ] at h
  apply succ_inj at h
  apply n_ih at h
  rw[h]
  rfl
Conclusion "
もう一つの書き換えのやり方はわかりましたか？早速使っていきましょう！
"

NewTactic apply
NewTheorem MyGame.succ_inj
/- Use these commands to add items to the game's inventory. -/

-- NewLemma Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
