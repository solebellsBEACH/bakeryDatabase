DROP SCHEMA IF EXISTS bakery_schema;
CREATE SCHEMA `bakery_schema` ;

USE bakery_schema;

DROP TABLE IF EXISTS Order_Items;

DROP TABLE IF EXISTS Orders;

DROP TABLE IF EXISTS Customers;

DROP TABLE IF EXISTS Products;

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