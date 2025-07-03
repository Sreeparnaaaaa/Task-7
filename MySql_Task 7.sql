CREATE DATABASE company;
USE company;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'John Doe', 'Delhi'),
(2, 'Jane Smith', 'Mumbai'),
(3, 'Amit Kumar', 'Kolkata');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount) VALUES
(101, 1, '2024-06-10', 5000.00),
(102, 1, '2024-06-15', 3000.00),
(103, 2, '2024-07-01', 7000.00),
(104, 3, '2024-07-05', 2000.00);

CREATE VIEW CustomerOrderView AS
SELECT c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT * FROM CustomerOrderView;

CREATE VIEW HighValueOrders AS
SELECT CustomerName, OrderID, Amount
FROM CustomerOrderView
WHERE Amount > 4000;

SELECT * FROM HighValueOrders;
