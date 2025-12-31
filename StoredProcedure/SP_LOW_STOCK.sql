-- create a stored procedure for low stock alerts 
-- here i want product so i get stock alert 
-- so i want product id and stock details 

-- creating a stored procedure 

DELIMITER //

 create procedure LowStock(
 in p_product_id int)
 begin
  select id,name,stock 
  from products where stock < p_product_id;
  
 end //

DELIMITER ;
call LowStock(300);