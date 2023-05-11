datatype returnValues = Real of real | None;

fun division (n, d) = 
    if d > 0.0 orelse d < 0.0
    then Real (n / d)
    else None;


division(10.0, 2.0);
division(10.0, 0.0);