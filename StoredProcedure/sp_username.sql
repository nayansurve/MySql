-- creating a store procedure for the user registration 
-- for creating store procedure for the user registration i want username,password,email,and address
-- let's start

DELIMITER //

create procedure UserRegistration( 
in p_username varchar(50), -- declaration 
in p_password int,in p_email varchar(50),
in p_address text)
begin
-- data insert into users  table
insert into users(username,password,email,address)values(p_username,p_password,p_email,p_address);
end //

DELIMITER ;
-- call the stored procedure 
call UserRegistration("Shriyansh",1234567,"shriyu25@gmail.com","Gargoti")

select * from users;
