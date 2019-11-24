#! /usr/bin/env dub
/+ dub.sdl:
    dependency "math-primes" version="~master"
+/

void main() {
    import math.primes: Sieve, nthPrimeUpperBound;
    import std.stdio: writeln;
    import std.range: take;

    foreach (p; Sieve!int(nthPrimeUpperBound(50)).take(50))
        writeln(p);
}
