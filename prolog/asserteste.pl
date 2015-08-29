:- dynamic pessoa/1.
pessoa(eu).
pessoa(tu).
pessoa(ele).

objeto(casa).
objeto(livro).
objeto(carro).

:- dynamic possui/2.
possui(eu,100).
possui(tu,80).
possui(ele,60).

:- dynamic preco/2.
preco(casa,100).
preco(livro,5).
preco(carro,60).

compra(X,Y):- pessoa(X),objeto(Y),possui(X,Money), preco(Y,Custo), Money>=Custo,Sobra is Money-Custo,retira(X,Sobra).

retira(P,C) :- retract(possui(P,_)),assert(possui(P,C)).

