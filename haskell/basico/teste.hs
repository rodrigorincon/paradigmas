main = print (fac 4)
fac 0 = 1
fac n = n * fac (n-1)

fib 2 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

--o parametro "_" indica qualquer valor (tipo o *)
estahNaLista [] _ = False
estahNaLista (h:t) n | n == h = True
					 | otherwise = estahNaLista t n