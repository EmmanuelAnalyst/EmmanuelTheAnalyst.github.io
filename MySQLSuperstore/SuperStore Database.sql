use superstore;
-- FOR EASY JOINING OF COLUMNS FROM DIFFERENT TABLE, I LISTED ALL THE COLUMN FROM EACH TABLE BELOW

-- select * from customers; -- index_id, customer_id, customer_name, segment, state, postal_code, region
-- select * from orders;    -- index_id, order_id, order_date, ship_date, ship_mode
-- select * from products;  -- index_id, product_id, category, sub_category, sales, quantity, profit


-- ALL TABLES WERE JOINED USING A COMMON ID i.e the (index_id)

select row_number() over (order by segment) as row_num, -- row number for data orderlinnes
c.customer_id, c. customer_name, c.state, c.region,
o.order_id, o.order_date, o.ship_date, o.ship_mode,
p.product_id, p.sub_category as product_name, p.quantity, 
case -- case statement to show the supply rate of each quantity
when quantity <= 5 then 'low supply'
when quantity between 6 and 10 then 'medium supply'
when quantity > 10 then 'high supply'
else 'No order'
end as supply_rate,  -- supply rate of each quantity from product_name
p.sales, p.profit,
first_value(customer_name) over (partition by region order by sales desc) as highest_sales,   
-- This shows the region and the highest sales made from the customers
first_value(customer_name) over (partition by state order by profit desc) as highest_profit  
-- This shows the state and the highest profit made from the customer 
from customers c
inner join orders o
    using(index_id)
inner join products p
    using(index_id)
where profit > (select avg(profit) from products)  
-- The subquery shows the total average profit which is = 17.05
-- This query shows the profits greater than the subquery (total average profit made) i.e profit > 17.05(total average profit)
group by order_id -- This group by statement removes duplicate order_id or shows the distinct order_id

 
 -- I CREATED FEW DELIMITERS TO SHOW THE CUSTOMERS FROM EACH REGION

delimiter // -- Delimiter for the East region
create procedure East_region()
begin
select region, customer_id, customer_name, segment, state, postal_code
from customers
where region = 'East';
end //
delimite ;

call East_region();


delimiter // -- Delimiter for the South region
create procedure South_region()
begin
select region, customer_id, customer_name, segment, state, postal_code
from customers
where region = 'South';
end //
delimiter ;

call South_region()


delimiter // -- Delimiter for the West region
create procedure West_region()
begin
select region, customer_id, customer_name, segment, state, postal_code
from customers
where region = 'West';
end //
delimiter ;

call West_region();


delimiter // -- Delimter for the Central region
create procedure Central_region()
begin
select region, customer_id, customer_name, segment, state, postal_code
from customers
where region = 'Central';
end //
delimiter ;

call Central_region();

-- I CREATED VIEWS TO SHOW THE DIFFERENT FORM OF SHIPPING MODES

create view StandardClass_ship_mode
as
select ship_mode, order_id, order_date, ship_date
from orders
where ship_mode = 'Standard Class';

select * from StandardClass_ship_mode; -- This shows the order_id, order_date, ship_date and ship_mode made with Standard Class only


create view FirstClass_ship_mode
as
select ship_mode, order_id, order_date, ship_date
from orders
where ship_mode = 'First Class';

select * from FirstClass_ship_mode; -- This shows the order_id, order_date, ship_date and ship_mode made with First Class only