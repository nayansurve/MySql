-- implementation of hash join
use External;

create table Employee(id int,name varchar(50),dept_id int);
insert into Employee values(1,'abc',101);
insert into Employee values(2,'lmn',102);
insert into Employee values(3,'pqr',103);
insert into Employee values(4,'xyz',104);
insert into Employee values(5,'mno',105);

create table Deprtament(dept_id int,dept_Name varchar(50));
insert into Deprtament values(101,'Hr');
insert into Deprtament values(102,'Business');
insert into Deprtament values(103,'software developer');
insert into Deprtament values(104,'Caher');
insert into Deprtament values(105,'web ');
-- hash join
select * from Employee
join Deprtament 
On Employee.dept_id=Deprtament.dept_id;



