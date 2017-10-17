# Desafio 1
Para esse desafio optei por desenvolver a solução em python pela simplicidade da linguagem  em trabalhar com vetores e facilidade de construir algo rapidamente. Para os testes unitários foi usado o framework unittest.

Para executá-lo, abra o terminal no diretório do arquivo "desafio1.py" e o execute chamando "python desafio1.py PARAMETROS", aonde PARAMETROS é o array de números que compõe o triângulo. Por exemplo, uma forma de executar o desafio seria "python desafio1.py [[6],[3,5],[10,7,1]]". O resultado é mostrado no terminal, mostrando os números do caminho encontrado e a soma deles. Para executar os testes basta executar via linha de comando "python desafio1_test.py".

# Desafio 2 

Para esse desafio desenvolvi uma aplicação Ruby on Rails para servir o serviço de fotos. Através do framework é disponibilizado uma url para acessar a API de criação e acesso às imagens.

Para executá-lo é preciso ter o ruby 2.3.1 instalado (ou algum próximo que rode o Rails 5.1). Na página do projeto então executar "bundle install" para instalar as bibliotecas necessárias e "rake db:create" e "rake db:migrate" para criar o banco de dados. Após o ambiente pronto é só executar "rails s" que o serviço estará disponível na url "localhost:3000". A url para acessar o endpoint e criar as imagens é "localhost:3000/images" via o método POST.
