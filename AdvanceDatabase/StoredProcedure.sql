create database StoredProcedure;
use StoredProcedure;
create table Store1 (id int,name varchar(50),address varchar(50));

insert into Store1 values( 101,'xyz','gargoti');

select * from Store1;

DELIMITER //

create procedure getUserByID(IN userID int)
begin 
select * from Store1 where id=userId;
end //

DELIMITER 

call getUserByID(101);

desc Store1;

DELIMITER //
create procedure GetGradeMessage(in Grade int)
begin 
declare  Grade_Message varchar(266);
case
when Grade >=90 then set Grade_Message='Excellent';
when Grade >=80 then set Grade_Message='very good';
when Grade >=70 then set Grade_Message='good';
when Grade >=60 then set Grade_Message='satisfactory';
else
set Grade_Message='Need Improvement';
end case;
select Grade_Message as message;
END //
DELIMITER  

call GetGradeMessage(90);






DELIMITER //

CREATE PROCEDURE ExampleProcedure1(
    IN in_param INT,
    OUT out_param VARCHAR(255),
    INOUT inout_param INT
)
BEGIN
    -- Process the IN parameter
    -- This is just an example, you can perform any operations here
    SET out_param = CONCAT('Input parameter value is: ', in_param);

    -- Process the INOUT parameter
    -- This is just an example, you can perform any operations here
   
    SET inout_param = inout_param * 2;
END //

DELIMITER ;
 set @inout_param=5;
CALL ExampleProcedure1(2, @out_param, @inout_param);
SELECT @out_param, @inout_param;

