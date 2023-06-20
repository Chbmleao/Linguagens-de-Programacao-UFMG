% ---------------------- 1 ----------------------  
max(X, Y, X) :- X > Y.
max(X, Y, Y) :- X =< Y.

% ---------------------- 2 ---------------------- 
maxList([H], H).
maxList([H|T], H) :-
    maxList(T, M),
    H > M.
maxList([H|T], M) :-
    maxList(T, M),
    H =< M.

% ---------------------- 3 ---------------------- 
ordered([]).
ordered([_]).
ordered([H1, H2|T]) :-
    H1 =< H2,
    ordered([H2|T]), !.

% ---------------------- 4 ---------------------- 
myMerge([], L, L).
myMerge(L, [], L).
myMerge([H1|T1], [H2|T2], [H1|R]) :-
    H1 =< H2,
    myMerge(T1, [H2|T2], R).
myMerge([H1|T1], [H2|T2], [H2|R]) :-
    H1 > H2,
    myMerge([H1|T1], T2, R).

split([], [], []).
split([H], [H], []).
split([H1, H2|T], [H1|Left], [H2|Right]) :-
    split(T, Left, Right).

mergesort([], []) :- !.
mergesort([X], [X]).
mergesort(In, Out) :-
    split(In, Left, Right),
	mergesort(Left, SortLeft),
	mergesort(Right, SortRight),
	myMerge(SortLeft, SortRight, Out), !.
    
% ---------------------- 5 ---------------------- 
nocheck(_, []).
nocheck(X/Y, [X1/Y1 | Rest]) :-
  	X =\= X1,
  	Y =\= Y1,
  	abs(Y1-Y) =\= abs(X1-X),
  	nocheck(X/Y, Rest).

legal([]).
legal([X/Y | Rest]) :-
  	legal(Rest),
  	member(X,[1,2,3,4,5,6,7,8]),
  	member(Y,[1,2,3,4,5,6,7,8]),
  	nocheck(X/Y, Rest).

eightqueens(X) :-
  	X = [1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_],
  	legal(X).

structure([], 0).
structure([_/_|S], N) :-
    NextN is N-1,
	structure(S, NextN).
    
nqueens(X, N) :-
   	structure(X, N),
    legal(X).

% ---------------------- 6 ---------------------- 
calories([],0).
calories([food(_,_,C) | Rest], X) :-
  	calories(Rest,RestC),
  	X is C + RestC.

subseq([], _, _, Acc, Acc).
subseq([food(X,W,Y) | RestX], Capacity, TotalWeight, Acc, S) :-
    NextWeight is TotalWeight + W,
    NextWeight =< Capacity,
    subseq([food(X,W,Y) | RestX], Capacity, NextWeight, [food(X,W,Y) | Acc], S).
subseq([_ | RestX], Capacity, TotalWeight, Acc, S) :-
    subseq(RestX, Capacity, TotalWeight, Acc, S).

legalKnapsack(Pantry,Capacity,Knapsack):-
  	subseq(Pantry,Capacity,0,[],Knapsack).

maxC([],Sofar,_,Sofar).
maxC([First | Rest],_,MC,Result) :-
  	calories(First,FirstC),
  	MC =< FirstC,
  	maxC(Rest,First,FirstC,Result).
maxC([First | Rest],Sofar,MC,Result) :-
	calories(First,FirstC),
	MC > FirstC,
	maxC(Rest,Sofar,MC,Result).
maxCalories([First | Rest],Result) :-
	calories(First,FirstC),
	maxC(Rest,First,FirstC,Result).

knapsackOptimization(Pantry,Capacity,Knapsack) :-
	findall(K,legalKnapsack(Pantry,Capacity,K),L),
	maxCalories(L,Knapsack).


% ---------------------- 7 ---------------------- 
subseq([],[]).
subseq([Item | RestX], [Item | RestY]) :-
  subseq(RestX,RestY).
subseq(X, [_ | RestY]) :-
  subseq(X,RestY).

mySelect(Element, L, NewL) :-
    mySelect(Element, L, [], NewL).
mySelect(_, [], Acc, Acc).
mySelect(Element, [H|T], Acc, NewL) :-
    Element = H,
    mySelect(Element, T, Acc, NewL).
mySelect(Element, [H|T], Acc, NewL) :-
    Element \= H,
    mySelect(Element, T, [H|Acc], NewL).
    
removeElements(L, [], L).
removeElements(L, [H|T], R) :-
    mySelect(H, L, NewL),
    removeElements(NewL, T, R).

legalCover([], _).
legalCover(Set, [H|T]) :-
    removeElements(Set, H, NewSet),
    legalCover(NewSet, T).

size(L, S) :-
    size(L, 0, S).
size([], Acc, Acc).
size([_|T], Acc, S) :-
    NextAcc is Acc + 1,
    size(T, NextAcc, S).

coverDecision(Set, Subsets, Goal, Cover) :-
	subseq(Cover, Subsets),
    size(Cover, S),
    S =< Goal,
    legalCover(Set, Cover).

minCoverSize(Set, Subsets, Acc, Acc) :-
    coverDecision(Set, Subsets, Acc, _).
minCoverSize(Set, Subsets, Acc, Size) :-
    NextAcc is Acc+1,
    minCoverSize(Set, Subsets, NextAcc, Size), !.

coverOptimization(Set, Subsets, Cover) :-
    minCoverSize(Set, Subsets, 1, Size),
    coverDecision(Set, Subsets, Size, Cover).


% ---------------------- 8 ---------------------- 

sublist(_, []).
sublist([H|T], [H|SubT]) :-
    sublist(T, SubT).
sublist([_|T], SubT) :-
    sublist(T, SubT).

vertices(G, V) :-
    vertices(G, [], V).
vertices([], Acc, Acc).
vertices([edge(X, Y)|T], Acc, Vertices) :-
    member(X, Acc),
    member(Y, Acc),
    vertices(T, Acc, Vertices).
vertices([edge(X, Y)|T], Acc, Vertices) :-
    member(X, Acc),
    vertices(T, [Y|Acc], Vertices).
vertices([edge(X, Y)|T], Acc, Vertices) :-
    member(Y, Acc),
    vertices(T, [X|Acc], Vertices).
vertices([edge(X, Y)|T], Acc, Vertices) :-
    vertices(T, [X,Y|Acc], Vertices), !.

legalVertice(_, _, []).
legalVertice(G, V, [H|T]) :-
    (member(edge(V, H), G); member(edge(H, V), G)),
    legalVertice(G, V, T).

legalClique(_, []).
legalClique(G, [H|T]) :-
    legalVertice(G, H, T),
    legalClique(G, T).

clique(G) :-
    vertices(G, V),
    legalClique(G, V).
    
cliqueN(N, G, L) :- sublist(G, L), length(L, N), clique(L).
