create database StudentDb1;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE
);
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- 1. Select the 2nd Highest Salary

SELECT DISTINCT salary 
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- . Count Employees in Each Department

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Find Duplicate Records
SELECT name, COUNT(*) 
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;

-- Highest Salary from Each Department
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- Get Employees Who Joined in Last 30 Days
SELECT *
FROM employees
WHERE join_date >= CURDATE() - INTERVAL 30 DAY;

-- NNER JOIN (Customers with Orders)
SELECT customers.customer_name, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;


-- LEFT JOIN (Customers with or without Orders)

SELECT customers.customer_name, orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- Find Students Scoring Above Class Average

SELECT *
FROM students
WHERE marks > (SELECT AVG(marks) FROM students);
-- Display Top 5 Salaries
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
-- Get employee with the highest salary using LIMIT
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;
