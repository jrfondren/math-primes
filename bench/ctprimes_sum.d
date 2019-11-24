#! /usr/bin/env dub
/+ dub.sdl:
    dependency "ctprimes" version="~>1.0.1"
+/

void main() {
    import ctprimes: ctPrimesLessThan;
    import std.stdio: writeln;
    import std.algorithm: sum;

    enum answer = ctPrimesLessThan!(20_000).sum;
    writeln(answer);
}
