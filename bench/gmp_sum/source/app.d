#! /usr/bin/env dub
/+ dub.sdl:
    dependency "gmp-d" version="~>0.1.5"
+/

ulong sumOfPrimesLessThan(int target) {
    import gmp.z: MpZ, nextPrime;

    auto sum = 0.MpZ;
    auto i = 2.MpZ;

    while (i < target) {
        sum += i;
        i = i.nextPrime;
    }

    assert(sum.fitsIn!ulong);
    return cast(ulong) sum;
}

void main() {
    import std.stdio: writeln;

    // can't be calculated compile time
    immutable auto answer = sumOfPrimesLessThan(20_000);
    writeln(answer);
}
