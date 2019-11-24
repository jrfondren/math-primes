# A prime-number library for D

This module implements an infinite-primes range, and not much else.

gmp-d is efficient and fast but can't be used at compile-time.

bench/results.org has some simple benchmarks.

## usage

Add it as a dub dependency and consult the documentation. Here's a script that
prints the first 50 primes:

```d
#! /usr/bin/env dub
/+ dub.sdl:
    dependency "math-primes" version="~>0.1.0"
+/

void main() {
    import math.primes: Sieve, nthPrimeUpperBound;
    import std.stdio: writeln;
    import std.range: take;

    foreach (p; Sieve!int(nthPrimeUpperBound(50)).take(50))
        writeln(p);
}
```
