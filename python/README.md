# Desafio 1
Foi criado uma classe com 2 pilhas, uma principal (dados) que guarda meus números e uma secundária (min_list) que guarda somente os menores números inseridos na pilha principal.

Se inserir, por exemplo, 20 e depois 50, no vetor principal estará [20,50] enquanto no vetor dos menores estará apenas [20]. Isso acontece pois ao inserir o segundo número e verificar se o novo valor de entrada (50) é menor que o atual menor número ele só adiciona caso seja menor ou igual. Isso evita deixar a pilha de menores números grande demais sem necessidade. Na hora de retirar ele também verifica se o número a ser excluído do vetor principal é igual ao atual menor, se for então deve retirá-lo de ambos os vetores.

Como se trata de uma pilha, a inserção e remoção já são O(1) naturalmente, pois ambos trabalham apenas com a última posição de mesmo. Inserir um valor novo ao fim do vetor não exige percorrer todo o vetor para chegar ao seu fim,o python guarda acesso direto a ele, assim como ao deletá-lo o único trabalho do python é acessar a última posição diretamente e seu antecessor para atualizar a lista. O método "min", por também trabalhar apenas com a última posição de seu vetor, faz uso da mesma lógica do vetor principal.

# Desafio 2 
