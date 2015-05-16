[1,2,3]++[4,5,6]
--retorna [1,2,3,4,5,6]
--o ++ é um concatenador de listas e strings, ele ñ faz +1 e colocar ele numa var da erro
"bom"++" "+"dia"
--retorna "bom dia"

--pra add no inicio usa o operador :
'a':" gasolina acabou"
5:[1,2,3,4]--retorna[5,1,2,3,4]

--porem o ++ percorre TODA a lista da esquerda pra add no final, usar o : é uma boa saída por  ser INSTANTANEO
--POREM, o operador : só aceita valores únicos (char ou 1 inteiro a sua esquerda), ou seja [1,2,3]:[4,5,6] da errado
1:2:3:4:5:[]--retorna [1,2,3,4,5]