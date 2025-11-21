------------------------------------------------------------
-- DISTRIBUTED DBMS: HORIZONTAL & VERTICAL FRAGMENTATION
------------------------------------------------------------
use External;
-- 1. CREATE MAIN TABLE
CREATE TABLE Employee3 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT,
    city VARCHAR(50)
);

-- 2. INSERT SAMPLE DATA
INSERT INTO Employee3 VALUES
(1, 'Amit', 101, 50000, 'Mumbai'),
(2, 'Naina', 102, 60000, 'Pune'),
(3, 'Rahul', 101, 55000, 'Delhi'),
(4, 'Sneha', 103, 65000, 'Mumbai'),
(5, 'Sameer', 104, 70000, 'Pune'),
(6, 'Meera', 105, 72000, 'Chennai');

------------------------------------------------------------
-- 3. HORIZONTAL FRAGMENTATION
-- Condition-based distribution of rows
------------------------------------------------------------

-- Fragment 1: Employees in Mumbai
CREATE TABLE Emp_Mumbai1 AS
SELECT * FROM Employee3 WHERE city = 'Mumbai';

-- Fragment 2: Employees in Pune
CREATE TABLE Emp_Pune1 AS
SELECT * FROM Employee3 WHERE city = 'Pune';

-- Fragment 3: Employees in other cities
CREATE TABLE Emp_Others1 AS
SELECT * FROM Employee3 WHERE city NOT IN ('Mumbai', 'Pune');

------------------------------------------------------------
-- 4. CHECK HORIZONTAL FRAGMENTS
------------------------------------------------------------

SELECT * FROM Emp_Mumbai1;
SELECT * FROM Emp_Pune1;
SELECT * FROM Emp_Others1;

------------------------------------------------------------
-- 5. RECONSTRUCT ORIGINAL TABLE (Horizontal)
------------------------------------------------------------

SELECT * FROM Emp_Mumbai1
UNION
SELECT * FROM Emp_Pune1
UNION
SELECT * FROM Emp_Others1;

------------------------------------------------------------
-- 6. VERTICAL FRAGMENTATION
-- Splitting table by columns
------------------------------------------------------------

-- Fragment 1: Personal details (including primary key)
CREATE TABLE Emp_Personal1 AS
SELECT emp_id, emp_name, city
FROM Employee3;

-- Fragment 2: Job details (including primary key)
CREATE TABLE Emp_JobInfo1 AS
SELECT emp_id, dept_id, salary
FROM Employee3;

------------------------------------------------------------
-- 7. CHECK VERTICAL FRAGMENTS
------------------------------------------------------------

SELECT * FROM Emp_Personal1;
SELECT * FROM Emp_JobInfo1;

------------------------------------------------------------
-- 8. RECONSTRUCT ORIGINAL TABLE (Vertical)
------------------------------------------------------------

SELECT *
FROM Emp_Personal
NATURAL JOIN Emp_JobInfo;

------------------------------------------------------------
-- END OF FILE
------------------------------------------------------------
