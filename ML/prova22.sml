fun index _ nil = nil
 |  index x (h::t) = [(x, h)] @ (index (x+1) t);
index 2 ["a", "b", "c"];

fun count nil = nil
 |  count L = index 0 L;
count ["a", "b", "c"];

fun find_aux comp nil = ~1
 |  find_aux comp ((x, y)::t) =
    if comp y
    then x
    else find_aux comp t;
find_aux (fn x => x mod 2 <> 0) [(0,2),(1,3),(2,5)];
find_aux (fn x => x > 4) [(0,2),(1,3),(2,5)];
find_aux (fn x => x > 6) [(0,2),(1,3),(2,5)];

fun find comp L = find_aux comp (count L); 
find (fn x => size(x) > 2) ["Eu", "amo", "voce"];
find (fn x => x mod 2 = 0) [1, 3, 4, 5];

fun find_aux _ nil = ~1
  | find_aux (test: ('a -> bool)) ((h::t): (int * 'a) list) = if(test(#2 h)) then (#1 h) else (find_aux test t);
