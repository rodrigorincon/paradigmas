progenitor(ana,rodrigo).
progenitor(ana,lili).
progenitor(silvia,erica).
progenitor(silvia,larissa).
progenitor(silvia,natalia).
progenitor(julia,ana).
progenitor(julia,silvia).
progenitor(julia,julinha).
progenitor(julia,paulo).
progenitor(edivaldo,ana).
progenitor(edivaldo,silvia).
progenitor(edivaldo,julinha).
progenitor(edivaldo,paulo).
progenitor(josias,rodrigo).
progenitor(josias,lili).
progenitor(josias,ricardo).
progenitor(jurandir,erica).
progenitor(jurandir,larissa).
homem(jurandir).
homem(ricardo).
homem(edivaldo).
homem(paulo).
homem(rodrigo).
homem(josias).
mulher(julia).
mulher(julinha).
mulher(silvia).
mulher(ana).
mulher(lili).
mulher(erica).
mulher(larissa).
mulher(natalia).

pai(X,Y) :- homem(X), progenitor(X,Y).
mae(X,Y) :- mulher(X), progenitor(X,Y).
filho(X,Y) :- progenitor(Y,X).
casal(X,Y) :- progenitor(X,Z) , progenitor(Y,Z).
avo(X,Y) :- pai(X,Z) , progenitor(Z,Y).
avoh(X,Y) :- mae(X,Z) , progenitor(Z,Y).
neto(X,Y) :- filho(X,Z) , filho(Z,Y).

irmao(X,Y) :- setof(X,irmao_aux(X,Y),L).
irma(X,Y) :- setof(X,irma_aux(X,Y),L).

tio(X,Y) :- homem(X), progenitor(Z,Y),irmao(X,Z).
tia(X,Y) :- mulher(X), progenitor(Z,Y),irma(X,Z).
primo(X,Y) :- homem(X), progenitor(Z,Y), (tio(Z,X); tia(Z,X) ).
prima(X,Y) :- mulher(X), progenitor(Z,Y), (tio(Z,X); tia(Z,X) ).

%-----------------funcoes auxiliares---------------
irmao_aux(X,Y) :- homem(X), progenitor(Z,X), progenitor(Z,Y), X \== Y.
irma_aux(X,Y) :- mulher(X), progenitor(Z,X), progenitor(Z,Y), X \== Y.
