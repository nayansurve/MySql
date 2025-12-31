-- creating a stored procedure for updating user information 
-- means here i want update username password email address of one user 
-- need user id for updating user data 

-- creating stored procedure 
DELIMITER //

 create procedure UpdateUser(
 in p_id int,
 in p_username varchar(50),
 in p_password  int
 )
 begin
 -- updating user's username and password 
 update users set username=p_username , password=p_password
 where id=p_id;
 
 end //
 
 DELIMITER ;
 
 drop procedure UpdateUser;
 
 call UpdateUser(4,"xyz",0000);
 
 -- 10:57:07	call UpdateUser(2,"soni",123459)	Error Code: 1292. Truncated incorrect DOUBLE value: 'soni'	0.000 sec  got this error because i am using a and operator which is not valid
 -- AND is a logical operator (used in WHERE, not SET)
 
select * from users;