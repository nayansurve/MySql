-- creating a stored procedure for the project reviews 
-- so here for product reviews i want product id ,user id , reviews ,rating

-- creating a stored procedure 

DELIMITER //

create procedure Product_Reviews(
in p_product_id int,
in p_user_id int,
in rating int,
in p_reviews text
)

begin
insert into reviews(  product_id,user_id,rating,review_text,)values(p_product_id ,
 p_user_id ,
 rating,
 p_reviews 
);

end //


DELIMITER ;

drop procedure Product_Reviews;
call Product_Reviews(1,2,"good",3);

select * from reviews;