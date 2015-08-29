oi:-read(X),write('Resposta: '),write(X).

idade:-write('Digite sua idade: '),read(X),verificaIdade(X).
verificaIdade(X):-write('verificando se eh menor de 18... '),nl,X<18,write('eh menor de idade').
verificaIdade(X):-write('verificando se eh maior de 18... '),nl,X>=18,write('eh maior de idade').

cubo:-write('Proximo item, por favor: '),read(X),calculocubo(X).
calculocubo(stop):- !. %se receber o texto STOP para a execução
calculocubo(N):-C is (N * N * N),
write('Cubo de '),write(N),write(' eh '),write(C),nl,cubo. %calcula e mostra na tela o valor
%nl (new line) pula a linha e cubo chama recursivamente a função
