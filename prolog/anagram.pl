findAnagram(FileName, Word, S) :-
    readFile(FileName, Word, S).

readFile(FileName, Word, S) :-
    open(FileName, read, Stream),
    atom_chars(Word, CharList),
    readLines(Stream, CharList, S),
    close(Stream).

readLines(Stream, Word, Term) :-
    \+ at_end_of_stream(Stream),
    read(Stream, Term),
    atom_chars(Term, CharList),
    isAnagram(CharList, Word, Boolean),
    Boolean=1.
readLines(Stream, Word, S) :-
    \+ at_end_of_stream(Stream),
    read(Stream, Term),
    atom_chars(Term, CharList),
    isAnagram(CharList, Word, Boolean),
    Boolean=0,
    readLines(Stream, Word, S).

size(Word, S) :- 
    size(Word, 0, S).
size([], Acc, Acc).
size([_ | T], Acc, S) :-
    NextAcc is Acc + 1,
    size(T, NextAcc, S).

isAnagram([], [], 1).
isAnagram([H|T], Y, B) :-
    size([H|T], S1),
    size(Y, S2),
    S1 = S2,
    select(H, Y, NextY),
    isAnagram(T, NextY, B), !.
isAnagram(_, _, 0).
    