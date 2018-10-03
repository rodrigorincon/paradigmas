# README

Desafio de programação para ler dados do SUS e entregá-los organizados em uma API.

Foi feito 1 model para representar as unidades básicas de saúde e 1 controller com apenas 1 método e rota para servir a API.

A model é populada pelo seed, cujo método para acessar a base aberta do SUS, tratar os dados e gravá-los está na pasta seeders e seu método chamado no seed.

O tratamento dos filtros na controller são feitos em métodos privados, chamados pela callback "before_action".

Para rodar o projeto siga as instruções a seguir:

* Entre pelo terminal na pasta raíz do projeto e digite o seguinte comandos:

* docker-compose up --build (esse comando irá demorar bastante pois irá executar o seed)

* Para acessar a API vá ao navegador e digite "localhost:3000/api/v1/find_ubs?query=AAAA&page=BBBB&per_page=CCC (lembrando que todos os parâmetros são opcionais)

* Para rodar os testes, primeiro entre no container da aplicação com o comando a seguir:

* docker exec -it bionexo_app "/bin/bash"

* Em seguida execute o comando:

* rspec

