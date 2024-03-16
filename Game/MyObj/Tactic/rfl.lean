import Lean.Meta.Tactic.Refl
import Lean.Elab.Tactic.Basic

/-! # `rfl` tactic

Added `withReducible` to prevent `rfl` proving stuff like `n + 0 = n`.
-/

open Lean Meta Elab Tactic

/--
Close given goal using `Iff.refl`.
-/
def Lean.MVarId.iffRefl (mvarId : MVarId) : MetaM Unit := do
  mvarId.withContext do
    mvarId.checkNotAssigned `iffRefl
    let targetType ← mvarId.getType'
    let some (lhs, rhs) := Expr.app2? targetType ``Iff
      | throwTacticEx `iffRefl mvarId m!"iff expected"
    unless ← isDefEq lhs rhs do
      throwTacticEx `iffRefl mvarId
        m!"{indentD lhs}\nは右辺 {indentD rhs} と一致しないようです..."
    mvarId.assign (.app (mkConst ``Iff.refl) lhs)

namespace MyGame

/-- `rfl`の置き換え用のコード。
実は
https://github.com/leanprover-community/NNG4/blob/main/Game/Tactic/Rfl.lean
のコピペです。 -/

syntax (name := rfl) "rfl" : tactic

@[tactic MyGame.rfl] def evalRfl : Tactic := fun _ =>
  liftMetaTactic fun mvarId => withReducible do
    let targetType ← mvarId.getType'
    match targetType.getAppFn with
      | .const ``Eq .. => mvarId.refl
      | .const ``Iff .. => mvarId.iffRefl
      | _ => throwTacticEx `rfl mvarId "rflが使える式の形ではありません"
    pure []

--example : false↔true := by
--  rfl
--  sorry

end MyGame
