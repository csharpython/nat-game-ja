import Game.Metadata

World "Tutorial"
Level 2

Title "Eq."

Introduction "同じことを表すものってよくありますよね。
例えば、「力」と「パワー」や、「1の次の数」と「2」などがあります。
Lean4で同じことを表すものを置き換えるときは\"rewrite\"を使います。
こうすることで、「力」と「パワー」が「力」と「力」になるので、rflが使えます！
"

Statement (e mc:Nat)(h : e = mc ^ 2) : e = mc ^ 2 := by
  Hint "rewrite[h]"
  rewrite[h]
  rfl

Conclusion "いいですね！Lean4では、仮定として用意した等式だけでなく、
すでに分かったこと、「定理」(もしくは「補題」)を番う方法もあります！
詳細は次のステージで！
ちなみに、`rewrite`より強いTactic`rw`がありますが、
それを使わなかった理由はもちろん、ゲーム性を上げるためです。"
--rewriteを使えるようにするとrwも使えるようになるそうです。現在修正中
/- Use these commands to add items to the game's inventory. -/

NewTactic rewrite
-- NewLemma Nat.add_comm Nat.add_assoc
-- NewDefinition Nat Add Eq
