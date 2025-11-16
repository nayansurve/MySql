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
