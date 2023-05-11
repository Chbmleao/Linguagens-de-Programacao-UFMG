fun middle L = 
    let
        fun size nil = 0
         |  size (h::t) = 1 + (size t)

        fun find (0, (h::t)) = h
         |  find (x, (h::t)) = find ((x-1), t)

        val mid = (size L) div 2; 
    in
        find (mid, L)
    end;

middle ["a", "e", "i", "o", "u"];
middle [1, 2, 3, 4];
middle [1, 2, 3, 4, 5];
middle [1.0, 2.76, 3.14];