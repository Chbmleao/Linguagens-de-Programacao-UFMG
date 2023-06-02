sumList([], 0).
sumList([H | T], S) :- 
    sumList(T, R), 
    S is H+R.

distance(L, N, D) :- 
    sumList(L, S), 
    D is abs(S-N). 

comb(0, _, []).
comb(M, [_ | T], C) :- 
    comb(M, T, C).
comb(M0, [H | T], [H | C1]) :- 
    M1 is M0-1, 
    comb(M1, T, C1).

allCombs(L, M, ListResults) :- 
    findall(C, comb(M, L, C), ListResults).

findClosest([X], _, X).
findClosest([H | T], N, X) :- 
    findClosest(T, N, XT), 
    distance(H, N, D0), 
    distance(XT, N, D1), 
    (D0 < D1 -> X=H; X=XT).

cumulo(L, M, N, Result, Distance) :-
  allCombs(L, M, ListCombinations),
  findClosest(ListCombinations, N, Result),
  distance(Result, N, Distance).