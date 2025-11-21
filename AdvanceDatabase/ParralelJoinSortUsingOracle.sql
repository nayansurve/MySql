--  Parallel Join, Sorting and Aggregates in Oracle

--  1. Create Tables
-- CREATE TABLE Employee1 (
--     emp_id NUMBER,
--     emp_name VARCHAR2(50),
--     dept_id NUMBER,
--     salary NUMBER
-- );

-- CREATE TABLE Department1 (
--     dept_id NUMBER,
--     dept_name VARCHAR2(50)
-- );

--  2. Insert Data
-- INSERT INTO Department1 VALUES (101, 'HR');
-- INSERT INTO Department1 VALUES (102, 'Sales');
-- INSERT INTO Department1 VALUES (103, 'IT');

-- INSERT INTO Employee1 VALUES (1, 'ABC', 101, 50000);
-- INSERT INTO Employee1 VALUES (2, 'XYZ', 102, 60000);
-- INSERT INTO Employee1 VALUES (3, 'PQR', 103, 70000);

-- 3. Parallel Join
-- SELECT /*+ PARALLEL(e,4) PARALLEL(d,4) */
--        e.emp_id,
--        e.emp_name,
--        d.dept_name
-- FROM Employee1 e
-- JOIN Department1 d
-- ON e.dept_id = d.dept_id;

--  4. Parallel Sorting
-- SELECT /*+ PARALLEL(4) */
--        *
-- FROM Employee1
-- ORDER BY salary DESC; 

--  5. Parallel Aggregates
-- SELECT /*+ PARALLEL(4) */
--        dept_id,
--        SUM(salary)  AS total_salary,
--        AVG(salary)  AS average_salary,
--        COUNT(*)     AS total_employees,
--        MAX(salary)  AS highest_salary,
--        MIN(salary)  AS lowest_salary
-- FROM Employee1
-- GROUP BY dept_id;
