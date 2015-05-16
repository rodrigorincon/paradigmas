[1,2,3,4,5,6,7,8]!!0 -- retorna 1

[1,2,3,4,5,6,7,8]!!5 -- retorna 6

--o operador !! é o acesso via indice

--retorna o 1º elemento
head [1,2,3]

--retorna o ultimo elemento
last [1,2,3]

--retorna todos menos o primeiro valor
tail [1,2,3]

--retorna todos menos o ultimo valor
init [1,2,3]

--pesquisa se um elemento está na lista
4 `elem` [1,2,3,4,5]
--são crases

--retorna a soma dos elementos
sum [1,2,3,4,5]--não funciona com char

--retorna a multiplicação dos elementos
product [1,2,3,4,5]--não funciona com char

--retorna se a lista está vazia
null []

--inverte a lista
reverse [1,2,3]

--retorna o maior elemento
maximum [3,4,1]

--retorna o menor elemento
maximum [3,0,1]

--retorna uma lista com os n primeiros numeros
take 2[1,2,3]
--se n=0, retorna uma lista vazia, se n > lista retorna a propria lista

--retorna a lista SEM os n primeiros
drop 2[1,2,3,4]--retorna [3,4]

