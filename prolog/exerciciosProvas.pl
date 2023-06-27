edge(start, a).
edge(start, d).
edge(a, b).
edge(b, c).
edge(a, c).
edge(b, d).
edge(b, e).
edge(d, e).
edge(e, a).
edge(c, end).
edge(e, end).

path([]).
path([_]).
path([H1, H2|T]) :-
	edge(H1, H2),
    path([H2|T]).

last([E], E).
last([_|T], E) :-
    last(T, E).

cycle([H|T]) :-
    path([H|T]),
    last([H|T], E),
    edge(E, H).

solution([H|T]) :-
    H = start,
    path([H|T]),
    last([H|T], E),
    E = end.


% ------------------ Prova 21 ----------------
car(fiat, azul, joao).
car(fiat, verde, maria).
car(gol, prata, jose).
car(onyx, preto, joao).
car(up, preto, antonio).
car(onyx, prata, maria).
car(onyx, azul, telma).

pessoa(joao, professor, casado).
pessoa(maria, dentista, casado).
pessoa(jose, fazendeiro, solteiro).
pessoa(antonio, professor, casado).
pessoa(telma, policial, solteiro).
pessoa(lidia, fiscal, solteiro).

modelo(fiat, azul).
modelo(fiat, verde).
modelo(fiat, prata).
modelo(gol, preto).
modelo(gol, prata).
modelo(onyx, preto).
modelo(onyx, prata).
modelo(onyx, azul).
modelo(up, preto).
modelo(up, vermelho).

possui_azul(Pessoa) :- 
    car(_, azul, Pessoa).



todas_cores(Pessoa, Cores) :- 
    findall(Cor, car(_, Cor, Pessoa), Cores).

nao_tem_carro(Pessoa) :-
    pessoa(Pessoa, _, _),
    not(car(_, _, Pessoa)).

solteiro_com_carro(Pessoa) :-
    pessoa(Pessoa, _, solteiro),
    car(_,_,Pessoa).
    
% ------------------ Prova 20 ----------------
aplast(L, E, LL) :-
    