import Mathlib.Tactic.Use

/-!
Defines the `use` tactic.

## Implementation notes

This simply calls `use` from Mathlib with no discharger.
-/

open Lean Elab Tactic Mathlib.Tactic

/-- `∃ (n : ℕ), P n`のようなゴールに対し、`P n`を満たす`x`があるなら、
`use x`を使うことでゴールが`P x`になります。
-/
-- @[inherit_doc Mathlib.Tactic.useSyntax]
elab (name := MyGame.useSyntax) "use" ppSpace args:term,+ : tactic => do
  -- use Mathlib's `use` without any discharger
  let discharger := evalTactic (← `(tactic|skip))
  runUse false discharger args.getElems.toList
