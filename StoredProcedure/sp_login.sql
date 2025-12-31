-- create a store procedure for user login
-- i want login a page so i need my username and password 

-- creating a stored procedure

DELIMITER //

create procedure Login( 
in p_username varchar (50),
in p_password int)
begin
select id,username,password from users where p_username=username and p_password=password;
end //


DELIMITER ;

call Login("Shriyansh",1234567)

select * from users;