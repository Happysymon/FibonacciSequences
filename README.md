# My first Lean program: Fibonacci

This is my **hello world program for the Lean programming language**. It
defines the Fibonacci sequence and asks Lean to check proofs about it. It uses
Lean's included standard library, with no third-party libraries or Mathlib.

The sequence starts with `0` and `1`. Every later term is the sum of the two
terms before it:

```text
0, 1, 1, 2, 3, 5, 8, 13, ...
```

In [Fibonacci.lean](Fibonacci.lean), `fibonacciSpec` is the direct recursive
specification, with its recurrence proved by `fibonacciSpec_recurrence`.
`fibonacci` uses fast doubling to compute one term in logarithmically many
steps, and `fibonacci_six` proves its result for index `6`. The `#eval` command
calculates the fast version at index `100`.

The fast version is for calculating one term. A GPU is useful when many
independent calculations can run at once; this small, dependency-free Lean
example does not include a GPU backend.

To check the file with the Lean 4 compiler installed, run:

```sh
lean Fibonacci.lean
```

This requires Lean 4's compiler. QuantConnect's `lean` command-line tool has
the same command name but does not compile Lean language files.
