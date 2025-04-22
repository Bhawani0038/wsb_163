
-- MySQL Built-in Functions: Use Cases and Examples

-- Create a sample table for string and aggregate function examples
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10, 2),
    join_date DATE
);

-- Insert sample data
INSERT INTO employees (first_name, last_name, salary, join_date) VALUES
('John', 'Doe', 10000.00, '2022-01-15'),
('Jane', 'Smith', 12000.00, '2022-03-10'),
('Alice', 'Johnson', 9500.00, '2022-07-21'),
('Bob', 'Brown', 8500.00, '2023-01-30'),
('Charlie', 'Davis', 10000.00, '2023-06-01');

-- String Functions
SELECT CONCAT(first_name, ' ', last_name) AS FullName FROM employees;
SELECT LENGTH(first_name) AS NameLength FROM employees;
SELECT SUBSTRING(first_name, 1, 3) AS ShortName FROM employees;

-- Numeric Functions
SELECT salary, ROUND(salary, -3) AS RoundedSalary FROM employees;
SELECT salary, CEIL(salary) AS CeilSalary FROM employees;
SELECT salary, FLOOR(salary) AS FloorSalary FROM employees;

-- Date and Time Functions
SELECT NOW() AS CurrentDateTime;
SELECT DATE_FORMAT(join_date, '%M %d, %Y') AS FormattedJoinDate FROM employees;
SELECT DATEDIFF(NOW(), join_date) AS DaysWorked FROM employees;

-- Aggregate Functions
SELECT SUM(salary) AS TotalSalaries FROM employees;
SELECT AVG(salary) AS AverageSalary FROM employees;
SELECT COUNT(*) AS TotalEmployees FROM employees;

-- Control Flow Functions
SELECT first_name, salary,
       IF(salary > 10000, 'High', 'Normal') AS SalaryLevel
FROM employees;

SELECT first_name, salary,
       CASE
         WHEN salary >= 12000 THEN 'Excellent'
         WHEN salary >= 10000 THEN 'Good'
         ELSE 'Average'
       END AS Performance
FROM employees;

-- Conversion Functions
SELECT CAST(salary AS CHAR) AS SalaryString FROM employees;
SELECT CONVERT(salary, SIGNED INTEGER) AS SalaryInteger FROM employees;
