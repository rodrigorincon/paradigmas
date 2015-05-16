--a palavra reservada "data" diz q é uma estrutura de dados
data ArvBin a = Null
	| No a (ArvBin a) (ArvBin a)

--somaArvore é uma função
somaArvore Null = 0 --digo que, nessa função, Null será 0
somaArvore (No x esq dir) = x + (somaArvore esq) + (somaArvore dir)

travessiaInOrder :: ArvBin a -> [a]
travessiaInOrder Null = []
travessiaInOrder (No x esq dir) = (travessiaInOrder esq) ++ [x] ++ (travessiaInOrder dir)


travessiaPreOrder (No x esq dir) = do
									print x
									travessiaPreOrder esq
									travessiaPreOrder dir