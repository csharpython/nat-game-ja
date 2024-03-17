import Game.Metadata

World "Tutorial"
Level 2

Title "Eq."

namespace MyGame
/--
## 説明
例えば、`X=Y`という形の仮定や定理`h`があった場合、rw[h]を使用することで、
ゴール内の**全ての**`X`が`Y`に置き換わります。

## 変種
`rw[←h]` : `Y`が`X`になります。

`rw[h1,h2]` : `rw[h1]`,`rw[h2]`を順番に実行します。

`rw[h1,h2,h3]` : もちろん3つ以上の置き換えも可能です。

`rw[h1] at h2` : **`h2`に対して**`rw[h1]`を実行します。

もしかしたら、私が把握できていないだけで他にもあるかも知れません！

## 補足情報
本来の`rw`は置き換え後に`rfl`を実行します。
そうしなかった理由は、もちろんゲーム性です。
-/
TacticDoc rw
Introduction "同じことを表すものってよくありますよね。
例えば、「力」と「パワー」や、「1の次の数」と「2」などがあります。
Lean4で同じことを表すものを置き換えるときは\"rewrite\"を使います。
こうすることで、「力」と「パワー」が「力」と「力」になるので、rflが使えます！
"

Statement (e mc:Nat)(h : e = mc ^ 2) : e = mc ^ 2 := by
  Hint "rw[h]を使おう。"
  Branch
    rw[←h]
    Hint "イースターエッグ発見！ #1"
    rfl
  rw[h]
  rfl

Conclusion "いいですね！Lean4では、仮定として用意した等式だけでなく、
すでに分かったこと、「定理」(もしくは「補題」)を番う方法もあります！
詳細はLv4で！\n
ちなみに、`rewrite`より強いTactic`rw`がありますが、
それを使わなかった理由はもちろん、ゲーム性を上げるためです。"
--rewriteを使えるようにするとrwも使えるようになるそうです。現在修正中
/- Use these commands to add items to the game's inventory. -/

NewTactic rw
-- NewLemma Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
