/* ============================================================
   IMPLEMENTATION OF OLAP QUERIES USING MYSQL (WORKING VERSION)
   ============================================================ */

DROP DATABASE IF EXISTS OLAPDB;
CREATE DATABASE OLAPDB;
USE OLAPDB;

CREATE TABLE Sales(
    region VARCHAR(20),
    product VARCHAR(20),
    year INT,
    amount INT
);

INSERT INTO Sales VALUES
('North', 'Laptop', 2023, 80000),
('North', 'Mobile', 2023, 50000),
('South', 'Laptop', 2023, 60000),
('South', 'Mobile', 2023, 40000),
('East',  'Laptop', 2023, 45000),
('East',  'Mobile', 2023, 30000),
('North', 'Laptop', 2024, 90000),
('South', 'Mobile', 2024, 55000),
('East',  'Laptop', 2024, 65000);



/* ============================================================
   1. SLICE  (Pick one value of a dimension)
   ============================================================ */
SELECT * FROM Sales WHERE year = 2023;


/* ============================================================
   2. DICE  (Pick multiple conditions)
   ============================================================ */
SELECT * FROM Sales
WHERE region IN ('North','South') AND product='Laptop';


/* ============================================================
   3. DRILL DOWN (More detailed analysis)
   ============================================================ */
SELECT region, product, SUM(amount) AS total_amount
FROM Sales
GROUP BY region, product;


/* ============================================================
   4. DRILL UP (Summary level)
   ============================================================ */
SELECT region, SUM(amount) AS total_sales
FROM Sales
GROUP BY region;


/* ============================================================
   5. ROLLUP (MySQL supports this!)
   Creates: region+product totals, region totals, grand total
   ============================================================ */
SELECT region, product, SUM(amount) AS total_amount
FROM Sales
GROUP BY region, product WITH ROLLUP;


/* ============================================================
   6. CUBE (MySQL simulation)
   We manually combine:
   - region+product
   - region totals
   - product totals
   - grand total
   ============================================================ */

-- A. region + product totals
SELECT region, product, SUM(amount) AS total_amount
FROM Sales
GROUP BY region, product

UNION ALL

-- B. region totals
SELECT region, NULL AS product, SUM(amount) AS total_amount
FROM Sales
GROUP BY region

UNION ALL

-- C. product totals
SELECT NULL AS region, product, SUM(amount) AS total_amount
FROM Sales
GROUP BY product

UNION ALL

-- D. grand total
SELECT NULL AS region, NULL AS product, SUM(amount) AS total_amount
FROM Sales;
