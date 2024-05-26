DROP SCHEMA IF EXISTS bakery_schema;

CREATE SCHEMA `bakery_schema`;

USE bakery_schema;

-- Remover tabelas se existirem
DROP TABLE IF EXISTS Order_Items;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Products;

-- Criação das tabelas
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL
);

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address TEXT NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Order_Date_Time DATETIME NOT NULL,
    Order_Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Order_Items (
    Item_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Inserir dados na tabela Products
INSERT INTO
    Products (Product_Name, Description, Price, Stock_Quantity)
VALUES
    ('Bread', 'Freshly baked bread', 2.50, 100),
    (
        'Croissant',
        'Flaky and buttery croissant',
        1.50,
        200
    ),
    ('Muffin', 'Blueberry muffin', 1.20, 150),
    ('Donut', 'Chocolate glazed donut', 1.00, 100),
    (
        'Bagel',
        'Chewy bagel with sesame seeds',
        1.30,
        120
    );

-- Inserir dados na tabela Customers
INSERT INTO
    Customers (Name, Address, Email, Phone)
VALUES
    (
        'John Doe',
        '123 Main St',
        'john@example.com',
        '555-0101'
    ),
    (
        'Jane Smith',
        '456 Oak St',
        'jane@example.com',
        '555-0102'
    ),
    (
        'Alice Johnson',
        '789 Pine St',
        'alice@example.com',
        '555-0103'
    ),
    (
        'Bob Brown',
        '101 Maple St',
        'bob@example.com',
        '555-0104'
    ),
    (
        'Carol White',
        '202 Elm St',
        'carol@example.com',
        '555-0105'
    );

-- Inserir dados na tabela Orders
INSERT INTO
    Orders (Customer_ID, Order_Date_Time, Order_Status)
VALUES
    (1, '2024-05-26 08:00:00', 'pending'),
    (2, '2024-05-26 09:00:00', 'delivered'),
    (3, '2024-05-26 10:00:00', 'pending'),
    (4, '2024-05-26 11:00:00', 'cancelled'),
    (5, '2024-05-26 12:00:00', 'delivered');

-- Inserir dados na tabela Order_Items
INSERT INTO
    Order_Items (Order_ID, Product_ID, Quantity, Unit_Price)
VALUES
    (1, 1, 2, 2.50),
    (1, 2, 1, 1.50),
    (2, 3, 3, 1.20),
    (2, 4, 2, 1.00),
    (3, 5, 1, 1.30),
    (3, 1, 5, 2.50),
    (4, 2, 3, 1.50),
    (5, 4, 4, 1.00),
    (5, 5, 2, 1.30);