# E-commerce

### Descrição

Este projeto tem como objetivo criar um banco de dados para um sistema de e-commerce. O banco de dados foi projetado para armazenar informações sobre clientes, produtos, fornecedores, vendedores e pedidos. O sistema permite o registro de clientes, produtos, fornecedores e vendedores, além de controlar os pedidos realizados pelos clientes.

### Diagrama de E-commerce

![E-commerce-project-image](https://user-images.githubusercontent.com/118117592/221371511-047d3ed6-4912-4668-a11f-078a1637a758.png)

### Tecnologias utilizadas

* Linguagem SQL
* Sistema de Gerenciamento de Banco de Dados (SGBD) - Exemplo: MySQL

### Modelagem do Banco de Dados

#### O banco de dados foi projetado com as seguintes tabelas:

1. person: Armazena informações das pessoas, como nome, sexo, endereço, telefone e data de nascimento.
2. naturalPerson: Tabela para registrar informações das pessoas físicas, incluindo o CPF.
3. legalPerson: Tabela para registrar informações das pessoas jurídicas, incluindo a razão social (nome) e o CNPJ.
4. clients: Tabela para armazenar informações dos clientes, relacionando-se com as tabelas de pessoa física e jurídica.
5. supplier: Tabela para armazenar informações dos fornecedores, relacionando-se com as tabelas de pessoa e pessoa jurídica.
6. seller: Tabela para armazenar informações dos vendedores, relacionando-se com a tabela de pessoa jurídica.
7. product: Tabela para armazenar informações dos produtos disponíveis no e-commerce.
8. payments: Tabela para registrar informações sobre os pagamentos realizados pelos clientes.
9. clientOrder: Tabela para registrar os pedidos realizados pelos clientes, incluindo informações sobre o status do pedido e o valor do envio.
10. productStorage: Tabela para armazenar informações do estoque dos produtos.
11. productSeller: Tabela de relacionamento entre os vendedores e os produtos vendidos.
12. productOrder: Tabela de relacionamento entre os produtos e os pedidos realizados.
13. productSupplier: Tabela de relacionamento entre os fornecedores e os produtos fornecidos.
14. storageLocation: Tabela para armazenar informações sobre a localização do estoque de cada produto.

### Funcionalidades

1. Cadastro de clientes, produtos, fornecedores e vendedores.
2. Registro de informações de pagamento para os clientes.
3. Criação de pedidos pelos clientes.
4. Controle do status dos pedidos (cancelado, confirmado, em processamento).
5. Relação de produtos disponíveis e estoque.
6. Relação de vendedores que também são fornecedores.

### Como utilizar o projeto

1. Crie um banco de dados no SGBD de sua escolha (exemplo: MySQL) e importe o arquivo contendo o código SQL disponibilizado neste projeto para criar todas as tabelas e relacionamentos.
2. Execute as consultas SQL para inserir os dados iniciais nas tabelas, como clientes, produtos, fornecedores, vendedores e pagamentos.
3. Utilize as consultas SQL apresentadas no código para realizar consultas e obter informações sobre clientes, produtos, fornecedores, vendedores e pedidos.

### Considerações Finais

Este projeto oferece uma estrutura básica para o gerenciamento de um sistema de e-commerce. Dependendo das necessidades do negócio, é possível expandir e aprimorar o banco de dados, adicionando novas funcionalidades e otimizando o código SQL. Além disso, é importante garantir a segurança e integridade dos dados, implementando medidas de proteção, como backups regulares e restrições de acesso aos dados.

### Autor: José Gabriel dos Santos Pádua
