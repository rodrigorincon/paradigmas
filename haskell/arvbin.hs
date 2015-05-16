--a palavra reservada "data" diz q � uma estrutura de dados
data ArvBin a = Null
	| No a (ArvBin a) (ArvBin a)

--somaArvore � uma fun��o
somaArvore Null = 0 --digo que, nessa fun��o, Null ser� 0
somaArvore (No x esq dir) = x + (somaArvore esq) + (somaArvore dir)

travessiaInOrder :: ArvBin a -> [a]
travessiaInOrder Null = []
travessiaInOrder (No x esq dir) = (travessiaInOrder esq) ++ [x] ++ (travessiaInOrder dir)


travessiaPreOrder (No x esq dir) = do
									print x
									travessiaPreOrder esq
									travessiaPreOrder dir