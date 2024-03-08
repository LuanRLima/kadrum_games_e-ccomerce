
Sistema de Loja de Jogos da Kadrum Games

O sistema de loja de jogos da Kadrum Games é um aplicativo web e móvel que permite que os usuários comprem jogos. O sistema é composto por um aplicativo web, um aplicativo móvel, um backend for frontend (BFF), e microserviços de autenticação, produto, pedido e notificação.

Funcionalidades

O sistema oferece as seguintes funcionalidades:

Navegação no catálogo de jogos: os usuários podem navegar no catálogo de jogos e visualizar informações sobre cada jogo.
Adição de jogos ao carrinho: os usuários podem adicionar jogos ao carrinho para compra posterior.
Finalização de pedidos: os usuários podem finalizar pedidos e pagar por jogos usando um gateway de pagamento.
Notificações de compra: os usuários recebem notificações por e-mail sobre suas compras.
Tecnologias

O sistema é desenvolvido utilizando as seguintes tecnologias:

Linguagem de programação: Java
Framework: Spring Boot
Banco de dados: H2
Fila de mensagens: RabbitMQ
Gateway de pagamento: [Nome do gateway de pagamento]
Arquitetura

A arquitetura do sistema é baseada no modelo C4. O sistema é composto pelos seguintes componentes:

Aplicativo web: aplicativo web que permite que os usuários naveguem no catálogo de jogos, adicionem jogos ao carrinho e finalizem pedidos.
Aplicativo móvel: aplicativo móvel que permite que os usuários naveguem no catálogo de jogos, adicionem jogos ao carrinho e finalizem pedidos.
BFF: backend for frontend que acessa os microserviços de autenticação, produto, pedido e notificação.
Microserviço de autenticação: microserviço que autentica os usuários.
Microserviço de produto: microserviço que gerencia os produtos do sistema.
Microserviço de pedido: microserviço que gerencia os pedidos do sistema.
Microserviço de notificação: microserviço que envia notificações de compra para os usuários.
Relações entre os Componentes

Os seguintes relacionamentos existem entre os componentes do sistema:

O aplicativo web e o aplicativo móvel se comunicam com o BFF.
O BFF se comunica com os microserviços de autenticação, produto, pedido e notificação.
O microserviço de autenticação se comunica com o banco de dados de autenticação.
O microserviço de produto se comunica com o banco de dados de produto.
O microserviço de pedido se comunica com o banco de dados de pedido.
O microserviço de notificação se comunica com o banco de dados de notificação.
Próximos Passos

Os próximos passos para o projeto são:

Implementar o sistema.
Testar o sistema.
Lançar o sistema.
Recursos

C4 Model: https://c4model.com/
C4 Model for a Web Application: https://c4model.com/
Observações

Este README é um resumo do projeto. Para mais informações, consulte o modelo C4 completo.
