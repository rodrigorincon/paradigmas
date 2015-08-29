gato(tom).
gato(frajola).

rato(jerry).

come(Gato,Rato):-gato(Gato),rato(Rato).

casaLimpa(AnimalVistoNaCasa) :- gato(AnimalVistoNaCasa) -> write('casa limpa'),nl; write('casa suja'),nl.
