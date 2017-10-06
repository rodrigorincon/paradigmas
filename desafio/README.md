# Desafio 1
Foi criado uma classe com 2 pilhas, uma principal (dados) que guarda meus números e uma secundária (min_list) que guarda somente os menores números inseridos na pilha principal.

Se inserir, por exemplo, 20 e depois 50, no vetor principal estará [20,50] enquanto no vetor dos menores estará apenas [20]. Isso acontece pois ao inserir o segundo número e verificar se o novo valor de entrada (50) é menor que o atual menor número ele só adiciona caso seja menor ou igual. Isso evita deixar a pilha de menores números grande demais sem necessidade. Na hora de retirar ele também verifica se o número a ser excluído do vetor principal é igual ao atual menor, se for então deve retirá-lo de ambos os vetores.

Como se trata de uma pilha, a inserção e remoção já são O(1) naturalmente, pois ambos trabalham apenas com a última posição de mesmo. Inserir um valor novo ao fim do vetor não exige percorrer todo o vetor para chegar ao seu fim,o python guarda acesso direto a ele, assim como ao deletá-lo o único trabalho do python é acessar a última posição diretamente e seu antecessor para atualizar a lista. O método "min", por também trabalhar apenas com a última posição de seu vetor, faz uso da mesma lógica do vetor principal.

# Desafio 2 
O segundo desafio foi feito em Rails usando a gem "omniauth-google-oauth2" para autenticar com o Google. Para realizar essa comunicação é preciso copiar o arquivo "google_api_datas.yml.sample" e criar seu próprio arquivo de configuração com o seguinte comando:

```
cp google_api_datas.yml.sample google_api_datas.yml
```

Dentro dele há 3 variáveis que devem ser preenchidas com seus dados de aplicativo do Google e o nome do arquivo que possui seu certificado digital (que deve está presente na raiz do projeto).

Para salvar os anexos da task é preciso criá-la primeiro para então editá-la. Ao clicar em "edit" é possível ver o botão de subir um novo anexo e escolher qualquer arquivo. Infelizmente, devido ao tempo, só é possível salvar um arquivo por vez, tendo de salvar o primeiro, entrar na tela de editar novamente e carregar o novo arquivo.

A maior dificuldade foi o tempo, pois tive menos de 10 horas para fazer este segundo desafio, portanto alguns pontos ficaram faltantes: como a integração com o Elastic Search, alguns detalhes de vizualização para deixar mais intuitivo o sistema e o download dos anexos.

Além da falta de tempo outro desafio foi a integração com o Google através do OAuth2. Até então nunca havia feito cadastro através de OAuth e OpenID, então tive de estudar as duas tecnologias mais a fundo para conhecer os detalhes de funcionamento das duas para então implementá-las.
