fun il2rl L = map(fn e => Real.fromInt(e)) L;
il2rl [1, 2, 3, 4];

fun ordList L = map(fn e => Char.ord(e)) L;
ordList [#"A", #"b", #"C"];

fun squareList L = map(fn e => e * e) L;
squareList [1, 2, 3, 4];

fun multPairs L = map(fn (x, y) => x * y) L;
multPairs [(1, 2), (3, 4)];

fun incList L = fn i => map(fn e => e + i) L;
incList [1, 2, 3, 4] 10;  

fun sqSum L = foldr(fn (x, y) => (x * x) + y) 0 L;
sqSum [1, 2, 3, 4];

fun bor L = foldr(fn(x, y) => x orelse y) false L;
bor [false, false, false, true];

fun band L = foldr(fn(x, y) => x andalso y) true L;
band [false, true];

fun bxor L = foldr(fn(x, y) => if (x andalso y) orelse (not x andalso not y) then false else true) false L;
bxor [false, true, true, true];

fun dupList L = foldl(fn(e, list) => list @ [e] @ [e]) [] L;
dupList [1, 2 ,3];

fun myLength L = foldl(fn(e, counter) => counter + 1) 0 L;
myLength [1, 2, 3, 4, 5];

fun is2absrl L = map(fn e => Real.fromInt(if e > 0 then e else ~e)) L;
is2absrl [1, 2, 3, ~4, 5];

fun trueCount L = foldl(fn(e, counter) => if e then counter + 1 else counter) 0 L;
trueCount [true, false, true, false];

fun maxPairs L = map(fn (x, y) => if x > y then x else y) L;
maxPairs [(1, 3), (4, 2), ( 3, 4)];

fun myImplode L = foldl(fn(c, str) => str ^ Char.toString(c)) "" L;
myImplode [#"a", #"b", #"c", #"d"];

fun lconcat LL = foldl(fn(subList, finalList) => finalList @ subList) [] LL;
lconcat [[1, 2], [3, 4, 5, 6], [7]];

fun max L = foldl(fn(e, max) => if e > max then e else max) 0 L;
max [1, 2, 5, 4];

fun min L = foldl(fn(e, min) => if e < min then e else min) (hd L) L;
min [1, 2, 5, 4];

fun member (e, L) = foldl(fn(item, isMember) => (item = e) orelse isMember) false L;
member (4, [1, 2, 3, 4, 5]);

fun append L1 = fn L2 => foldr(fn(e, L3) => e::L3) L2 L1;
append [1, 2, 3] [4, 5, 6];

fun less e L = List.filter (fn (item) => item < e) L;
less 4 [1, 2, 3, 4, 5, 6, 7];

fun evens L = List.filter (fn (e) => if e mod 2 = 0 then true else false) L;
evens [1, 2, 3, 4];

fun convert L = foldr(fn((x, y), (L1, L2)) => (x::L1, y::L2)) ([], []) L;
convert [(1, 2), (3, 4), (5, 6)];

fun myMap f = fn L => foldr(fn (e, newList) => f(e)::newList) [] L;
myMap (fn e => e * e) ([1, 2, 3]);

fun eval L = fn x => #2 (foldl(fn (e, (p, result)) => (x * p, e * p + result)) (1.0, 0.0) L);
eval [1.0, 5.0, 3.0] 2.0;