(* fun aux (i, L) =
            let
                fun line nil = []
                |  line (h1::h2::t) = [h1+h2] @ (line(h2::t))
                |  line (1::t) = [1] @ (line t)
                val newL = line L
            in
                if i = 0
                then newL
                else aux ((i-1), newL)
            end;

aux (4, [1,1]);

fun ptriangle (i, j) = 
    let
        fun aux (i, L) =
            let
                fun line nil = []
                |  line (1::t) = [1] @ (line t)
                |  line (h1::h2::t) = [h1+h2] @ (line(h2::t))
                val newL = line L
            in
                if i = 0
                then newL
                else aux ((i-1), newL)
            end

        fun index (j, (h::t)) = 
            if j = 0
            then h
            else index((j-1), t)
    in 
        index(j, aux(i, [1]))
    end;
 *)

        
fun f n = fn(x) => x + n;
val x = f 10;
val y = x 2;