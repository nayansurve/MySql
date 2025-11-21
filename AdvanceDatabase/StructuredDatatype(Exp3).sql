-- create structured datatype of ORDBMS and perform  opearation Created Table Using Structured Datatype insert data and solved queries

-- 1. Create Structured Datatype
-- create or replace Type EmpType As a object (this is not supporting in mysql It Is available in Oracle)

use External;


CREATE TABLE EmployeeObj (
    emp JSON
);


-- inserting data 
INSERT INTO EmployeeObj VALUES
(JSON_OBJECT(
    'id', 101,
    'name', 'abc',
    'salary', 50000,
    'date', STR_TO_DATE('03-10-2025', '%d-%m-%Y'),
    'email', 'surve@.com'
));

INSERT INTO EmployeeObj VALUES
(JSON_OBJECT(
    'id', 102,
    'name', 'xyz',
    'salary', 70000,
    'date', STR_TO_DATE('06-09-2025', '%d-%m-%Y'),
    'email', 'Walake@.com'
));

INSERT INTO EmployeeObj VALUES
(JSON_OBJECT(
    'id', 103,
    'name', 'pqr',
    'salary', 80000,
    'date', STR_TO_DATE('05-07-2025', '%d-%m-%Y'),
    'email', 'salokhe@.com'
));
INSERT INTO EmployeeObj VALUES
(JSON_OBJECT(
    'id', 102,
    'name', 'xyz',
    'salary', 70000,
    'date', STR_TO_DATE('06-09-2025', '%d-%m-%Y'),
    'email', 'Walake@.com'
));
INSERT INTO EmployeeObj VALUES
(JSON_OBJECT(
    'id', 103,
    'name', 'pqr',
    'salary', 80000,
    'date', STR_TO_DATE('05-07-2025', '%d-%m-%Y'),
    'email', 'salokhe@.com'
));

SELECT * FROM EmployeeObj;


-- Access Individual Attributes

-- Select name:
SELECT emp->>"$.name" AS name FROM EmployeeObj;
 --  Get id + name + salary:
SELECT 
  emp->>"$.id" AS id,
  emp->>"$.name" AS name,
  emp->>"$.salary" AS salary
FROM EmployeeObj;


