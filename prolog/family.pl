parent(kim,holly).
parent(margaret,kim).
parent(margaret,kent).
parent(esther,margaret).
parent(herbert,margaret).
parent(herbert,jean).
parent(daniela, arthur).
parent(jose, carlos).
parent(sonia, daniela).
parent(sonia, jose).

greatgrandparent(GGP,GGC) :-
parent(GGP,GP), parent(GP,P), parent(P,GGC).

girl(X) :- X = margaret; X = holly; X = esther; X = jean.

mother(X, Y) :- parent(X, Y), girl(X).

father(X, Y) :- parent(X, Y), not(girl(X)).

sister(X, Y) :- parent(W, X), parent(W, Y), girl(X), not(X = Y).

grandson(X, Y) :- parent(Y, W), parent(W, X), not(girl(Y)).

firstCousin(X, Y) :- parent(A, B), parent(A, C), parent(B, X), parent(C, Y), not(X = Y), not(B = C).

descendant(X, Y) :- parent(X, Y).
descendant(X, Y) :- parent(X, W), descendant(W, Y).