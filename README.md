# BakeryDatabase

Bem-vindo ao repositório **BakeryDatabase**, um banco de dados projetado para gerenciar as operações de uma padaria. Este banco de dados inclui tabelas para gerenciar produtos, clientes, pedidos e itens de pedidos, com as respectivas relações entre elas.

## Estrutura do Banco de Dados

### Tabela: Products

A tabela **Products** armazena informações sobre os itens disponíveis na padaria.

| Coluna                 | Tipo       | Descrição                     |
|------------------------|------------|-------------------------------|
| `Product ID`           | INT        | Chave Primária                |
| `Product Name`         | VARCHAR    | Nome do produto               |
| `Description`          | TEXT       | Descrição detalhada do produto|
| `Price`                | DECIMAL    | Preço unitário do produto     |
| `Stock Quantity`       | INT        | Quantidade disponível em estoque |

### Tabela: Customers

A tabela **Customers** armazena informações dos clientes da padaria.

| Coluna            | Tipo       | Descrição                     |
|-------------------|------------|-------------------------------|
| `Customer ID`     | INT        | Chave Primária                |
| `Name`            | VARCHAR    | Nome do cliente               |
| `Address`         | TEXT       | Endereço do cliente           |
| `Email`           | VARCHAR    | E-mail do cliente             |
| `Phone`           | VARCHAR    | Número de telefone do cliente |

### Tabela: Orders

A tabela **Orders** armazena informações sobre os pedidos realizados pelos clientes.

| Coluna              | Tipo       | Descrição                                  |
|---------------------|------------|--------------------------------------------|
| `Order ID`          | INT        | Chave Primária                             |
| `Customer ID`       | INT        | Chave Estrangeira referenciando a tabela Customers |
| `Order Date Time`   | DATETIME   | Data e hora em que o pedido foi realizado  |
| `Order Status`      | VARCHAR    | Status do pedido (por exemplo, pendente, entregue, cancelado) |

### Tabela: Order Items

A tabela **Order Items** armazena informações sobre os produtos incluídos em cada pedido.

| Coluna            | Tipo       | Descrição                                  |
|-------------------|------------|--------------------------------------------|
| `Item ID`         | INT        | Chave Primária                             |
| `Order ID`        | INT        | Chave Estrangeira referenciando a tabela Orders |
| `Product ID`      | INT        | Chave Estrangeira referenciando a tabela Products |
| `Quantity`        | INT        | Quantidade do produto no pedido            |
| `Unit Price`      | DECIMAL    | Preço unitário do produto no momento do pedido |

## Relacionamentos

- A tabela **Orders** tem uma chave estrangeira `Customer ID` que referencia a tabela **Customers**, indicando qual cliente fez o pedido.
- A tabela **Order Items** tem uma chave estrangeira `Order ID` que referencia a tabela **Orders**, indicando a qual pedido o item pertence.
- A tabela **Order Items** também tem uma chave estrangeira `Product ID` que referencia a tabela **Products**, indicando qual produto foi incluído no pedido.

## Scripts SQL

### Criação das Tabelas

```sql
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address TEXT NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date_Time DATETIME NOT NULL,
    Order_Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Order_Items (
    Item_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
```

## Utilização

Este banco de dados pode ser utilizado para gerenciar todas as operações relacionadas a produtos, clientes, pedidos e itens de pedidos em uma padaria. A estrutura relacional facilita a consulta e manipulação dos dados de forma eficiente e organizada.

## Contribuição

Sinta-se à vontade para contribuir com melhorias e novas funcionalidades para este banco de dados. Faça um fork do repositório e envie um pull request com suas alterações.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
