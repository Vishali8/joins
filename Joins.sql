CREATE DATABASE JoinsDB;
USE JoinsDB;
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50) CHECK (City IS NOT NULL)
);
-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(100),
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--INserting sample data
-- Customers
INSERT INTO Customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Raj', 'Chennai'),
(4, 'Sneha', 'Bangalore');INSERT INTO Customers VALUES (5, 'Kiran', 'Hyderabad');

-- Orders
INSERT INTO Orders VALUES
(101, 1, 'Laptop', 75000),
(102, 2, 'Phone', 25000),
(103, 5, 'Tablet', 30000); -- CustomerID 5 doesn't exist
SELECT * FROM Orders;

SELECT * FROM Customers;

--Show only customers who placed orders(INNER JOIN)
SELECT c.CustomerID, c.Name, o.Product, o.Amount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Includes all customers—even those with no orders.(LEFT JOIN)
SELECT c.CustomerID, c.Name, o.Product, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

--includes all Orders even those having no Customers(RIGHT JOIN)
SELECT c.CustomerID, c.Name, o.Product, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

--Combines all customers and all orders, matched or not.
SELECT c.CustomerID, c.Name, o.Product, o.Amount
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;
