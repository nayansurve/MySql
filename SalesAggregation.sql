-- creating a stored procedure for monthly sales aggregation
-- so here we need to calculate sum of total amount per month
-- price * quantity


-- creating a stored procedure 

DELIMITER //

create procedure SalesAggregation(
in p_month int,
in p_year int)

begin
select p.id as product_id,p.name as product_name,
sum(oi.quantity) as total_quantity_sold,
sum(oi.quantity * p.price) as total_sales
from orders o
join order_items oi on o.id=oi.order_id
join products p on oi.item_id=p.id
where year(o.order_date)=p_year and month(o.order_date)=p_month
group by p.id,p.name;

end //


DELIMITER ;


drop procedure SalesAggregation;
call SalesAggregation(7,2024);