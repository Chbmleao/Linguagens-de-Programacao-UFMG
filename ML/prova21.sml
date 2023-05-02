fun ins(x, L) = (List.filter (fn(item) => item < x) L) @ [x] @ (List.filter (fn(item) => item > x) L);
ins(3, [1, 2, 4]);
ins(3, [1, 2, 3, 4]);
ins(0, [1, 2, 3, 4]);
ins(5, [1, 2, 3, 4]);

fun inSortR nil = nil
 |  inSortR (h::t) = ins(h, inSortR t);
inSortR [3, 4, 2, 6];
inSortR nil;

fun inSortF L = foldl (fn(e, finalList) => ins(e, finalList)) [] L;
inSortF [3, 4, 2, 6];
inSortF nil;

(* ----------------------------------- *)

datatype expr = VAR of string | LAMBDA of string * expr | APP of expr * expr;

fun diff _ nil = nil
 |  diff s (h::t) = if s = h then diff s t else h :: diff s t

fun freevar (VAR str) = [str]
 |  freevar (APP (exp1, exp2)) = (freevar exp1) @ (freevar exp2)
 |  freevar (LAMBDA (str, exp)) = diff str (freevar exp);
freevar (LAMBDA ("x", APP(VAR "x", VAR "x")));
freevar (LAMBDA ("x", APP(VAR "w", VAR "x")));