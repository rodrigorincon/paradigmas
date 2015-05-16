incrementaMaior5DecrementaMenor x 
	|x < 5 = x+1
	|otherwise = x-1

comparaMultiplicacao x y
	|mult < 100 = "baixo"
	|mult >= 100 && mult < 200 = "medio"
	|otherwise = "alto"
	where mult = x*y