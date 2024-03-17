import Game.Metadata

World "Tutorial"
Level 3

Title "逆走"

namespace MyGame
Introduction"(Lv2で見つけた人もいるかもしれませんが)
実は`h : X=Y`という仮定がある場合、
ゴールの`X`を`Y`に置き換えるだけでなく、
**`Y`を`X`に置き換えることもできます**
早速試してみましょう！
"

Statement (x y z:Nat)(h1 : z = x)(h2 : z = y) : x + y = z + z := by
  Hint (hidden := true) "`rw`のマニュアルは読みましたか？"
  Branch
    rw[h2] at h1
    Hint (strict := true) "イースターエッグ発見！ #2"
    rw[h2,h1]
    rfl
  Branch
    rw[h1] at h2
    Hint (strict := true) "イースターエッグ発見！ #2"
    rw[h1,h2]
    rfl
  rw[←h1,←h2]
  rfl

Conclusion "このように、数学では
「逆から考える」というテクニックが有効なことがあります。
ゴールを閉じるために必要なことを考えると、
自ずと答えが見えてくるでしょう。
"
