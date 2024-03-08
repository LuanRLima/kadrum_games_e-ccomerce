
# Sistema de Loja de Jogos da Kadrum Games

O sistema de loja de jogos da Kadrum Games é um aplicativo web e móvel que permite que os usuários comprem jogos. O sistema é composto por um aplicativo web, um aplicativo móvel, um backend for frontend (BFF), e microserviços de autenticação, produto, pedido e notificação.

# Funcionalidades

## O sistema oferece as seguintes funcionalidades:

Navegação no catálogo de jogos: os usuários podem navegar no catálogo de jogos e visualizar informações sobre cada jogo.
Adição de jogos ao carrinho: os usuários podem adicionar jogos ao carrinho para compra posterior.
Finalização de pedidos: os usuários podem finalizar pedidos e pagar por jogos usando um gateway de pagamento.
Notificações de compra: os usuários recebem notificações por e-mail sobre suas compras.
Tecnologias

## O sistema é desenvolvido utilizando as seguintes tecnologias:

Linguagem de programação: Java
Framework: Spring Boot
Banco de dados: H2
Fila de mensagens: RabbitMQ
Gateway de pagamento: [Nome do gateway de pagamento]
Arquitetura

## A arquitetura do sistema é baseada no modelo C4. O sistema é composto pelos seguintes componentes:

Aplicativo web: aplicativo web que permite que os usuários naveguem no catálogo de jogos, adicionem jogos ao carrinho e finalizem pedidos.
Aplicativo móvel: aplicativo móvel que permite que os usuários naveguem no catálogo de jogos, adicionem jogos ao carrinho e finalizem pedidos.
BFF: backend for frontend que acessa os microserviços de autenticação, produto, pedido e notificação.
Microserviço de autenticação: microserviço que autentica os usuários.
Microserviço de produto: microserviço que gerencia os produtos do sistema.
Microserviço de pedido: microserviço que gerencia os pedidos do sistema.
Microserviço de notificação: microserviço que envia notificações de compra para os usuários.
Relações entre os Componentes

## Os seguintes relacionamentos existem entre os componentes do sistema:

O aplicativo web e o aplicativo móvel se comunicam com o BFF.
O BFF se comunica com os microserviços de autenticação, produto, pedido e notificação.
O microserviço de autenticação se comunica com o banco de dados de autenticação.
O microserviço de produto se comunica com o banco de dados de produto.
O microserviço de pedido se comunica com o banco de dados de pedido.
O microserviço de notificação se comunica com o banco de dados de notificação.

Este README é um resumo do projeto. Para mais informações, consulte o modelo C4 completo.
C4 Model: https://c4model.com/

![System Landscape](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/bff48623-dedb-4fd9-ab8c-9393266791c4)
![structurizr-SystemContext-003 (1)](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/7ed97a22-bc6e-495e-ab2b-590879bece6d)
![structurizr-Containers-014 (1)](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/1d975cfd-4489-40d1-b9c0-0eb64e37508a)
![structurizr-Auth-Components-007](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/eb884157-1074-4087-9827-d357f7141608)
![structurizr-Auth-DB-Components](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/ab4ebcbf-0ebf-45e2-9c0e-56449c8bb968)
![structurizr-Notification-Components](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/2a9bb89b-03c9-4055-a95a-afe08bc68058)
![structurizr-Notification-DB-Components](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/ae94e828-6371-4188-b4b2-ca0eebd122a1)
![structurizr-Order-Components](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/738996b9-07cd-4668-bb8d-7b40ec176b95)
![structurizr-Order-DB-Components (1)](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/b3cc58fb-0b8c-4dbb-9089-143a98b1246d)
![structurizr-Order-Exchange-Components](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/1bd9b373-c720-4519-9cf2-192d6bf62c83)
![structurizr-Product-Components](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/d80035b5-80d9-46c4-b685-3573d1fc4e22)
![structurizr-Product-DB-Components](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/8e0bbc2f-9dfd-4307-b89d-97d5d0de7c05)
![structurizr-Order (2)](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/10b74b76-4119-4d98-a91f-b1350b5d015e)
![structurizr-SignIn (3)](https://github.com/LuanRLima/kadrum_games_e-comerce/assets/57253111/a56f4e13-2adf-442f-92c5-4d6e1e029db8)



