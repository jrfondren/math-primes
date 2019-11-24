#! /usr/bin/env dub
/+ dub.sdl:
    dependency "math-primes" version="~>0.1.0"
+/

void main() {
    import math.primes: Sieve;
    import std.stdio: writeln;
    import std.algorithm: sum;

    enum answer = Sieve!ulong(2_000_000).fixed.sum;
    writeln(answer);
}
