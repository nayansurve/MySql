create database  bank_db;
use bank_db;

create table Account(id int primary key, name varchar(50),balance varchar(50));

insert into Account values(101, 'Nayan',3000);
insert into Account values(102, 'Sarthak',5000);

select *from Account;
DELIMITER //
create procedure AccountProcedure( IN Sender_ID int, IN  Receiver_ID int , IN Transfer_Amount int)
begin
declare Sender_Balance int;
START TRANSACTION;
select balance into  Sender_Balance
from Account 
where id=Sender_ID;
if Sender_Balance >= Transfer_Amount then
update Account 
set balance=balance-Transfer_Amount
where id=Sender_ID;
update Account 
set balance=balance+Transfer_Amount
where id=Receiver_ID;
commit;
else
 rollback;
END IF;
END//
DELIMITER ;


call AccountProcedure(101,102,1000);
select * from Account;

