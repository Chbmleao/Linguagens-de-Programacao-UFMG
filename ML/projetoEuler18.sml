fun maxSum2Vectors (nil, nil) = nil
 |  maxSum2Vectors (nil, L) = []
 |  maxSum2Vectors (L, nil) = []
 |  maxSum2Vectors ((h1::t1), (h2::t2)) =
    let
        val sum1 = h1 + h2
        val sum2 = h1 + hd t2
    in 
        if sum1 > sum2
        then [sum1] @ maxSum2Vectors (t1, t2)
        else [sum2] @ maxSum2Vectors (t1, t2)
    end;

fun greaterPercurse nil = []
 |  greaterPercurse [L1, L2] = maxSum2Vectors(L1, L2)  
 |  greaterPercurse LL =
    maxSum2Vectors(hd LL, greaterPercurse(tl LL));

fun greaterPercurseEulerProject _ =
    let
        val LL = [
            [75],   
            [95, 64],
            [17, 47, 82],
            [18, 35, 87, 10],
            [20, 04, 82, 47, 65],
            [19, 01, 23, 75, 03, 34],
            [88, 02, 77, 73, 07, 63, 67],
            [99, 65, 04, 28, 06, 16, 70, 92],
            [41, 41, 26, 56, 83, 40, 80, 70, 33],
            [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
            [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
            [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
            [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
            [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
            [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]
        ]
    in
        hd (greaterPercurse LL)
    end;










