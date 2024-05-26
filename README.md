# BakeryDatabase

Bem-vindo ao repositório **BakeryDatabase**, um banco de dados projetado para gerenciar as operações de uma padaria. Este banco de dados inclui tabelas para gerenciar produtos, clientes, pedidos e itens de pedidos, com as respectivas relações entre elas.

## Estrutura do Banco de Dados

### Tabela: Produtos

A tabela **Produtos** armazena informações sobre os itens disponíveis na padaria.

| Coluna              | Tipo       | Descrição                     |
|---------------------|------------|-------------------------------|
| `ID do Produto`     | INT        | Chave Primária                |
| `Nome do Produto`   | VARCHAR    | Nome do produto               |
| `Descrição`         | TEXT       | Descrição detalhada do produto|
| `Preço`             | DECIMAL    | Preço unitário do produto     |
| `Quantidade em Estoque` | INT    | Quantidade disponível em estoque |

### Tabela: Clientes

A tabela **Clientes** armazena informações dos clientes da padaria.

| Coluna           | Tipo       | Descrição                     |
|------------------|------------|-------------------------------|
| `ID do Cliente`  | INT        | Chave Primária                |
| `Nome`           | VARCHAR    | Nome do cliente               |
| `Endereço`       | TEXT       | Endereço do cliente           |
| `E-mail`         | VARCHAR    | E-mail do cliente             |
| `Telefone`       | VARCHAR    | Número de telefone do cliente |

### Tabela: Pedidos

A tabela **Pedidos** armazena informações sobre os pedidos realizados pelos clientes.

| Coluna           | Tipo       | Descrição                                  |
|------------------|------------|--------------------------------------------|
| `ID do Pedido`   | INT        | Chave Primária                             |
| `ID do Cliente`  | INT        | Chave Estrangeira referenciando a tabela Clientes |
| `Data e Hora do Pedido` | DATETIME | Data e hora em que o pedido foi realizado |
| `Status do Pedido` | VARCHAR  | Status do pedido (por exemplo, pendente, entregue, cancelado) |

### Tabela: Itens do Pedido

A tabela **Itens do Pedido** armazena informações sobre os produtos incluídos em cada pedido.

| Coluna           | Tipo       | Descrição                                  |
|------------------|------------|--------------------------------------------|
| `ID do Item`     | INT        | Chave Primária                             |
| `ID do Pedido`   | INT        | Chave Estrangeira referenciando a tabela Pedidos |
| `ID do Produto`  | INT        | Chave Estrangeira referenciando a tabela Produtos |
| `Quantidade`     | INT        | Quantidade do produto no pedido            |
| `Preço Unitário` | DECIMAL    | Preço unitário do produto no momento do pedido |

## Relacionamentos

- A tabela **Pedidos** tem uma chave estrangeira `ID do Cliente` que referencia a tabela **Clientes**, indicando qual cliente fez o pedido.
- A tabela **Itens do Pedido** tem uma chave estrangeira `ID do Pedido` que referencia a tabela **Pedidos**, indicando a qual pedido o item pertence.
- A tabela **Itens do Pedido** também tem uma chave estrangeira `ID do Produto` que referencia a tabela **Produtos**, indicando qual produto foi incluído no pedido.

## Scripts SQL

### Criação das Tabelas

```sql
CREATE TABLE Produtos (
    ID_Produto INT PRIMARY KEY,
    Nome_Produto VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Preco DECIMAL(10, 2) NOT NULL,
    Quantidade_em_Estoque INT NOT NULL
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco TEXT NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE Pedidos (
    ID_Pedido INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Hora_Pedido DATETIME NOT NULL,
    Status_Pedido VARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Itens_Pedido (
    ID_Item INT PRIMARY KEY,
    ID_Pedido INT,
    ID_Produto INT,
    Quantidade INT NOT NULL,
    Preco_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);
```

## Utilização

Este banco de dados pode ser utilizado para gerenciar todas as operações relacionadas a produtos, clientes, pedidos e itens de pedidos em uma padaria. A estrutura relacional facilita a consulta e manipulação dos dados de forma eficiente e organizada.

## Contribuição

Sinta-se à vontade para contribuir com melhorias e novas funcionalidades para este banco de dados. Faça um fork do repositório e envie um pull request com suas alterações.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
