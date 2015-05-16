somar :: Int -> Int -> Int
somar x y = x+y

--o haskel não permite sobrecarga, ñ pode ter 2 funções com mesmo nome mesmo que mude os parametros
--somar :: Char -> Char -> [Char]
--somar x y = x:[y]

estahDentroDaTaxaDeVariacao :: [Int] -> Int -> Int -> Bool
estahDentroDaTaxaDeVariacao [] media valor = True
estahDentroDaTaxaDeVariacao (valor_i:valores) media taxa = valor_i >= media-taxa && valor_i <= media+taxa && estahDentroDaTaxaDeVariacao (valores media taxa)
