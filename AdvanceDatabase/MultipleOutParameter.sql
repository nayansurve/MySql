create database simple;
use simple;
-- if i want to use multiple pramaeters  then we neeed to create on employee table--
 
 create table Emp(id int,name varchar(50),salary double,address varchar(255));
 insert into Emp values(103 ,'Nayan',900000,'Gargoti');
 select * from Emp;
 
 
DELIMITER //
create procedure MultipleOutParam( in emp_ID  int, 
out emp_name varchar(255),
out emp_salary double,
out emp_address varchar(255)
)
-- now here we need to declare variables 
begin 
 declare emp_name_var varchar(255);
 declare emp_salary_var double;
 declare emp_address_var varchar(255);
 -- now we need to retrieves the values from the table 
 select name,salary,address into emp_name_var,emp_salary_var,emp_address_var
 from Emp
 where id = emp_id;
 -- here we need to assign the values 
 SET emp_name=emp_name_var;
 SET emp_salary=emp_salary_var;
 SET emp_address=emp_address_var;
 END //
 DELIMITER ;
 
CALL MultipleOutParam(103, @emp_name, @emp_salary, @emp_address);
select @emp_name, @emp_salary, @emp_address;
 
drop procedure MultipleOutParam;


