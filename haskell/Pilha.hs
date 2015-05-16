module Pilha(
	Pilha,
	empilha
) where

data Pilha p = Null
	| Pilha [p]
	deriving(Eq,Show)

empilha :: Pilha p -> p -> Pilha p
empilha Null valor = Pilha [valor]
empilha (Pilha cauda) valor = Pilha (valor:cauda)
