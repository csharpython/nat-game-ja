import Mathlib.Lean.Expr.Basic
import Lean.Elab.Tactic.Basic
import Lean.Elab.Tactic.Rewrite

/-!
# Modified `rw`

Modify `rw` to work like `rewrite`.

This is mainly a copy of the implementation of `rewrite` in Lean core.
-/

namespace MyGame

open Lean.Meta Lean.Elab.Tactic Lean.Parser.Tactic

/--
等号を用いて、ゴールを書き換えます。
-/
syntax (name := rewriteSeq) "rw" (config)? rwRuleSeq (location)? : tactic

@[tactic MyGame.rewriteSeq] def evalRewriteSeq : Tactic := fun stx => do
  let cfg ← elabRewriteConfig stx[1]
  let loc   := expandOptLocation stx[3]
  withRWRulesSeq stx[0] stx[2] fun symm term => do
    withLocation loc
      (rewriteLocalDecl term symm · cfg)
      (rewriteTarget term symm cfg)
      (throwTacticEx `rewrite · "置き換えられる場所がありません...")
