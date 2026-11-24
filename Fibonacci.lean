import Lean

/-- A direct recursive specification of the sequence. -/
def fibonacciSpec : Nat → Nat
  | 0 => 0
  | 1 => 1
  | n + 2 => fibonacciSpec (n + 1) + fibonacciSpec n

/-- Every term from the third onward is the sum of the previous two. -/
theorem fibonacciSpec_recurrence (n : Nat) :
    fibonacciSpec (n + 2) = fibonacciSpec (n + 1) + fibonacciSpec n := by
  rfl

/-- A small concrete example, checked by Lean's kernel. -/
theorem fibonacciSpec_six : fibonacciSpec 6 = 8 := by
  rfl

/--
`fibonacciPair n` returns `(F n, F (n + 1))` using fast doubling.
The recursive call halves `n`, so a single term takes logarithmically many
recursive steps instead of recomputing the same terms exponentially often.
-/
def fibonacciPair (n : Nat) : Nat × Nat :=
  if _h : n = 0 then (0, 1) else
    let k := n / 2
    let (a, b) := fibonacciPair k
    let evenTerm := a * (2 * b - a)
    let oddTerm := a * a + b * b
    if n % 2 = 0 then (evenTerm, oddTerm) else (oddTerm, evenTerm + oddTerm)
termination_by n
decreasing_by
  have hn : 0 < n := Nat.pos_of_ne_zero _h
  exact Nat.div_lt_self hn (by decide)

/-- Fast Fibonacci calculation for one index, using fast doubling. -/
def fibonacci (n : Nat) : Nat := (fibonacciPair n).1

/-- Lean verifies that the optimized calculation gives the expected example. -/
theorem fibonacci_six : fibonacci 6 = 8 := by
  native_decide

#eval fibonacci 100
