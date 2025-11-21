create database External;

create table Student(id int ,name varchar(50),dept varchar(50));
insert into Student values(1,'abc','IT');
insert into Student values(2,'xyz','CSE');
insert into Student values(3,'lmn','ETC');
insert into Student values(4,'pqr','mech');
insert into Student values(5,'stu','civil');

create table Department(dept_id int,dept_name varchar(50))
insert into Department values(101,'IT');
insert into Department values(102,'CSE');
insert into Department values(103,'ETC');
insert into Department values(104,'mech');
insert into Department values(105,'civil');

-- merge join
select * from Student
join Department 
on Student.dept=Department.dept_name;

