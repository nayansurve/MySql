-- Implement Parallel join ,sorting and aggregates

use external;
CREATE TABLE Employee1 (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

CREATE TABLE Department1 (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO Department1 VALUES
(101, 'HR'), (102, 'Sales'), (103, 'IT');

INSERT INTO Employee1 VALUES
(1, 'ABC', 101, 50000),
(2, 'XYZ', 102, 60000),
(3, 'PQR', 103, 70000);
-- Parallel Join Query (MySQL)
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employee1 e
JOIN Department1 d
ON e.dept_id = d.dept_id;
-- sorting
SELECT *
FROM Employee1
ORDER BY salary DESC;
-- Aggreagte in mysql
SELECT 
    dept_id,

    SUM(salary)  AS total_salary,        -- Total salary
    AVG(salary)  AS average_salary,      -- Average salary
    COUNT(*)     AS total_employees,     -- Number of employees
    MAX(salary)  AS highest_salary,      -- Maximum salary
    MIN(salary)  AS lowest_salary        -- Minimum salary

FROM Employee1
GROUP BY dept_id;



