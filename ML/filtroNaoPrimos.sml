fun sum nil = 0
 |  sum (h::t) = h + sum(t);

fun range 0 = []
 |  range 1 = []
 |  range 2 = [2]
 |  range x = [x] @ range (x-1);

fun inv (nil, nil) = nil
 |  inv (nil, L) = L
 |  inv ((h::t), nil) = inv(t, nil) @ [h]
 |  inv (L1, L2) = inv(L1, nil) @ L2;

fun f (g, x) = g (g x);

fun filterNonPrimes _ nil = 0
 |  filterNonPrimes limit (h::t) =
    if h * h <= limit
    then h + filterNonPrimes limit (filter (fn e => (e mod h) <> 0) t)
    else h + sum t

fun sieve n = filterNonPrimes n (inv (range n) nil)