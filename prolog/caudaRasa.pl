% Questão 1
sum([], Acc, Acc).
sum([H|T], Acc, S) :-
    X is Acc + H,
    sum(T, X, S).

rev([], Acc, Acc).
rev([H|T], Acc, R) :-
    rev(T, [H|Acc], R).

% Questão 2
subSum(_, 0, Acc, Acc).
subSum([H|T], N, Acc, S) :-
    X is N-H,
    subSum(T, X, [H|Acc], S).
subSum([_|T], N, Acc, S) :-
    subSum(T, N, Acc, S).

% Questão 3
riddle([], _).
riddle(_, []).

% Questão 4
enigma(List1, N, List2) :-
    append(List2, Dummy, List1),
    length(Dummy, N),
    !.

% Questão 5
factorial(0, Acc, Acc).
factorial(N, Acc, FN) :-
    NextN is N-1,
    NextAcc is Acc*N,
    factorial(NextN, NextAcc, FN),
    !.