verify(N1, N2, Num, 1) :-
    X1 is N1 mod Num,
    X2 is N2 mod Num,
    X1 = 0,
    X2 = 0.
verify(_, _, _, 0).


gcd(N1, N2, G):-
    gcd(N1, N2, 1, 1, G).
gcd(N1, N2, Num, Acc, Acc) :-
    Aux1 is N1 div 2,
	Aux2 is N2 div 2,
    (Num > Aux1; Num > Aux2).
gcd(N1, N2, Num, Acc, Q) :-
    (Num =< N1; Num =< N2),
    verify(N1, N2, Num, Result),
    NextNum is Num+1,
    (Result = 1 -> gcd(N1, N2, NextNum, Num, Q); 
    gcd(N1, N2, NextNum, Acc, Q)), !.