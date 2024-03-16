import Game.Metadata

World "Tutorial"
Level 1

Title "はじめの一歩"

/--
## 説明
`X=X`といった形のゴールを閉じます。
これは、**定義として**等しい場合のみ有効です。
ただ、このゲームでは関数の値は「公理」として実装されていることが多いので、
基本的には左辺と右辺が**完全に**一致する場合のみ有効だと思います。
(ちなみに、公理は数学の前提的なもの)
## 補足情報
このゲームのrflはオリジナルのrflに比べて弱体化されています。
そうした理由はゲーム性を上げるためです。
-/
TacticDoc rfl

Introduction "「反射律」って知ってますか？
「反射律」とは、ある関係Rについて、xRxが成り立つことを表します。
たとえば、＝などがそうですね。
今回のような場合なら、\"rfl\"を使えます！"

Statement (x y:Nat) : 33 * x + 24 * y = 33 * x + 24 * y := by
  Hint "左辺と右辺が同じ時は、rflを使うとゴールを閉じれます。"
  rfl

Conclusion "「33 * x + 24 * y = 33 * x + 24 * yである。だから33 * x + 24 * y = 33 * x + 24 * y なのだ。」
では済まない命題も結構あるのですが...まあそれの示し方は次のステージで話しましょう。
ちなみに、このゲームのrflはオリジナルのrflに比べて弱体化されています。
そうした理由はゲーム性を上げるためです。"

/- Use these commands to add items to the game's inventory. -/

NewTactic rfl
-- NewLemma Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
