third([_, _, Y | _], Y).

firstPair([A, A | _]).

del3([A, B, _ | T], [A, B | T]).

dupList([], []).
dupList([H | T], [H, H | TT]) :- dupList(T, TT).

isDuped([]).
isDuped([H, H | T]) :- isDuped(T).

oddSize([_]).
oddSize([_, _ | T]) :- oddSize(T).

evenSize([]).
evenSize([_, _ | T]) :- evenSize(T).

prefix([], _).
prefix([H | T1], [H | T2]) :- prefix(T1, T2).