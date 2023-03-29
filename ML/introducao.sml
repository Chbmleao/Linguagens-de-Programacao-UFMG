fun cube x = x * x;

fun cuber x:real = x * x;

fun fourth L = hd(tl(tl(tl L)));

fun min3 (x, y, z) = 
    if x < y andalso x < z 
    then x
    else
        if y < z
        then y
        else z;
                  
fun red3 (a, b, c) = (a, c);

fun thirds str = String.sub(str, 2);

fun cycle1 L = 
    let 
        val aux = hd L
    in
        List.drop(L, 1) @ [aux]
    end;

fun sort3 (a:real, b:real, c:real) = 
    let     
        val lowest = if a < b andalso a < c 
            then a
            else
                if b < c
                then b
                else c
    in
        if lowest < b andalso lowest < c
        then 
            if b < c
            then [a, b, c]
            else [a, c, b]
        else
            if lowest < c
            then
                if a < c
                then [b, a, c]
                else [b, c, a]
            else
                if a < b
                then [c, a, b]
                else [c, b, a]
    end;

fun del3 L = List.take(L, 2) @ List.drop(L, 3);

fun sqsum n = 
    if n = 0
    then 0
    else n * n + sqsum(n-1);

fun cycle (L, n) = 
    if n = 0
    then L
    else 
        let
            val L1 = cycle(L, n-1)
        in
            List.drop(L1, 1) @ [hd (L1)]
        end;

fun pow (x:real, n:int) =
    if n = 0
    then 1.0
    else x * pow(x, n-1);

fun max L =
    if null L
    then 0
    else
        let
            val aux = max(tl L)
        in
            if hd L > aux
            then hd L
            else aux
        end;

fun isPrimeAux (x, divider) =
    if divider <= 1
    then true
    else
        if x mod divider = 0
        then false
        else isPrimeAux(x, divider-1);

fun isPrime x = 
    if x <= 1
    then false
    else isPrimeAux(x, x div 2);

fun select (L, function) =
    if null L
    then L
    else
        if function(hd L)
        then select(tl L, function) @ [hd L]
        else select(tl L, function);