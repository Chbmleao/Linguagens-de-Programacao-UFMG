fun rev nil = nil
 |  rev (h::t) = (rev t) @ [h]; 
rev [1, 2, 3];
rev [1.0, 2.0, 3.0];

fun zip (_, nil) = nil
 |  zip (nil, _) = nil
 |  zip ((h1::t1), (h2::t2)) = [(h1, h2)] @ zip (t1, t2);
zip ([1, 2, 3], [true, false]);
zip (["oi", "mundo"], [3.14, 15.92, 65.359]);

fun palin L = foldr (fn ((x, y), acc) => acc andalso (x = y)) true (zip (L, (rev L)));
palin [1, 2, 1];
palin [true, false, false, true];
palin [true, false, false];
palin [];
palin [1];
palin [1, 2];

fun palin2 L = 
    foldr (fn(x, acc) => x andalso acc) true (map(fn(x, y) => x = y) (zip (L, (rev L))));
palin2 [1, 2, 1];
palin2 [true, false, false, true];
palin2 [true, false, false];
palin2 [];
palin2 [1];
palin2 [1, 2];