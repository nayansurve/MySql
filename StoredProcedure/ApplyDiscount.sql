-- create a store procedure for applying the discount 
-- here i am applying a discount on 
-- i need order id ,discountcode,discount percentage,total amount 

DELIMITER //
create procedure ApplyDiscount(
in p_order_id int,
in p_discount_code varchar(50) )

begin
-- here i am declaring the variable 
 declare v_discount double;
 declare v_total  double;
 
 -- retriving the percentage from the discount code table 
 select discount_percentage into v_discount
 from discount_codes
 where code=p_discount_code and now() between start_date and end_date;
 
 -- here we need to get total amount from the orders 
 
 if v_discount is not null then
 select total_amount into v_total
 from orders
 where id=p_order_id;
 
 -- now let's apply discount 
  set v_total=v_total-(v_total*(v_discount/100));
  
  -- updating the amount where we apply the dicount 
  
 update orders set total_amount=v_total
 where id=p_order_id;
 else
 signal sqlstate '45000' set message_text="no discount!!!!***invalid code***";
 end if;
end //

DELIMITER ;

drop procedure ApplyDiscount;

 select* from discount_codes
 where code="DIWALI23";
call ApplyDiscount(1,"DIWALI23");
