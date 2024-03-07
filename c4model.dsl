workspace "Kadrum Games" "Este é o modelo C4 para o sistema de loja de jogos da Kadrum Games. O sistema é composto por um aplicativo web e um aplicativo móvel, ambos acessando um backend for frontend (BFF) que por sua vez acessa os microserviços de autenticação, produto, pedido e notificação. O sistema é utilizado por usuários que farão compras no site."{

    model {
        user = person "User" "Usuário do  web-site" "Usuário"

        group "Kadrum Games" {
            sms = softwareSystem "SMS" "Serviço de envio de SMS" "Existing System"
            paymentGateway = softwareSystem "Payment Gateway" "Gateway de pagamento" "Existing System"

            softwareSystem = softwareSystem "E-Commere" "Permite que o usuário faça compras, trocas, devoluções, adicione aos favoritos e gerencie sua conta de usuário. O sistema também envia notificações de compra e realiza pagamentos." "Software System"{
                singlePageApplication = container "Pagina rederizada" "Pagina rederizada para compra de jogos"
                webApplication = container "Web Application" "Aplicativo web para compra de jogos" "Angular" "Web Browser"
                mobileApplication = container "Mobile Application" "Aplicativo móvel para compra de jogos" "Ionic" "Mobile App"
                bff = container "Backend for Frontend" "Backend for Frontend que acessa os microserviços de autenticação, produto, pedido e notificação" "Java / Spring Boot"
                auth = container "Auth" "Microserviço de autenticação" "java / Spring Boot" {
                    UserController = component "User Controller" "Controlador expor um endpoint para cadastrar usuários, atualizar, remover e consultar usuários (api\users)" "Spring MVC Rest Controller"
                    CompanyController = component "Company Controller" "Controlador expor um endpoint para cadastrar empresas, atualizar, remover e consultar empresas (api\companies)" "Spring MVC Rest Controller"
                    AuthController = component "Auth Controller" "Controlador expor um endpoint para autenticar usuários (api\auth)" "Spring MVC Rest Controller"
                    CompanyService = component "Company Service" "Serviço para cadastrar, atualizar, remover e consultar empresas" "Spring Service"
                    UserService = component "User Service" "Serviço para cadastrar, atualizar, remover e consultar usuários" "Spring Service"
                    CompanyRepository = component "Company Repository" "Responsavel por fazer conexão com o banco de dados e realizar operações de inserção, atualização, remoção e consulta de empresas" "Spring Data JPA Repository"
                    UserRepository = component "User Repository" "Responsavel por fazer conexão com o banco de dados e realizar operações de inserção, atualização, remoção e consulta de usuários" "Spring Data JPA Repository"
                }
                // todo - add components de product, order, notification
                product = container "Product" "Microserviço de produto" "Java / Spring Boot" {
                    ProductController = component "Product Controller" "Controlador expor um endpoint para cadastrar produtos, atualizar, remover e consultar produtos (api\products)" "Spring MVC Rest Controller"
                    ProductService = component "Product Service" "Serviço para cadastrar, atualizar, remover e consultar produtos" "Spring Service"
                    ProductRepository = component "Product Repository" "Responsavel por fazer conexão com o banco de dados e realizar operações de inserção, atualização, remoção e consulta de produtos" "Spring Data JPA Repository"
                }
                notification = container "Notification" "Microserviço de notificação" "Java / Spring Boot"{
                    RabbitMQComponent = component "RabbitMQComponent" "Componente que  receber mensagens da fila de notificação e faz requisiçoes em product e auth para pegar os dados necessarios" "Spring AMQP/ Feign"
                    EmailService = component "EmailService" "Recebe notificação de pedido via fila de notificação e envia e-mail com o status e detalhes do pedido via spring email" "Spring Service"
                    NotificationRepository = component "NotificationRepository" "Persite o email enviado no banco de dados" "Spring Data JPA Repository"
                }
                order = container "Order" "Microserviço de pedido" "Java / Spring Boot"{
                    OrderController = component "Order Controller" "Controlador expor um endpoint para cadastrar pedidos, atualizar, remover e consultar pedidos (api\orders)" "Spring MVC Rest Controller"
                    OrderService = component "Order Service" "Serviço para cadastrar, atualizar, remover, consultar pedidos e enviar uma evneot para a fila de notificação " "Spring Service"
                    OrderRepository = component "Order Repository" "Responsavel por fazer conexão com o banco de dados e realizar operações de inserção, atualização, remoção e consulta de pedidos" "Spring Data JPA Repository"
                }
                authDb = container "Auth DB" "Banco de dados de autenticação" "H2" "Database"{
                    CompanyTable = component "Company Table" "Tabela de empresas" "H2" "Database"
                    UserTable = component "User Table" "Tabela de usuários" "H2" "Database"
                }
                productDb = container "Product DB" "Banco de dados de produto" "H2" "Database"{
                    ProductTable = component "Product Table" "Tabela de produtos" "H2"
                }
                notificationDb = container "Notification DB" "Banco de dados de notificação" "H2" "Database"{
                    NotificationTable = component "Notification Table" "Tabela de notificação" "H2" "Database"
                }
                orderDb = container "Order DB" "Banco de dados de pedido" "H2" "Database"{
                    OrderTable = component "Order Table" "Tabela de pedidos" "H2" "Database"
                }
                orderExchange = container "orderExchange" "Exchange de pedido" "RabbitMQ"{
                    orderNotification = component "OrderNotification" "Fila de notificação de pedido" "RabbitMQ Queue"
                }

            }

            #relacionamentos entre o usuário e o sistema
            user -> softwareSystem "Realiza compras" "Realiza compras de jogos" x
            softwareSystem -> sms "Envia SMS" "Envia notificações de compra"
            softwareSystem -> paymentGateway "Realiza pagamentos" "Realiza pagamentos de compras"

            #relacionamentos entre os containers do sistema
            singlePageApplication -> webApplication "Compra, troca, devolução, favoritos, gerenciamento de conta"
            singlePageApplication -> mobileApplication "Compra, troca, devolução, favoritos, gerenciamento de conta"
            webApplication -> bff "Compra, troca, devolução, favoritos, gerenciamento de conta"
            mobileApplication -> bff "Compra, troca, devolução, favoritos, gerenciamento de conta"
            bff -> auth "Realiza chamadas de consulta ou alteração de usuário ou empresas" Http/Json"
            bff -> product "Realiza chamadas de produto (listagem, detalhes, etc) Http/Json"
            bff -> order "Realiza chamadas de pedido (criação, listagem, alteração, e exclusão) Http/Json"
            auth -> authDb "Realiza inserção, atualização, remoção e consulta de usuário "
            product -> productDb "Realiza inserção, atualização, remoção e consulta de produto"
            order -> orderDb "Realiza inserção, atualização, remoção e consulta de pedido"
            order -> product "Realiza chamada http para o microserviço de produto para verificar se o produto ainda esta disponivel"
            order -> orderExchange "Envia notificação de pedido"
            order -> paymentGateway "Api realiza integração com gateway de pagamento"
            orderExchange -> notification "Envia notificação de pedido"
            notification -> product "Raaliza chamada http para obter os dados do produto"
            notification -> auth "Raaliza chamada http para obter os dados do usuário"
            notification -> sms "Api realiza integração com o serviço de envio de SMS"
            notification -> user "Envia e-mail com o status e detalhes do pedido"
            notification -> notificationDb "Persite o email enviado no banco de dados"

            #relacionamentos entre os componentes do sistema
            bff -> UserController "Realiza chamadas de consulta ou alteração de usuário"
            bff -> CompanyController "Realiza chamadas de consulta ou alteração empresas"
            CompanyController -> CompanyService "Realiza chamadas de consulta ou alteração empresas"
            UserController -> UserService "Realiza chamadas de consulta ou alteração de usuário"
            AuthController -> UserService "Realiza autenticação do usuário"
            CompanyService -> CompanyRepository "Realiza chamadas de consulta ou alteração empresas"
            UserService -> UserRepository "Realiza chamadas de consulta ou alteração de usuário"
            UserRepository -> UserTable "Realiza chamadas de consulta ou alteração de usuário"
            CompanyRepository -> CompanyTable "Realiza chamadas de consulta ou alteração empresas"

            bff -> ProductController "Realiza chamadas de consulta ou alteração de produto"
            ProductController -> ProductService "Realiza chamadas de consulta ou alteração de produto"
            ProductService -> ProductRepository "Realiza chamadas de consulta ou alteração de produto"
            ProductRepository -> ProductTable "Realiza chamadas de consulta ou alteração de produto"

            bff -> OrderController "Realiza chamadas de consulta ou alteração de pedido"
            OrderController -> OrderService "Realiza chamadas de consulta ou alteração de pedido"
            OrderService -> OrderRepository "Realiza chamadas de consulta ou alteração de pedido"
            OrderRepository -> OrderTable "Realiza chamadas de consulta ou alteração de pedido"
            OrderService -> orderExchange "Envia notificação de pedido"
                OrderService -> paymentGateway "Api realiza integração com gateway de pagamento"

            orderExchange -> RabbitMQComponent "Recebe notificação de pedido via fila de notificação "
            RabbitMQComponent -> ProductController "Faz requisiçoes em ProductController para pegar dados necessarios"
            RabbitMQComponent -> UserController "Faz requisiçoes em ProductController pegar dados necessarios"
            RabbitMQComponent -> EmailService "Recebe notificação de pedido via fila de notificação e envia e-mail com o status e detalhes do pedido via spring email"
            EmailService -> User "Envia e-mail com o status e detalhes do pedido"
            RabbitMQComponent -> sms "Api realiza integração com o serviço de envio de SMS"
            EmailService -> NotificationRepository "Persite o email enviado no banco de dados"
            NotificationRepository -> NotificationTable "Persite o email enviado no banco de dados"


        }



    }
        views {
        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext softwareSystem "SystemContext" {
            include *
            animation {
                softwareSystem
                sms
                paymentGateway
            }
            autoLayout
            description "O sistema de loja de jogos da Kadrum Games."
            properties {
                structurizr.groups false
            }
        }

        container softwareSystem "Containers" {
            include *
            animation {
                paymentGateway sms
                webApplication
                singlePageApplication
                mobileApplication
                bff
                auth
                product
                notification
                order
                authDb
                productDb
                orderDb
                orderExchange
                notificationDb
            }
            autoLayout
            description "Os containers que compõem o sistema de loja de jogos da Kadrum Games."
        }

        component auth "Auth-Components" {
            include * UserTable CompanyTable

            animation {
                UserController
                CompanyController
                AuthController
                CompanyService
                UserService
                CompanyRepository
                UserRepository

            }
            autoLayout
            description "Os componentes que compõem o container de autenticação."
        }

        component product "Product-Components" {
            include * ProductTable
            animation {
                ProductController
                ProductService
                ProductRepository

            }
            autoLayout
            description "Os componentes que compõem o container de Product."
        }

        component order "Order-Components" {
            include * OrderTable
            animation {
                OrderController
                OrderService
                OrderRepository
            }
            autoLayout
            description "Os componentes que compõem o container de Order."
        }

        component notification "Notification-Components" {
            include * NotificationTable
            animation {
                EmailService
                NotificationRepository
                RabbitMQComponent

            }
            autoLayout
            description "Os componentes que compõem o container de Notification."
        }



        component authDb "Auth-DB-Components" {
            include *
            autoLayout
            animation {
                CompanyTable
                UserTable
            }
            description "Os componentes que compõem o container de Auth DB."
        }

        component productDb "Product-DB-Components" {
            include *
            autoLayout
            animation {
                ProductTable
            }
            description "Os componentes que compõem o container de Product DB."
        }

        component orderDb "Order-DB-Components" {
            include *
            autoLayout
            animation {
                OrderTable
            }
            description "Os componentes que compõem o container de Order DB."
        }

        component notificationDb "Notification-DB-Components" {
            include *
            autoLayout
            animation {
                NotificationTable
            }
            description "Os componentes que compõem o container de Notification DB."
        }

        component orderExchange "Order-Exchange-Components" {
            include *
            autoLayout
            animation {
                orderNotification
            }
            description "Os componentes que compõem o container de Order Exchange."
        }



        // todo - add png images

        dynamic singlePageApplication "SignIn" "Descreve como o usuario faz o login no aplicativo de página única." {
            webApplication -> bff "Submete credenciais de login"
            bff -> auth "Chama o microserviço de autenticação"
            auth -> authDb "Realiza consulta de usuário"
            auth -> bff "Retorna a autenticação"
            bff -> webApplication "Retorna a autenticação"
            webApplication -> bff "Solicita os dados do usuário"
            bff -> auth "Chama o microserviço de autenticação"
            auth -> authDb "Realiza consulta de usuário"
            auth -> bff "Retorna os dados do usuário"
            bff -> webApplication "Retorna os dados do usuário"
            autoLayout
            description "Descreve como o usuario faz o login no aplicativo de página única."
        }

        dynamic singlePageApplication "Order" "Descreve como o usuario faz o pedido no aplicativo de página única." {
        // quero   um fluxo assim page chama mostrar os produtos disponivel depois pode ir adcionando a um carrinho e antes de finalizar o pedido o microserviço de order se cmunicar com o de product para saber se aida esta disponivel os produtos e depois segue o flxuo
            webApplication -> bff "Solicita os produtos disponíveis"
            bff -> product "Chama o microserviço de produto"
            product -> productDb "Realiza consulta de produtos"
            product -> bff "Retorna os produtos disponíveis"
            bff -> webApplication "Retorna os produtos disponíveis"
            webApplication -> bff "Adiciona um ou varios produto ao carrinho"
            webApplication -> bff "Finaliza o pedido"
            bff -> order "Chama o microserviço de pedido"
            order -> product "Chama o microserviço de produto"
            product -> productDb "Realiza consulta de produtos"
            product -> order "Retorna os produtos disponíveis"
            order -> orderDb "Realiza inserção de pedido"
            order -> orderExchange "Envia notificação de pedido"
            order -> paymentGateway "Api realiza integração com gateway de pagamento"
            paymentGateway -> order "Realiza pagamento de pedido"
            order -> orderExchange "Envia notificação de pedido"
            orderExchange -> notification "Envia notificação de pedido"
            notification -> product "Raaliza chamada http para obter os dados do produto"
            notification -> auth "Raaliza chamada http para obter os dados do usuário"
            notification -> sms "Api realiza integração com o serviço de envio de SMS"
            notification -> user "Envia e-mail com o status e detalhes do pedido"
            notification -> notificationDb "Persite o email enviado no banco de dados"
            autoLayout
            description "Descreve como o usuario faz o pedido no aplicativo de página única."
        }



        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Usuário" {
                background #08427b
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
    }


}