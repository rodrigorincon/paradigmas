--map recebe uma função e uma lista e aplica a função recebida em cada valor da lista

--map (+2) [1,2,3]--retorna [3,4,5]

--map (*3) [1,2,3]--retorna [3,6,9]

elevar x = x^2

--map elevar [2,3,4] -- retorna [4,9,16]

--filter retorna uma lista apenas com os valores que satisfazem uma função
--a função precisa retornar um booleano

--filter (>3) [1,2,3,4,5]