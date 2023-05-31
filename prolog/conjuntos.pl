isMember(E, [E | _]).
isMember(E, [_ | T]) :- isMember(E, T).

isUnion([], Y, Y).
isUnion([H | T], Y, [H | Z]) :- isUnion(T, Y, Z), not(isMember(H, Z)).
isUnion([H | T], Y, Z) :- isUnion(T, Y, Z), isMember(H, Z).

isIntersection([], _, []).
isIntersection(_, [], []).
isIntersection([H | T], Y, [H | Z]) :- isIntersection(T, Y, Z), isMember(H, Y).
isIntersection([H | T], Y, Z) :- isIntersection(T, Y, Z), not(isMember(H, Y)).

delete(_, [], []).
delete(E, [E | T], L1) :- delete(E, T, L1).
delete(E, [H | T], [H | L1]) :- delete(E, T, L1), not(E=H).
isEqual([], []).
isEqual([H|T], L) :- isMember(H, L), delete(H, L, L1), isEqual(T, L1).

append([], _, []).
append([X | T], Y, [X, [Y | X] | Z]) :- append(T, Y, Z).
powerSet([], [[]]).
powerSet([H | T], Y) :- powerSet(T, A), append(A, H, Y).

isDifference([], _, []).
isDifference([H | T], Y, [H | Z]) :- isDifference(T, Y, Z), not(isMember(H, Y)).
isDifference([H | T], Y, Z) :- isDifference(T, Y, Z), isMember(H, Y).