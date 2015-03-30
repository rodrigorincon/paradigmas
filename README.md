# paradigmas
tutoriais e exemplos de vários paradigmas de programação.
<hr>
Este projeto abordará os seguintes paradigmas de programação:
<ul>
  <li>Orientado a Convenções sobre Configuração, usando Groovy e o framework Grails</li>
  <li>Funcional, usando a linguagem Haskel</li>
  <li>Lógico, usando a linguagem Prolog</li>
  <li>Multi-agentes (paradigma concorrente), usando a linguagem Java com o framework Jade</li>
</ul>
É abordada a diferença de modelar e pensar o problema em cada um destes paradigmas bem como uma implementação básica de cada uma.
<hr>
# Descrição dos paradigmas
<h3>Orientado a Convenções sobre Configuração</h3>

Convenção sobre configuração é um modelo de desenvolvimento de software que busca diminuir o número de decisões que os desenvolvedores precisam tomar, fornecendo uma base pronta com a maioria das necessidades do programador já codificadas, permitindo que foque apenas no que é exclusivo do seu negócio. Visa ganhar simplicidade sem perder flexibilidade.

O paradigma, muitas vezes fornecido na forma de um framework, fornece uma implementação fácil de usar de necessidades comuns, como conexão com o banco de dados, mapeamento Objeto-Relacional, conexões TCP/IP, dentre outras. O paradigma permite ainda, através de arquivos de configuração ou linhas de comando, alterar entre as implementações fornecidas (como trocar o servidor de banco de dados) e tudo isso sem provocar alteração no código do desenvolvedor.

Com isso o desenvolvedor precisa de definir apenas aspectos específicos da sua aplicação.

O nome convenção sobre configuração se deve por utilizar-se de convenções da comunidade e boas práticas de programação e nomeação. Por exemplo, podemos adotar uma convenção de nomes, nas quais o nome da tabela no banco de dados será sempre o plural da classe persistente. Se existe uma classe "Venda" no modelo, a tabela correspondente no banco de dados será chamada, por padrão, "vendas". Somente no caso de alguém se desviar deste modelo tornar-se-ia necessário escrever código específico relacionando a classe a a tabela, como se se resolvesse chamar a tabela "produtos_vendidos".

Quando a convenção implementada pela ferramenta que se utiliza corresponde ao comportamento desejado, o desenvolvedor gasta menos esforço (ou não há sequer esforço) na redação de arquivos de configuração. Somente se o comportamento desejado for distinto da convenção implementada é que se torna necessário elaborar configurações.

Esta visão permite ao programador trabalhar num nível maior de abstração sem a necessidade da criação de uma camada de abstração.

<h3>Paradigma Funcional</h3>
<h3>Paradigma Lógico</h3>
<h3>Paradigma Concorrente ou multi-agene</h3>
<hr>
# Instalações das linguagens e ferramentas no Ubuntu 12.04
<h3>Grails 2.2.4</h3>
Primeiramente instale o Java
- sudo apt-get install openjdk-6-jdk
Em, seguida, instale o curl
- sudo apt-get install curl
Baixe o Groovy através do curl
- curl -s get.gvmtool.net | bash
Antes de instalar o Groovy e o Grails, execute este comando trocando no seu terminal
- source "~/.gvm/bin/gvm-init.sh"
Agora podemos finalmente instalar o Grails
- gvm install grails <versão>
Neste projeto, estamos utilizando o Grails 2.2.4
<hr>
<h3>Haskel</h3>

<hr>
<h3>Prolog</h3>

<hr>
<h3>Jade</h3>
