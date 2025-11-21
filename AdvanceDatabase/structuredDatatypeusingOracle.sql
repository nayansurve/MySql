-- using oracle 

--  Create Structured Datatype (OBJECT TYPE)
-- CREATE OR REPLACE TYPE EmpType AS OBJECT (
--     id      NUMBER,
--     name    VARCHAR2(50),
--     salary  NUMBER,
--     doj     DATE,
--     email   VARCHAR2(100)
-- );

-- 2. Create a Table Using This Structured Datatype
-- CREATE TABLE EmployeeObj OF EmpType;
-- inserting data
-- INSERT INTO EmployeeObj VALUES (EmpType(101, 'abc', 50000, TO_DATE('03-10-2025','DD-MM-YYYY'), 'surve@.com'));

-- INSERT INTO EmployeeObj VALUES (EmpType(102, 'xyz', 70000, TO_DATE('06-09-2025','DD-MM-YYYY'), 'Walake@.com'));

-- INSERT INTO EmployeeObj VALUES (EmpType(103, 'pqr', 80000, TO_DATE('05-07-2025','DD-MM-YYYY'), 'salokhe@.com'));

-- INSERT INTO EmployeeObj VALUES (EmpType(102, 'xyz', 70000, TO_DATE('06-09-2025','DD-MM-YYYY'), 'Walake@.com'));

-- INSERT INTO EmployeeObj VALUES (EmpType(103, 'pqr', 80000, TO_DATE('05-07-2025','DD-MM-YYYY'), 'salokhe@.com'));


-- display all records
-- SELECT * FROM EmployeeObj;


-- 5. Access Individual Attributes (Oracle Syntax)
-- ✔ Get all names:
-- SELECT name FROM EmployeeObj;

-- ✔ Get id + name + salary:
-- SELECT id, name, salary
-- FROM EmployeeObj;

-- Get email where salary > 60000:
-- SELECT name, email
-- FROM EmployeeObj
-- WHERE salary > 60000;