-- Create sample database
CREATE DATABASE IF NOT EXISTS JoinsTutorial;
USE JoinsTutorial;

-- Drop tables if they exist
DROP TABLE IF EXISTS Employees, Departments;

-- Create Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Insert data into Departments
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Sales'),
(4, 'Marketing');

-- Create Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DeptID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Insert data into Employees
INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(101, 'Alice', 1, 55000),
(102, 'Bob', 2, 72000),
(103, 'Charlie', 2, 68000),
(104, 'David', 3, 60000),
(105, 'Eve', NULL, 50000);


select * from Departments;

select * from employees;

-- 1. INNER JOIN: Employees with matching departments
SELECT 
    E.EmpName, D.DeptName
FROM Employees E
INNER JOIN Departments D ON E.DeptID = D.DeptID;

-- 2. LEFT JOIN: All employees, even those without a department
SELECT 
    E.EmpName, D.DeptName
FROM Employees E
LEFT JOIN Departments D ON E.DeptID = D.DeptID;

-- 3. RIGHT JOIN: All departments, even if no employees in them
SELECT 
    E.EmpName, D.DeptName
FROM Employees E
RIGHT JOIN Departments D ON E.DeptID = D.DeptID;

-- 4. FULL OUTER JOIN (emulated using UNION)
SELECT 
    E.EmpName, D.DeptName
FROM Employees E
LEFT JOIN Departments D ON E.DeptID = D.DeptID
UNION
SELECT 
    E.EmpName, D.DeptName
FROM Employees E
RIGHT JOIN Departments D ON E.DeptID = D.DeptID;

-- 5. SELF JOIN: Compare employees within same department
SELECT 
    A.EmpName AS Emp1, 
    B.EmpName AS Emp2, 
    A.DeptID
FROM Employees A
JOIN Employees B ON A.DeptID = B.DeptID AND A.EmpID != B.EmpID;

-- 6. CROSS JOIN: Every combination of Employee and Department
SELECT 
    E.EmpName, D.DeptName
FROM Employees E
CROSS JOIN Departments D;







-- Create sample database
CREATE DATABASE IF NOT EXISTS ProductSalesTutorial;
USE ProductSalesTutorial;

-- Drop tables if they exist
DROP TABLE IF EXISTS Sales, Product;

-- Create Product table
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Create Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Insert data into Product
INSERT INTO Product (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 450.00),
(4, 'Monitor', 300.00),
(5, 'Keyboard', 50.00);

-- Insert data into Sales
INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(101, 1, 2, '2025-04-01'),
(102, 2, 5, '2025-04-03'),
(103, 3, 1, '2025-04-05'),
(104, 1, 1, '2025-04-06'),
(105, 4, 3, '2025-04-10');


Select * from product;

select * from sales;

-- 1. INNER JOIN: Show sales with product details
SELECT 
    S.SaleID, P.ProductName, S.Quantity, P.Price, (S.Quantity * P.Price) AS TotalAmount
FROM Sales S
INNER JOIN Product P ON S.ProductID = P.ProductID;

-- 2. LEFT JOIN: Show all products, even if they haven't been sold
SELECT 
    P.ProductName, S.Quantity, S.SaleDate
FROM Product P
LEFT JOIN Sales S ON P.ProductID = S.ProductID;

-- 3. RIGHT JOIN: Show all sales, even if product info is missing
-- (Simulate case where product is deleted but sale still exists)
-- Add one such entry first for demo:
INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(106, 999, 1, '2025-04-15'); -- Product 999 doesn't exist

SELECT 
    S.SaleID, P.ProductName, S.Quantity
FROM Sales S
RIGHT JOIN Product P ON S.ProductID = P.ProductID;

-- 4. FULL OUTER JOIN (emulated)
SELECT 
    P.ProductName, S.SaleID, S.Quantity
FROM Product P
LEFT JOIN Sales S ON P.ProductID = S.ProductID
UNION
SELECT 
    P.ProductName, S.SaleID, S.Quantity
FROM Product P
RIGHT JOIN Sales S ON P.ProductID = S.ProductID;

-- 5. CROSS JOIN: Show all combinations (not usually useful in sales, but for demo)
SELECT 
    P.ProductName, S.SaleID
FROM Product P
CROSS JOIN Sales S;

-- View all data
SELECT * FROM Product;
SELECT * FROM Sales;

