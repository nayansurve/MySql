-- Implement Semi Join in Distributed DBMS
------------------------------------------------------------
-- SEMI JOIN IMPLEMENTATION IN DISTRIBUTED DBMS
------------------------------------------------------------

-- 1. CREATE TABLES (Consider these at different sites)
------------------------------------------------------------

-- Site A : Employee Table
CREATE TABLE Employee4 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Site B : Department Table
CREATE TABLE Department4 (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

------------------------------------------------------------
-- 2. INSERT DATA
------------------------------------------------------------

-- Insert into Department (Site B)
INSERT INTO Department4 VALUES 
(101, 'HR'),
(102, 'Sales'),
(103, 'IT');

-- Insert into Employee (Site A)
INSERT INTO Employee4 VALUES
(1, 'Amit', 101, 50000),
(2, 'Naina', 102, 60000),
(3, 'Rahul', 104, 70000),   -- dept_id 104 does NOT exist
(4, 'Sneha', 103, 65000);

------------------------------------------------------------
-- 3. SEMI JOIN IMPLEMENTATION
-- We want only employees whose department exists in Department table.
------------------------------------------------------------

SELECT *
FROM Employee4 e
WHERE EXISTS (
    SELECT 1 
    FROM Department d 
    WHERE e.dept_id = d.dept_id
);

------------------------------------------------------------
-- OR USING IN (Second method)
------------------------------------------------------------

SELECT *
FROM Employee4
WHERE dept_id IN (SELECT dept_id FROM Department);

------------------------------------------------------------
-- END OF FILE
------------------------------------------------------------


