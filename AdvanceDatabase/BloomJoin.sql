-- Bloom Join
use External;
CREATE TABLE Department5 (
    dept_id int PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee5 (
    emp_id int PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id int,
    salary int
);
INSERT INTO Department5 VALUES (101, 'HR');
INSERT INTO Department5 VALUES (102, 'Sales');
INSERT INTO Department5 VALUES (103, 'IT');

INSERT INTO Employee5 VALUES (1, 'Amit', 101, 50000);
INSERT INTO Employee5 VALUES (2, 'Naina', 102, 60000);
INSERT INTO Employee5 VALUES (3, 'Rahul', 104, 70000);   -- invalid dept
INSERT INTO Employee5 VALUES (4, 'Sneha', 103, 65000);
INSERT INTO Employee5 VALUES (5, 'Sameer', 106, 72000); -- invalid dept

COMMIT;

-- Simulating Bloom Filter
SELECT dept_id FROM Department;

-- Filter Employee Table Using Bloom Filter (Site A)

CREATE TABLE Employee_Filtered1 AS
SELECT *
FROM Employee5
WHERE dept_id IN (SELECT dept_id FROM Department);


-- Final Join (Site B)
SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employee_Filtered1 e
JOIN Department5 d
ON e.dept_id = d.dept_id;