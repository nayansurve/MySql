-- create a store procedure for retriveing the order details 
-- so here i want all order details means here i want order id,customer id,order date ,
-- address of order total amount of order date status also discount,order items and so one 
-- retriving menas getting the all the inforamation of order 

-- creating a stored procedure 
 
DELIMITER //
create procedure RetriveOrderDetails(
in p_order_id int)
begin 
 select o.id as order_id, o.order_date, o.shipping_address, o.total_amount, 
oi.item_id, p.name as product_name,oi.quantity,p.price
 from orders o
 join order_items oi on o.id=oi.order_id
 join products p on oi.item_id=p.id
 where o.id=p_order_id;
 

end //

DELIMITER ;

-- drop procedure RetriveOrderDetails; 

call RetriveOrderDetails(1);