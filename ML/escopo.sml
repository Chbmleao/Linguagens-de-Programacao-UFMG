fun myMap f nil = nil
 |  myMap f (h::t) = f h :: myMap f t;
myMap (fn x => x+1) [1, 2, 3, 4];

fun myFoldr f acc nil = acc
 |  myFoldr f acc (h::t) = f (h, (myFoldr f acc t));
myFoldr(fn(e, list) => list @ [e] @ [e]) [] [1, 2, 3, 4];
foldr(fn(e, list) => list @ [e] @ [e]) [] [1, 2, 3, 4];

fun myFoldl f acc nil = acc
 |  myFoldl f acc (h::t) = myFoldl f (f (h, acc)) t;
myFoldl(fn(e, list) => list @ [e] @ [e]) [] [1, 2, 3, 4];
foldl(fn(e, list) => list @ [e] @ [e]) [] [1, 2, 3, 4];
