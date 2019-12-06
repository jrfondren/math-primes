# CHANGELOG

## [0.1.0] - 2019-11-24
Initial release. Intended only for several "counting primes" benchmarks.

## [0.1.1] - 2019-12-06
Finally used for *any other purpose* and found to be unfit.

Sieve.sift had this calculation to find a point to start sifting from:

    size_t j = from - from % i + i;

This was intended to prevent Sieve from redundantly finding composites in
already-sifted regions. For example, if from=10 and i=3, then j=12, and
multiples of 3 will be marked composite from 12 on. This calculation fails
however when i >= from. For example, if from=2 and i=3, then j=3, thus 3 will
be marked composite.

Thus, the falling test, added in this version, would fail:

     auto ps = Sieve!int();
     assert(ps.front == 2);
     ps.popFront();
     assert(ps.front == 3); // ps.front is actually 2503 !

This line of Sieve.sift was changed to

    size_t j = i >= from ? i + i : from - from % i + i;

Incidentally this bug wasn't observed before as the "counting primes"
benchmarks created Sieves with very large initial arrays and then never needed
to expand them. For efficiency, these presized arrays used a constructor that
duplicated Sieve.sift -- without the "start sifting from" calculation.
