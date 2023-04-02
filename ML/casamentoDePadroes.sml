fun member (e, nil) = false
 |  member (e, L) =
    if ((hd L) = e)
    then true
    else member(e, tl L);

fun less (e, nil) = nil
 |  less (e, L) =
    if ((hd L) < e)
    then [hd L] @ less(e, tl L)
    else less(e, tl L);

fun repeats nil = false
 |  repeats [e] = false
 |  repeats L =
    if ((hd L) = (hd (tl L)))
    then true
    else repeats(tl L);

fun evalAux (nil, x, p) = 0.0
 |  evalAux (L, x, p) = ((hd L) * p) + evalAux(tl L, x, p*x);

fun eval (L, x) = evalAux(L, x, 1.0);

fun partition (pivot, nil) = (nil, nil)
 |  partition (pivot, h::t) =
    let
        val (smalls, bigs) = partition (pivot, t)
    in
        if h < pivot 
        then (h::smalls, bigs)
        else (smalls, h::bigs)
    end;

fun qsort nil = nil
 |  qsort (pivot::t) =
    let 
        val (smalls, bigs) = partition (pivot, t)
    in
        qsort smalls @ [pivot] @ qsort bigs
    end;

fun icmp (a, b) = a < b;

fun ircmp (a, b) = a > b;

fun newPartition (pivot, nil, comparator) = (nil, nil)
 |  newPartition (pivot, h::t, comparator) =
    let
        val (smalls, bigs) = newPartition (pivot, t, comparator)
    in
        if comparator(h, pivot)
        then (h::smalls, bigs)
        else (smalls, h::bigs)
    end;

fun quicksort (nil, comparator) = nil
 |  quicksort (pivot::t, comparator) = 
    let 
        val (smalls, bigs) = newPartition (pivot, t, comparator)
    in
        quicksort(smalls, comparator) @ [pivot] @ quicksort(bigs, comparator) 
    end;
    
fun isIn (nil, e) = false
 |  isIn (L, e) =
    if ((hd L) = e)
    then true
    else isIn(tl L, e);

fun union (nil, nil) = nil
 |  union (nil, L) = L
 |  union (L, nil) = L
 |  union (L1, L2) = 
    let
        val set = union(tl L1, tl L2)
        val l1IsInSet = isIn (set, hd L1)
        val l2IsInSet = isIn (set, hd L2)
    in
        if hd L1 = hd L2 andalso not l1IsInSet
        then [hd L1] @ set
        else
            if not l1IsInSet andalso not l2IsInSet
            then [hd L1, hd L2] @ set
            else
                if not l1IsInSet
                then [hd L1] @ set
                else 
                    if not l2IsInSet
                    then [hd L2] @ set
                    else set
    end;

fun subconj (x, nil) = []
 |  subconj (x, LL) = union([union(x, hd LL)], subconj(x, tl LL)); 

fun powerset nil = [nil]
 |  powerset [e] = [[e], nil]
 |  powerset (h::t) =
    let val aux = powerset(t)
    in union(subconj([h], aux), aux)
    end;

