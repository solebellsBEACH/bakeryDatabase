DROP SCHEMA IF EXISTS bakery_schema;

CREATE SCHEMA `bakery_schema`;

USE bakery_schema;

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock_Quantity INT NOT NULL
);

DELIMITER $ $ CREATE PROCEDURE PopulateProducts() BEGIN DECLARE i INT DEFAULT 1;

WHILE i <= 10000 DO
INSERT INTO
    Products (Product_Name, Description, Price, Stock_Quantity)
VALUES
    (
        CONCAT('Product ', i),
        'Description for Product',
        ROUND(RAND() * 100, 2),
        FLOOR(RAND() * 1000)
    );

SET
    i = i + 1;

END WHILE;

END $ $ DELIMITER;

CALL PopulateProducts();

SELECT
    *
FROM
    Products
WHERE
    Product_Name = 'Product 1';